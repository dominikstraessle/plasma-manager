package konfig2nix

import (
	"bytes"
	"encoding/json"
	"encoding/xml"
	"fmt"
	"io/ioutil"
	"log"
	"os"
	"plasma-manager/cmd"
	"sort"
	"strconv"
	"strings"
	"text/template"
)

var modules = map[string]*cmd.Module{}

var noKcfg = map[string]string{
	"bytetableviewsettings.kcfg": "bytetableviewsettingsrc",
	"config.kcfg":                "configrc",
	"fieldingconfig.kcfg":        "fieldingconfigrc",
	"infoviewsettings.kcfg":      "infoviewsettingsrc",
	"kwin.kcfg":                  "kwinrc",
	"okular.kcfg":                "okularrc",
	"spectacle.kcfg":             "spectaclerc",
	"elisa_core.kcfg":            "elisarc",
	"dolphin_directoryviewpropertysettings.kcfg": "dolphinrc",
}

var allModules []string

func blub() {
	dirs, err := os.ReadDir("kcfg/")
	if err != nil {
		log.Fatal(err)
	}

	for _, entry := range dirs {
		kcfg, err := ioutil.ReadFile("kcfg/" + entry.Name())
		if err != nil {
			log.Fatal(err)
		}
		scanModules(kcfg, entry.Name())
	}

	b, err := json.Marshal(modules)
	if err != nil {
		log.Fatalf("Failed to create module json: %v", err)
	}
	err = ioutil.WriteFile("modules.json", b, 0644)
	if err != nil {
		log.Fatalf("Failed to save json: %v", err)
	}

	for s, module := range modules {
		createModule(module, s)
	}

	t, err := template.ParseFiles("default.tpl")

	if err != nil {
		panic(err)
	}

	nix, err := os.Create("modules/default.nix")
	if err != nil {
		log.Fatal(err)
	}
	sort.Strings(allModules)
	err = t.Execute(nix, allModules)
	if err != nil {
		panic(err)
	}

}

func scanModules(kcfg []byte, name string) {
	// get all kcfg files: https://github.com/search?q=filename%3A*.kcfg+user%3AKDE+language%3AXML+language%3AXML&type=Code&ref=advsearch&l=XML&l=XML
	dec := xml.NewDecoder(bytes.NewReader(kcfg))
	var doc cmd.ConfigKcfg
	if err := dec.Decode(&doc); err != nil {
		log.Fatal(err)
	}

	if doc.KcfgFile.Name == "" {
		if _, ok := noKcfg[name]; !ok {
			log.Printf("%s: No config file name provided in the .kfg file or via --file flag", name)
			return
		}
		doc.KcfgFile.Name = noKcfg[name]
	}

	if _, ok := cmd.rCToModuleMapping[doc.KcfgFile.Name]; !ok {
		log.Printf("Skip %s: missing rc to module mapping", doc.KcfgFile.Name)
		return
	} else {
		doc.Name = cmd.rCToModuleMapping[doc.KcfgFile.Name]
	}

	var module = &cmd.Module{
		RCName: doc.KcfgFile.Name,
		Name:   doc.Name,
		Groups: map[string]*cmd.OptionGroup{},
	}

	if m, ok := modules[doc.Name]; ok {
		module = m
	}

	for _, group := range doc.Groups {
		var optionGroup = &cmd.OptionGroup{
			Options:     map[string]*cmd.Option{},
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
			optionGroup.Options[name] = &cmd.Option{
				Name:          entry.Name,
				Key:           entry.Key,
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
	modules[doc.Name] = module
}
func createModule(module *cmd.Module, name string) {
	t, err := template.ParseFiles("module.tpl")

	if err != nil {
		panic(err)
	}

	nix, err := os.Create("modules/" + getModuleName(name))
	if err != nil {
		log.Fatal(err)
	}
	err = t.Execute(nix, module)
	if err != nil {
		panic(err)
	}
}

func getModuleName(name string) string {
	base, _, _ := strings.Cut(name, ".kcfg")
	moduleName := base + ".nix"
	allModules = append(allModules, moduleName)
	return moduleName
}

func AsString(text string) string {
	if strings.Contains(text, `"`) {
		return fmt.Sprintf(`''%s''`, text)
	}
	return fmt.Sprintf(`"%s"`, text)
}
func (e cmd.ConfigEntry) DefaultValue() string {
	if e.Default.Code == "true" {
		return AsString(e.Default.Text)
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
		return AsString(e.Default.Text)
	default:
		return AsString(e.Default.Text)
	}
}

func (e cmd.ConfigEntry) TypeValue() string {
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
func (e cmd.ConfigEntry) HasKey() bool {
	return e.Key != ""
}
func (e cmd.ConfigEntry) HasMin() bool {
	return e.Min != ""
}
func (e cmd.ConfigEntry) HasMax() bool {
	return e.Max != ""
}
func (e cmd.ConfigEntry) HasChoices() bool {
	if len(e.Choices.Choices) == 0 {
		return false
	}
	return true
}
func (c cmd.ConfigChoice) HasLabel() bool {
	return c.Label != ""
}

func (e cmd.ConfigEntry) IsCode() bool {
	return e.Code == "true"
}
func (e cmd.ConfigEntry) IsDefaultCode() bool {
	return e.Default.Code == "true"
}
