package cmd

import "encoding/xml"

var noKonfig = map[string]map[string]string{
	"dolphin": {
		"src/settings/dolphin_directoryviewpropertysettings.kcfg": "dolphinrc",
	},
	"kdevelop": {
		"plugins/makebuilder/makebuilderconfig.kcfg": "kdeveloprc",
	},
	"akonadi-mime": {
		"src/imapresource.kcfg":           "akonadirc",
		"src/specialmailcollections.kcfg": "akonadirc",
	},
	"elisa": {
		"src/elisa_core.kcfg": "elisarc",
	},
	"kalendar": {
		"src/contacts/applet/package/contents/config/main.xml": "kalendarrc",
	},
	"kcoreaddons": {
		"src/mimetypes/kde5.xml": "kde5rc",
	},
	"kdenlive": {
		"src/kdenlivesettings.kcfg": "kdenliverc",
	},
	"kclock": {
		"src/plasmoid/KClock_1x2/package/contents/config/main.xml": "kclockrc",
	},
	"kdepim-runtime": {
		//"agents/newmailnotifier/newmailnotifieragentsettings.kcfg": "akonadi_newmailnotifier_agent.notifyrc",
		"agents/newmailnotifier/newmailnotifieragentsettings.kcfg": "akonadi_newmailnotifier_agentrc",
		"agents/maildispatcher/maildispatcheragent.kcfg":           "maildispatcheragentrc",
		"resources/birthdays/birthdaysresource.kcfg":               "akonadirc",
		"resources/contacts/contactsresource.kcfg":                 "akonadirc",
		"resources/dav/resource/davgroupwareresource.kcfg":         "akonadirc",
		"resources/etesync/etesyncresource.kcfg":                   "akonadirc",
		"resources/ews/ewsmtaresource.kcfg":                        "akonadirc",
		"resources/ews/ewsresource.kcfg":                           "akonadirc",
		"resources/facebook/settings.kcfg":                         "akonadirc",
		"resources/google-groupware/settingsbase.kcfg":             "akonadirc",
		"resources/ical/icalresource.kcfg":                         "akonadirc",
		"resources/ical/notes/notesresource.kcfg":                  "akonadirc",
		"resources/icaldir/icaldirresource.kcfg":                   "akonadirc",
		"resources/imap/imapresource.kcfg":                         "akonadirc",
		"resources/maildir/maildirresource.kcfg":                   "akonadirc",
		"resources/mbox/mboxresource.kcfg":                         "akonadirc",
		"resources/mixedmaildir/mixedmaildirresource.kcfg":         "akonadirc",
		"resources/openxchange/openxchangeresource.kcfg":           "akonadirc",
		"resources/pop3/settings.kcfg":                             "akonadirc",
		"resources/tomboynotes/tomboynotesresource.kcfg":           "akonadirc",
		"resources/vcard/vcardresource.kcfg":                       "akonadirc",
		"resources/vcarddir/vcarddirresource.kcfg":                 "akonadirc",
	},
	"libgravatar": {
		"src/settings/gravatar.kcfg": "gravatarrc",
	},
	"marble": {
		"src/plasma/applets/worldclock/package/contents/config/main.xml": "marblerc",
		"src/plasma/wallpapers/worldmap/contents/config/main.xml":        "marblerc",
	},
	"okular": {
		"conf/okular.kcfg":      "okularrc",
		"conf/okular_core.kcfg": "okularrc",
	},
	"gui/settings/pimdataexporterglobalconfig.kcfg": {
		"gui/settings/pimdataexporterglobalconfig.kcfg": "undefinedrc",
	},
	"pim-sieve-editor": {
		"src/settings/sieveeditorglobalconfig.kcfg": "sieveeditorrc",
	},
	"pim-data-exporter": {
		"gui/settings/pimdataexporterglobalconfig.kcfg": "undefinedrc",
	},
	"pimcommon": {
		"src/pimcommon/util/imapresource.kcfg": "akonadirc",
	},
	"print-manager": {
		"plasmoid/package/contents/config/main.xml": "undefinedrc",
	},
	"spectacle": {
		"src/Gui/SettingsDialog/spectacle.kcfg": "spectaclerc",
	},
	"kwin": {
		"src/effects/blur/blur.kcfg":                                                       "kwinrc",
		"src/effects/diminactive/diminactive.kcfg":                                         "kwinrc",
		"src/effects/fade/package/contents/config/main.xml":                                "kwinrc",
		"src/effects/fallapart/fallapart.kcfg":                                             "kwinrc",
		"src/effects/kscreen/kscreen.kcfg":                                                 "kwinrc",
		"src/effects/login/package/contents/config/main.xml":                               "kwinrc",
		"src/effects/magiclamp/magiclamp.kcfg":                                             "kwinrc",
		"src/effects/magnifier/magnifier.kcfg":                                             "kwinrc",
		"src/effects/mousemark/mousemark.kcfg":                                             "kwinrc",
		"src/effects/overview/overviewconfig.kcfg":                                         "kwinrc",
		"src/effects/scale/package/contents/config/main.xml":                               "kwinrc",
		"src/effects/sheet/sheet.kcfg":                                                     "kwinrc",
		"src/effects/slide/slide.kcfg":                                                     "kwinrc",
		"src/effects/slidingpopups/slidingpopups.kcfg":                                     "kwinrc",
		"src/effects/thumbnailaside/thumbnailaside.kcfg":                                   "kwinrc",
		"src/effects/trackmouse/trackmouse.kcfg":                                           "kwinrc",
		"src/effects/translucency/package/contents/config/main.xml":                        "kwinrc",
		"src/effects/zoom/zoom.kcfg":                                                       "kwinrc",
		"src/plugins/kdecorations/aurorae/themes/plastik/package/contents/config/main.xml": "kwinrc",
		"src/rulebooksettingsbase.kcfg":                                                    "kwinrc",
		"src/scripts/videowall/contents/config/main.xml":                                   "kwinrc",
	},
	"plasma-desktop": {
		"emojier/emojiersettings.kcfg":                                 "plasmarc",
		"containments/panel/contents/config/main.xml":                  "plasmarc",
		"containments/desktop/package/contents/config/main.xml":        "plasmarc",
		"applets/window-list/contents/config/main.xml":                 "plasmarc",
		"applets/taskmanager/package/contents/config/main.xml":         "plasmarc",
		"applets/showdesktop/package/contents/config/main.xml":         "plasmarc",
		"applets/pager/package/contents/config/main.xml":               "plasmarc",
		"applets/margins-separator/contents/config/main.xml":           "plasmarc",
		"applets/kickoff/package/contents/config/main.xml":             "plasmarc",
		"applets/kimpanel/package/contents/config/main.xml":            "plasmarc",
		"applets/kicker/package/contents/config/main.xml":              "plasmarc",
		"applets/keyboardlayout/contents/config/main.xml":              "plasmarc",
		"solid-device-automounter/lib/DeviceSettings.kcfg":             "plasmarc",
		"toolboxes/desktoptoolbox/contents/config/main.xml":            "plasmarc",
		"applets/showActivityManager/package/contents/config/main.xml": "plasmarc",
	},
	"fielding": {
		"src/fieldingconfig.kcfg": "fieldingrc",
	},
	"discover": {
		"discover/discoversettings.kcfg":   "discoverrc",
		"discover/plasmauserfeedback.kcfg": "discoverrc",
	},
}

