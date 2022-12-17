package main

import (
	"encoding/xml"
	"fmt"
	"log"
	"os"
	"strconv"
	"strings"
	"text/template"
)

type Choice struct {
	Name string `xml:"name,attr"`
}

type Choices struct {
	Name    string   `xml:"name,attr"`
	Choices []Choice `xml:"choice"`
}

type Default struct {
	Text string `xml:",chardata"`
	Code string `xml:"code,attr"`
}

type Entry struct {
	Name    string  `xml:"name,attr"`
	Key     string  `xml:"key,attr"`
	Type    string  `xml:"type,attr"`
	Label   string  `xml:"label"`
	Code    string  `xml:"code"`
	Choices Choices `xml:"choices"`
	Default Default `xml:"default"`
	Min     string  `xml:"min"`
	Max     string  `xml:"max"`
}

type Group struct {
	Name    string  `xml:"name,attr"`
	Entries []Entry `xml:"entry"`
}

type Kcfg struct {
	XMLName xml.Name `xml:"kcfg"`
	Groups  []Group  `xml:"group"`
}

func main() {
	dec := xml.NewDecoder(os.Stdin)
	var doc Kcfg
	if err := dec.Decode(&doc); err != nil {
		log.Fatal(err)
	}

	t, err := template.ParseFiles("options.gonix")

	if err != nil {
		panic(err)
	}

	err = t.Execute(os.Stdout, doc)

	if err != nil {
		panic(err)
	}
}

func (e Entry) DefaultValue() string {
	if e.Default.Code == "true" {
		return fmt.Sprintf(`"%s"`, e.Default.Text)
	}
	switch e.Type {
	case "Int", "Int64":
		if _, err := strconv.ParseInt(e.Default.Text, 10, 64); err != nil {
			return fmt.Sprintf(`"%s"`, e.Default.Text)
		}
		return e.Default.Text
	case "UInt", "UInt64":
		if _, err := strconv.ParseUint(e.Default.Text, 10, 64); err != nil {
			return fmt.Sprintf(`"%s"`, e.Default.Text)
		}
		return e.Default.Text
	case "Double":
		if _, err := strconv.ParseFloat(e.Default.Text, 64); err != nil {
			return fmt.Sprintf(`"%s"`, e.Default.Text)
		}
		if strings.Contains(e.Default.Text, ".") {
			return e.Default.Text
		}
		return fmt.Sprintf("%s.0", e.Default.Text)
	case "Bool":
		if _, err := strconv.ParseBool(e.Default.Text); err != nil {
			return fmt.Sprintf(`"%s"`, e.Default.Text)
		}
		return e.Default.Text
	default:
		return fmt.Sprintf(`"%s"`, e.Default.Text)
	}
}

func (e Entry) TypeValue() string {
	base := "(either str %s)"
	switch e.Type {
	case "Int", "UInt", "Int64", "UInt64":
		return fmt.Sprintf(base, "int")
	case "Double":
		return fmt.Sprintf(base, "float")
	case "Bool":
		return fmt.Sprintf(base, "bool")
	case "String", "Url", "Color", "Font", "Rect", "Size", "Point", "DateTime", "Path", "Password":
		return fmt.Sprintf(base, "str")
	case "StringList":
		return fmt.Sprintf(base, "(listOf str)")
	case "IntList":
		return fmt.Sprintf(base, "(listOf int)")
	case "Enum":
		enum := strings.Builder{}
		enum.WriteString("(enum [ \n")
		for _, c := range e.Choices.Choices {
			enum.WriteString(fmt.Sprintf(`              "%s"
`, c.Name))
		}
		enum.WriteString(fmt.Sprintf(`            ])`))
		return fmt.Sprintf(base, enum.String())
	default:
		return fmt.Sprintf(`"%s"`, e.Default.Text)
	}

}
func (e Entry) HasKey() bool {
	return e.Key != ""
}
func (e Entry) HasMin() bool {
	return e.Min != ""
}
func (e Entry) HasMax() bool {
	return e.Max != ""
}
func (e Entry) IsCode() bool {
	return e.Code == "true"
}
func (e Entry) IsDefaultCode() bool {
	return e.Default.Code == "true"
}
