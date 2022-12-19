package cmd

import "encoding/xml"

var RCToModuleMapping = map[string]string{
	"kded_device_automounterrc": "kded_device_automounter",
	"kcminputrc":                "kcminput",
	"kglobalshortcutsrc":        "kglobalshortcuts",
	//"kactivitymanagerdrc":                  "kactivitymanagerd",
	"ksplashrc":                            "ksplash",
	"kwin_rules_dialogrc":                  "kwin_rules_dialog",
	"kmixrc":                               "kmix",
	"kwalletrc":                            "kwallet",
	"kgammarc":                             "kgamma",
	"krunnerrc":                            "krunner",
	"klaunchrc":                            "klaunch",
	"plasmanotifyrc":                       "plasmanotify",
	"systemsettingsrc":                     "systemsettings",
	"kscreenlockerrc":                      "kscreenlocker",
	"kwinrulesrc":                          "kwinrules",
	"khotkeysrc":                           "hotkeys",
	"ksmserverrc":                          "ksmserver",
	"kded5rc":                              "kded5",
	"plasmarc":                             "plasma",
	"kwinrc":                               "kwin",
	"kdeglobals":                           "kdeglobals",
	"baloofilerc":                          "baloo",
	"dolphinrc":                            "dolphin",
	"klipperrc":                            "klipper",
	"plasma-localerc":                      "plasma-locale",
	"kxkbrc":                               "kxkb",
	"ffmpegthumbsrc":                       "ffmpegthumbs",
	"kservicemenurc":                       "kservicemenu",
	"kiorc":                                "kio",
	"spectaclerc":                          "spectacle",
	"kalendarrc":                           "kalendar",
	"GitKlientSettings":                    "GitKlientSettings",
	"tellyskoutrc":                         "tellyskout",
	"akregatorrc":                          "akregator",
	"arkrc":                                "ark",
	"breezerc":                             "breeze",
	"kspreadrc":                            "kspread",
	"plasmacamerarc":                       "plasmacamera",
	"kalendarcontactrc":                    "kalendarcontact",
	"haruna/haruna.conf":                   "haruna",
	"kalziumrc":                            "kalzium",
	"konsolerc":                            "konsole",
	"kontactrc":                            "kontact",
	"konversationrc":                       "konversation",
	"kstarsrc":                             "kstars",
	"kdeveloprc":                           "kdevelop",
	"neochatrc":                            "neochat",
	"org_kde_initialsystemsetup_licenserc": "org_kde_initialsystemsetup_license",
	"pimcommonrc":                          "pimcommon",
	"skanpagerc":                           "skanpage",
	"qmlkonsolerc":                         "qmlkonsole",
	"bytetableviewsettingsrc":              "bytetableviewsettings",
	"configrc":                             "config",
	"fieldingconfigrc":                     "fieldingconfig",
	"infoviewsettingsrc":                   "infoviewsettings",
	"okularrc":                             "okular",
	"discoverrc":                           "discover",
	"elisarc":                              "elisa",
}

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