var rcToModuleMapping = map[string]string{
	"kactivitymanagerdrc":                  "kactivitymanagerd",
	"kded_device_automounterrc":            "kded_device_automounter",
	"kcminputrc":                           "kcminput",
	"kglobalshortcutsrc":                   "kglobalshortcuts",
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
	"fieldingrc":                           "fielding",
	"infoviewsettingsrc":                   "infoviewsettings",
	"okularrc":                             "okular",
	"discoverrc":                           "discover",
	"elisarc":                              "elisa",
	"yakuakerc":                            "yakuake",
	"gwenviewrc":                           "gwenview",
	"akonadirc":                            "akonadi",
	"akonadi_newmailnotifier_agentrc":      "akonadi",
	"maildispatcheragentrc":                "akonadi",
	"marblerc":                             "marble",
	"kdenliverc":                           "kdenlive",
	"kleopatrarc":                          "kleopatra",
	"kde5rc":                               "kde5",
	"kspaceduelrc":                         "kspaceduel",
	"kblackboxrc":                          "kblackbox",
	"okular-generator-popplerrc":           "okular",
	"kcalcrc":                              "kcalc",
	"kshisenrc":                            "kshisen",
	"kclockrc":                             "kclock",
	"kpatrc":                               "kpat",
	"plasmadialerrc":                       "plasmadialer",
	"undefinedrc":                          "undefined",
	"gravatarrc":                           "gravatar",
	"kcmcddbrc":                            "kcmcddb",
	"vacationsettingsrc":                   "sieve",
	"kio_ftprc":                            "kio_ftp",
	"kioslaverc":                           "kioslave",
	"sieveeditorrc":                        "sieve",
	"ktouch2rc":                            "ktouch2",
	"templateparserrc":                     "templateparser",
	"kalarmrc":                             "kalarm",
	"korganizerrc":                         "korganizer",
	"umbrellorc":                           "umbrellorc",
	"touchpadrc":                           "touchpad",
	"device_automounter_kcmrc":             "device_automounter_kcm",
	"PlasmaDiscoverUpdates":                "discover",
	"kactivitymanagerd-pluginsrc":          "kactivitymanagerd-plugins",
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

type KfcFileInfo struct {
	Name     string     `yaml:"name"`
	Path     string     `yaml:"path"`
	Url      string     `yaml:"url"`
	Download string     `yaml:"download" json:"download_url"`
	Content  string     `yaml:"content" json:"content"`
	RcName   string     `yaml:"rcName"`
	Kcfg     ConfigKcfg `yaml:"kcfg"`
}

type RepoKfcFileInfos struct {
	Name  string
	Infos []*KfcFileInfo
}
