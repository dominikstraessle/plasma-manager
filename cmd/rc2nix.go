package cmd

import (
	"bufio"
	"encoding/json"
	"fmt"
	"io/ioutil"
	"log"
	"os"
	"path"
	"regexp"
	"strings"
	"text/template"
	"unicode"

	"github.com/spf13/cobra"
)

// rc2nixCmd represents the rc2nix command
var rc2nixCmd = &cobra.Command{
	Use:   "rc2nix",
	Short: "A brief description of your command",
	Long: `A longer description that spans multiple lines and likely contains examples
and usage of using your command. For example:

Cobra is a CLI library for Go that empowers applications.
This application is a tool to generate the needed files
to quickly create a Cobra application.`,
	Run: func(cmd *cobra.Command, args []string) {
		fmt.Println("rc2nix called")
		modulesJsonFile, err := cmd.Flags().GetString("modulesJsonFile")
		if err != nil {
			log.Fatalf("missing json file flag: %v", err)
		}
		outputFile, err := cmd.Flags().GetString("outputFile")
		if err != nil {
			log.Fatalf("missing json file flag: %v", err)
		}
		NewRc2Nix(modulesJsonFile).Generate(outputFile)
	},
}

func init() {
	rootCmd.AddCommand(rc2nixCmd)
	rc2nixCmd.Flags().StringP("outputFile", "o", "modules", "Directory where nix modules are generated into")
}

type Rc2Nix struct {
	modules map[string]*Module
}

func NewRc2Nix(modulesJsonFile string) *Rc2Nix {
	b, err := ioutil.ReadFile(modulesJsonFile)
	if err != nil {
		log.Fatalf("failed to load modules: %v", err)
	}

	rc2nix := &Rc2Nix{modules: map[string]*Module{}}

	err = json.Unmarshal(b, &rc2nix.modules)
	if err != nil {
		log.Fatalf("failed to parse modules: %v", err)
	}
	return rc2nix
}

var skipChecks = []string{
	//"hotkeys",
	"shortcuts",
}

type option struct {
	Name  string
	Value string
}

type group struct {
	Name    string
	Options map[string]*option
}

type module struct {
	Name   string
	Groups map[string]*group
}

var modules map[string]*module

var groupBlockList = []string{
	"^(ConfigDialog|FileDialogSize|ViewPropertiesDialog|KPropertiesDialog)$",
	`^\$Version$`,
	"^ColorEffects:",
	"^Colors:",
	"^DoNotDisturb$",
	"^LegacySession:",
	"^MainWindow$",
	"^PlasmaViews",
	"^ScreenConnectors$",
	"^Session:",
}

var keyBlocklist = []string{
	`^activate widget \d+$`,
	"^ColorScheme(Hash)?$",
	"^History Items",
	"^LookAndFeelPackage$",
	"^Recent (Files|URLs)",
	"^Theme$/",
	"^Version$",
	"State$",
	"Timestamp$",
}

func (o *option) GetValue() string {
	if strings.ToLower(o.Value) == "true" || strings.ToLower(o.Value) == "false" {
		return strings.ToLower(o.Value)
	}

	return AsStringName(o.Value)
}

func IsLetter(s string) bool {
	for _, r := range s {
		if !unicode.IsLetter(r) {
			return false
		}
	}
	return true
}

func (o *option) GetName() string {
	if IsLetter(o.Name) {
		return o.Name
	}
	return fmt.Sprintf("%s", o.Name)
}

func AsStringName(text string) string {
	if strings.Contains(text, `"`) {
		return fmt.Sprintf(`''%s''`, text)
	}
	return fmt.Sprintf(`"%s"`, text)
}

var allExistingModules = map[string]*Module{}

func (r *Rc2Nix) Generate(outputFile string) {
	b, err := ioutil.ReadFile("modules.json")
	if err != nil {
		log.Fatalf("Failed to scan existing options: %v", err)
	}
	err = json.Unmarshal(b, &allExistingModules)
	if err != nil {
		log.Fatalf("Failed to unmarshal existing options: %v", err)
	}

	configDir := getConfigDir()
	modules = map[string]*module{}

	for rc, module := range rcToModuleMapping {
		err := parseFile(path.Join(configDir, rc), module)
		if err != nil {
			log.Printf("Failed to parse %s: %v", rc, err)
		}
	}

	cleanupEmptyEntries()

	t, err := template.ParseFiles("cmd/plasma.tpl")

	if err != nil {
		panic(err)
	}

	nix, err := os.Create(outputFile)
	if err != nil {
		log.Fatal(err)
	}
	err = t.Execute(nix, modules)
	if err != nil {
		log.Fatalf("Failed to execute template: %v", err)
	}
}

