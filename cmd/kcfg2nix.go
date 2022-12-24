package cmd

import (
	"encoding/json"
	"fmt"
	"io/ioutil"
	"log"
	"os"
	"path"
	"regexp"
	"sort"
	"strconv"
	"strings"
	"text/template"

	"github.com/spf13/cobra"
)

// kcfg2nixCmd represents the kcfg2nix command
var kcfg2nixCmd = &cobra.Command{
	Use:   "kcfg2nix",
	Short: "Generate home-manager modules from the collected .kcfg file definitions",
	Long: `Generates home-manager modules for all available options.

           The available options are stored in the modules.yaml file after they are collected with the collectKonfigs command.
`,
	Run: func(cmd *cobra.Command, args []string) {
		fmt.Println("kcfg2nix called")
		moduleInfosFile, err := cmd.Flags().GetString("moduleInfosFile")
		if err != nil {
			log.Fatalf("missing info file flag: %v", err)
		}
		modulesJsonFile, err := cmd.Flags().GetString("modulesJsonFile")
		if err != nil {
			log.Fatalf("missing json file flag: %v", err)
		}
		nixModulesDirectory, err := cmd.Flags().GetString("nixModulesDirectory")
		if err != nil {
			log.Fatalf("missing directory file flag: %v", err)
		}
		loadedModules := LoadInfos(moduleInfosFile)
		NewKcfg2Nix(modulesJsonFile, nixModulesDirectory).convert(loadedModules)
	},
}

func init() {
	rootCmd.AddCommand(kcfg2nixCmd)
	kcfg2nixCmd.Flags().StringP("nixModulesDirectory", "d", "modules", "Directory where nix modules are generated into")
}

type Kcfg2Nix struct {
	modules             map[string]*Module
	modulesJsonFile     string
	nixModulesDirectory string
}

func NewKcfg2Nix(modulesJsonFile, nixModulesDirectory string) *Kcfg2Nix {
	return &Kcfg2Nix{
		modulesJsonFile:     modulesJsonFile,
		nixModulesDirectory: nixModulesDirectory,
		modules:             map[string]*Module{},
	}
}

func (k *Kcfg2Nix) convert(loaded map[string][]*KfcFileInfo) {
	for repoName, infos := range loaded {
		for _, info := range infos {
			k.scanModules(info, repoName)
		}
	}

	b, err := json.Marshal(k.modules)
	if err != nil {
		log.Fatalf("Failed to create module json: %v", err)
	}
	err = ioutil.WriteFile(k.modulesJsonFile, b, 0644)
	if err != nil {
		log.Fatalf("Failed to save json: %v", err)
	}

	for name, module := range k.modules {
		k.createModule(module, name)
	}

	k.createDefaultNix()
}

func (k *Kcfg2Nix) scanModules(fileInfo *KfcFileInfo, name string) {
	kcfg := fileInfo.Kcfg
	if kcfg.KcfgFile.Name == "" {
		if _, ok := noKonfig[name]; !ok {
			log.Printf("%s: No config file name provided in the .kfg file or via mapping: %s", name, fileInfo.Path)
			return
		}
		if _, ok := noKonfig[name][fileInfo.Path]; !ok {
			log.Printf("%s: No config file name provided in the .kfg file or via mapping: %s", name, fileInfo.Path)
			return
		}
		kcfg.KcfgFile.Name = noKonfig[name][fileInfo.Path]
	}

	if _, ok := rcToModuleMapping[kcfg.KcfgFile.Name]; !ok {
		//For debugging and adding mappings
		//fmt.Println(kcfg.KcfgFile.Name)
		log.Printf("Skip %s: missing rc to module mapping", kcfg.KcfgFile.Name)
		return
	} else {
		kcfg.Name = rcToModuleMapping[kcfg.KcfgFile.Name]
	}

	var module = &Module{
		RCName: kcfg.KcfgFile.Name,
		Name:   kcfg.Name,
		Groups: map[string]*OptionGroup{},
	}

	if m, ok := k.modules[kcfg.Name]; ok {
		module = m
	}

	for _, group := range kcfg.Groups {
		var optionGroup = &OptionGroup{
			Options:     map[string]*Option{},
			Description: group.Name,
			Name:        group.Name,
		}
		if g, ok := module.Groups[group.Name]; ok {
			optionGroup = g
		}

		for _, entry := range group.Entries {
			if entry.Hidden == "true" {
				continue
			}
			if _, ok := optionGroup.Options[entry.Name]; ok {
				continue
			}
			var name string
			if entry.HasKey() {
				name = entry.Key
			} else {
				name = entry.Name
			}
			optionGroup.Options[name] = &Option{
				Name:          AsOptionName(entry.Name),
				Key:           AsOptionName(entry.Key),
				HasKey:        entry.HasKey(),
				TypeValue:     entry.TypeValue(),
				DefaultValue:  entry.DefaultValue(),
				IsDefaultCode: entry.IsDefaultCode(),
				Label:         entry.Label,
				Type:          entry.Type,
				Min:           entry.Min,
				HasMin:        entry.HasMin(),
				Max:           entry.Max,
				HasMax:        entry.HasMax(),
				Code:          entry.Code,
				IsCode:        entry.IsCode(),
				HasChoices:    entry.HasChoices(),
				Choices:       entry.Choices.Choices,
			}
		}

		module.Groups[optionGroup.Name] = optionGroup
	}
	k.modules[kcfg.Name] = module
}

