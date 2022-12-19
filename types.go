package main

import "encoding/xml"

type Option struct {
	Name          string
	Key           string
	HasKey        bool
	TypeValue     string
	DefaultValue  string
	IsDefaultCode bool
	Label         string
	Type          string
	Min           string
	HasMin        bool
	Max           string
	HasMax        bool
	Code          string
	IsCode        bool
	HasChoices    bool
	Choices       []ConfigChoice
}

type OptionGroup struct {
	Options     map[string]*Option
	Description string
	Name        string
}

type Module struct {
	RCName string
	Name   string
	Groups map[string]*OptionGroup
}

type ConfigChoice struct {
	Name  string `xml:"name,attr"`
	Label string `xml:"label"`
}

type ConfigChoices struct {
	Name    string         `xml:"name,attr"`
	Choices []ConfigChoice `xml:"choice"`
}

type ConfigDefault struct {
	Text string `xml:",chardata"`
	Code string `xml:"code,attr"`
}

type ConfigEntry struct {
	Name    string        `xml:"name,attr"`
	Key     string        `xml:"key,attr"`
	Type    string        `xml:"type,attr"`
	Label   string        `xml:"label"`
	Hidden  string        `xml:"hidden"`
	Code    string        `xml:"code"`
	Choices ConfigChoices `xml:"choices"`
	Default ConfigDefault `xml:"default"`
	Min     string        `xml:"min"`
	Max     string        `xml:"max"`
}

type ConfigGroup struct {
	Name    string        `xml:"name,attr"`
	Entries []ConfigEntry `xml:"entry"`
}

type ConfigKcfgFile struct {
	Name string `xml:"name,attr"`
}

type ConfigKcfg struct {
	Name     string
	XMLName  xml.Name       `xml:"kcfg"`
	KcfgFile ConfigKcfgFile `xml:"kcfgfile"`
	Groups   []ConfigGroup  `xml:"group"`
}