func cleanupEmptyEntries() {
	for k, m := range modules {
		for k, g := range m.Groups {
			if len(g.Options) == 0 {
				delete(m.Groups, k)
				continue
			}
		}
		if len(m.Groups) == 0 {
			delete(modules, k)
			continue
		}
	}
}

func shouldSkipChecks(moduleName string) bool {
	for _, moduleToSkip := range skipChecks {
		if moduleToSkip == moduleName {
			return true
		}
	}
	return false
}

func parseFile(rc, moduleName string) error {
	if _, ok := allExistingModules[moduleName]; !ok {
		if !shouldSkipChecks(moduleName) {
			log.Printf("Skipping unknown module: %s", moduleName)
			return nil
		}
	}

	file, err := os.Open(rc)
	if err != nil {
		return err
	}
	defer func(file *os.File) {
		err := file.Close()
		if err != nil {

		}
	}(file)

	var module = &module{
		Name:   moduleName,
		Groups: map[string]*group{},
	}
	if m, ok := modules[moduleName]; ok {
		module = m
	}

	scanner := bufio.NewScanner(file)

	var actualGroup *group
	skipGroup := false
	for scanner.Scan() {
		line := scanner.Text()
		lBracket := strings.Index(line, "[")
		rBracket := strings.Index(line, "]")
		if equal := strings.Index(line, "="); equal >= 0 {
			if skipGroup {
				continue
			}
			if key := strings.TrimSpace(line[:equal]); len(key) > 0 {
				if isBlockedKey(key, keyBlocklist) {
					continue
				}
				if _, ok := actualGroup.Options[key]; ok {
					continue
				}
				if isUnknownOption(module.Name, actualGroup.Name, key) {
					continue
				}
				value := ""
				if len(line) > equal {
					value = strings.TrimSpace(line[equal+1:])
				}
				actualGroup.Options[key] = &option{
					Name:  key,
					Value: value,
				}
			}
		} else if lBracket == 0 && rBracket >= 0 {
			if key := strings.TrimSpace(line[lBracket+1 : rBracket]); len(key) > 0 {
				if isBlockedKey(key, groupBlockList) {
					skipGroup = true
					continue
				}
				if isUnknownGroup(module.Name, key) {
					skipGroup = true
					continue
				}
				skipGroup = false
				if g, ok := module.Groups[key]; ok {
					actualGroup = g
				} else {
					actualGroup = &group{
						Name:    key,
						Options: map[string]*option{},
					}
				}
			}
		}
		if actualGroup != nil {
			module.Groups[actualGroup.Name] = actualGroup
		}
	}

	modules[module.Name] = module

	if err := scanner.Err(); err != nil {
		log.Fatal(err)
		return nil
	}

	return nil

}

func isUnknownOption(module string, group string, key string) bool {
	if shouldSkipChecks(module) {
		return false
	}
	_, ok := allExistingModules[module].Groups[group].Options[key]
	return !ok
}

func isUnknownGroup(module, key string) bool {
	if shouldSkipChecks(module) {
		return false
	}
	_, ok := allExistingModules[module].Groups[key]
	return !ok
}

func isBlockedKey(key string, blocklist []string) bool {
	for _, pattern := range blocklist {
		result, err := regexp.MatchString(pattern, key)
		if err != nil {
			log.Fatalf("Failed to match pattern %s: %s", pattern, key)
		}
		if result {
			return true
		}
	}
	return false
}

func getConfigDir() string {
	configDir := os.Getenv("XDG_CONFIG_HOME")
	if configDir == "" {
		homeDir, err := os.UserHomeDir()
		if err != nil {
			log.Fatalf("Failed to get home dir: %v", err)
		}
		configDir = path.Join(homeDir, ".config")
	}
	return configDir
}