func (k *Kcfg2Nix) createModule(module *Module, name string) {
	t, err := template.ParseFiles("cmd/module.tpl")

	if err != nil {
		panic(err)
	}

	nix, err := os.Create(path.Join(k.nixModulesDirectory, name+".nix"))
	if err != nil {
		log.Fatal(err)
	}
	err = t.Execute(nix, module)
	if err != nil {
		panic(err)
	}
}

func (k *Kcfg2Nix) createDefaultNix() {
	t, err := template.ParseFiles("cmd/default.tpl")

	if err != nil {
		log.Fatalf("failed to parse default.tpl file: %v", err)
	}

	nix, err := os.Create(path.Join(k.nixModulesDirectory, "default.nix"))
	if err != nil {
		log.Fatalf("failed to create default.nix file: %v", err)
	}

	var moduleKeys []string
	for key := range k.modules {
		moduleKeys = append(moduleKeys, key)
	}

	sort.Strings(moduleKeys)
	err = t.Execute(nix, moduleKeys)
	if err != nil {
		log.Fatalf("failed to execute default.nix template: %v", err)
	}
}

func asString(text string) string {
	if strings.Contains(text, `"`) {
		return fmt.Sprintf(`''%s''`, text)
	}
	return fmt.Sprintf(`"%s"`, text)
}
func AsOptionName(text string) string {
	var IsLetter = regexp.MustCompile(`^[a-zA-Z]+$`).MatchString
	if !IsLetter(text) {
		return fmt.Sprintf(`"%s"`, text)
	}
	return text
}
func (e ConfigEntry) DefaultValue() string {
	if e.Default.Code == "true" {
		return asString(e.Default.Text)
	}
	switch strings.ToLower(e.Type) {
	case "int", "int64":
		if _, err := strconv.ParseInt(e.Default.Text, 10, 64); err != nil {
			return fmt.Sprintf(`"%s"`, e.Default.Text)
		}
		return e.Default.Text
	case "uint", "uint64":
		if _, err := strconv.ParseUint(e.Default.Text, 10, 64); err != nil {
			return fmt.Sprintf(`"%s"`, e.Default.Text)
		}
		return e.Default.Text
	case "double":
		if _, err := strconv.ParseFloat(e.Default.Text, 64); err != nil {
			return fmt.Sprintf(`"%s"`, e.Default.Text)
		}
		l := strings.Split(e.Default.Text, ".")
		if strings.Contains(e.Default.Text, ".") {
			if len(l) == 2 && l[1] != "" {
				return e.Default.Text
			}
			return e.Default.Text + "0"
		}
		return fmt.Sprintf("%s.0", e.Default.Text)
	case "bool":
		if val, err := strconv.ParseBool(e.Default.Text); err == nil {
			if val {
				return "true"
			}
			return "false"
		}
		return asString(e.Default.Text)
	default:
		return asString(e.Default.Text)
	}
}

func (e ConfigEntry) TypeValue() string {
	base := "(either str %s)"
	switch strings.ToLower(e.Type) {
	case "int", "uint", "int64", "uint64":
		return fmt.Sprintf(base, "int")
	case "double":
		return fmt.Sprintf(base, "float")
	case "bool":
		return fmt.Sprintf(base, "bool")
	case "string", "url", "color", "font", "rect", "size", "point", "datetime", "path", "password":
		return fmt.Sprintf("str")
	case "stringlist", "qstringlist()", "pathlist":
		return fmt.Sprintf(base, "(listOf str)")
	case "intlist":
		return fmt.Sprintf(base, "(listOf int)")
	case "enum":
		enum := strings.Builder{}
		enum.WriteString("(enum [ \n")
		for _, c := range e.Choices.Choices {
			enum.WriteString(fmt.Sprintf(`              "%s"
`, c.Name))
		}
		enum.WriteString(fmt.Sprintf(`            ])`))
		return fmt.Sprintf(base, enum.String())
	default:
		fmt.Printf("Invalid type: %s\n", e.Type)
		fmt.Printf("Checked as: %s\n", strings.ToLower(e.Type))
		return fmt.Sprintf("str")
	}

}
func (e ConfigEntry) HasKey() bool {
	return e.Key != ""
}
func (e ConfigEntry) HasMin() bool {
	return e.Min != ""
}
func (e ConfigEntry) HasMax() bool {
	return e.Max != ""
}
func (e ConfigEntry) HasChoices() bool {
	if len(e.Choices.Choices) == 0 {
		return false
	}
	return true
}
func (c ConfigChoice) HasLabel() bool {
	return c.Label != ""
}

func (e ConfigEntry) IsCode() bool {
	return e.Code == "true"
}
func (e ConfigEntry) IsDefaultCode() bool {
	return e.Default.Code == "true"
}
