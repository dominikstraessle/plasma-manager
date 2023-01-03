package cmd

import "encoding/xml"

var noKonfig = map[string]map[string]string{
	"dolphin": {
		"src/settings/dolphin_directoryviewpropertysettings.kcfg": "dolphinrc",
	},
	"kdevelop": {
		"plugins/makebuilder/makebuilderconfig.kcfg":                                                   "kdeveloprc",
		"app_templates/kdevelop/file_template_template/%{APPNAMELC}/options.kcfg":                      "kdeveloprc",
		"file_templates/classes/private_pointer/options.kcfg":                                          "kdeveloprc",
		"file_templates/classes/qabstractitemmodel/options.kcfg":                                       "kdeveloprc",
		"file_templates/classes/qabstractitemmodel_pimpl/options.kcfg":                                 "kdeveloprc",
		"file_templates/classes/qdialog/options.kcfg":                                                  "kdeveloprc",
		"file_templates/classes/qdialog_pimpl/options.kcfg":                                            "kdeveloprc",
		"file_templates/classes/qt_interface/options.kcfg":                                             "kdeveloprc",
		"file_templates/other/cmake_module/options.kcfg":                                               "kdeveloprc",
		"file_templates/testing/cpp_qtestlib/options.kcfg":                                             "kdeveloprc",
		"file_templates/testing/cpp_qtestlib_kdevelop/options.kcfg":                                    "kdeveloprc",
		"kdevplatform/language/codegen/tests/data/kdevcodegentest/templates/test_options/options.kcfg": "kdeveloprc",
		"kdevplatform/shell/settings/uiconfig.kcfg":                                                    "kdeveloprc",
		"plugins/android/androidpreferencessettings.kcfg":                                              "kdeveloprc",
		"plugins/clangtidy/config/clangtidyconfig.kcfg":                                                "kdeveloprc",
		"plugins/clangtidy/config/clangtidyprojectconfig.kcfg":                                         "kdeveloprc",
		"plugins/clazy/config/globalsettings.kcfg":                                                     "kdeveloprc",
		"plugins/cppcheck/config/globalsettings.kcfg":                                                  "kdeveloprc",
		"plugins/custom-buildsystem/kcfg_custombuildsystemconfig.kcfg":                                 "kdeveloprc",
		"plugins/custom-definesandincludes/kcm_widget/customdefinesandincludes.kcfg":                   "kdeveloprc",
		"plugins/docker/dockerfile-template/options.kcfg":                                              "kdeveloprc",
		"plugins/docker/dockerpreferencessettings.kcfg":                                                "kdeveloprc",
		"plugins/flatpak/flatpak-template/options.kcfg":                                                "kdeveloprc",
		"plugins/heaptrack/config/globalsettings.kcfg":                                                 "kdeveloprc",
		"plugins/ninjabuilder/ninjabuilderconfig.kcfg":                                                 "kdeveloprc",
		"plugins/projectfilter/projectfiltersettings.kcfg":                                             "kdeveloprc",
		"plugins/sourceformatter/config/projectconfig.kcfg":                                            "kdeveloprc",
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
	"plasma-mobile": {
		"containments/homescreens/folio/package/contents/config/main.xml": "plasma-mobilerc",
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
		"src/effects/windowview/windowviewconfig.kcfg":                                     "kwinrc",
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
		"kcms/qtquicksettings/renderer.kcfg":                           "plasma-desktoprc",
	},
	"fielding": {
		"src/fieldingconfig.kcfg": "fieldingrc",
	},
	"discover": {
		"discover/discoversettings.kcfg":   "discoverrc",
		"discover/plasmauserfeedback.kcfg": "discoverrc",
	},
	"plasma-workspace": {
		"applets/analog-clock/contents/config/main.xml":                        "plasma-workspacerc",
		"applets/appmenu/package/contents/config/main.xml":                     "plasma-workspacerc",
		"applets/batterymonitor/package/contents/config/main.xml":              "plasma-workspacerc",
		"applets/calendar/package/contents/config/main.xml":                    "plasma-workspacerc",
		"applets/clipboard/contents/config/main.xml":                           "plasma-workspacerc",
		"applets/devicenotifier/package/contents/config/main.xml":              "plasma-workspacerc",
		"applets/digital-clock/package/contents/config/main.xml":               "plasma-workspacerc",
		"applets/icon/package/contents/config/main.xml":                        "plasma-workspacerc",
		"applets/lock_logout/contents/config/main.xml":                         "plasma-workspacerc",
		"applets/panelspacer/package/contents/config/main.xml":                 "plasma-workspacerc",
		"applets/systemmonitor/systemmonitor/package/contents/config/main.xml": "plasma-workspacerc",
		"applets/systemtray/package/contents/config/main.xml":                  "plasma-workspacerc",
		"lookandfeel/org.kde.breeze/contents/lockscreen/config.xml":            "plasma-workspacerc",
		"wallpapers/color/contents/config/main.xml":                            "plasma-workspacerc",
		"wallpapers/image/imagepackage/contents/config/main.xml":               "plasma-workspacerc",
		"wallpapers/image/slideshowpackage/contents/config/main.xml":           "plasma-workspacerc",
	},
	"plasma-bigscreen": {
		"containments/homescreen/package/contents/config/main.xml": "plasma-bigscreenrc",
	},
	"libksysguard": {
		"faces/facepackages/barchart/contents/config/main.xml":  "libksysguardrc",
		"faces/facepackages/colorgrid/contents/config/main.xml": "libksysguardrc",
		"faces/facepackages/facegrid/contents/config/main.xml":  "libksysguardrc",
		"faces/facepackages/linechart/contents/config/main.xml": "libksysguardrc",
		"faces/facepackages/piechart/contents/config/main.xml":  "libksysguardrc",
		"faces/facepackages/textonly/contents/config/main.xml":  "libksysguardrc",
	},
	"plasma-integration": {
		"src/platformtheme/renderer.kcfg": "plasma-integrationrc",
	},
	"plasma-pa": {
		"applet/contents/config/main.xml": "plasma-parc",
	},

	"kdeclarative": {
		"src/quickaddons/renderer.kcfg": "kdeclarativerc",
	},

	"plasma-remotecontrollers": {
		"src/remotecontrollers.kcfg": "plasma-remotecontrollersrc",
	},

	"sddm-kcm": {
		"src/sddmsettings.kcfg": "sddm-kcmrc",
	},

	"kdeplasma-addons": {
		"applets/binary-clock/package/contents/config/main.xml":  "kdeplasma-addonsrc",
		"applets/colorpicker/package/contents/config/main.xml":   "kdeplasma-addonsrc",
		"applets/dict/package/contents/config/main.xml":          "kdeplasma-addonsrc",
		"applets/fifteenPuzzle/package/contents/config/main.xml": "kdeplasma-addonsrc",
		"applets/fuzzy-clock/package/contents/config/main.xml":   "kdeplasma-addonsrc",
		"applets/grouping/package/contents/config/main.xml":      "kdeplasma-addonsrc",
		"applets/keyboardindicator/contents/config/main.xml":     "kdeplasma-addonsrc",
		"applets/mediaframe/package/contents/config/main.xml":    "kdeplasma-addonsrc",
		"applets/notes/package/contents/config/main.xml":         "kdeplasma-addonsrc",
		"applets/quicklaunch/package/contents/config/main.xml":   "kdeplasma-addonsrc",
		"applets/quickshare/plasmoid/contents/config/main.xml":   "kdeplasma-addonsrc",
		"applets/timer/package/contents/config/main.xml":         "kdeplasma-addonsrc",
		"applets/userswitcher/package/contents/config/main.xml":  "kdeplasma-addonsrc",
		"applets/weather/package/contents/config/main.xml":       "kdeplasma-addonsrc",
		"applets/webbrowser/package/contents/config/main.xml":    "kdeplasma-addonsrc",
		"wallpapers/potd/package/contents/config/main.xml":       "kdeplasma-addonsrc",
	},

	"akonadi": {
		"autotests/libs/testresource/knutresource.kcfg": "akonadirc",
		"src/core/kcfg2dbus.xsl":                        "akonadirc",
		"templates/akonadiresource/src/settings.kcfg":   "akonadirc",
	},

	"kmail": {
		"agents/archivemailagent/settings/archivemailagentsettings.kcfg": "kmailrc",
		"agents/unifiedmailboxagent/settings.kcfg":                       "kmailrc",
	},

	"konqueror": {
		"plugins/webarchiver/app/settings.kcfg": "konquerorrc",
	},

	"messagelib": {
		"messagelist/src/core/settings.kcfg": "messagelibrc",
		"messageviewer/src/messageviewerheaderplugins/defaultgrantleeheaderstyleplugin/settings/defaultgrantleeheaderstyleplugin.kcfg": "messagelibrc",
	},

	"kconfig": {
		"autotests/kconfig_compiler/signals_test.kcfg":           "kconfigrc",
		"autotests/kconfig_compiler/test8a.kcfg":                 "kconfigrc",
		"autotests/kconfig_compiler/test8b.kcfg":                 "kconfigrc",
		"autotests/kconfig_compiler/test8c.kcfg":                 "kconfigrc",
		"autotests/kconfig_compiler/test_emptyentries.kcfg":      "kconfigrc",
		"autotests/kconfig_compiler/test_param_minmax.kcfg":      "kconfigrc",
		"autotests/kconfig_compiler/test_properties_minmax.kcfg": "kconfigrc",
	},

	"kmix": {
		"core/settings.kcfg": "kmixrc",
	},

	"knotes": {
		"noteshared/src/resources/maildirresource.kcfg": "knotesrc",
		"src/settings/knotesglobalconfig.kcfg.cmake":    "knotesrc",
	},

	"plasma-systemmonitor": {
		"src/faces/applicationstable/contents/config/main.xml": "plasma-systemmonitorrc",
		"src/faces/processtable/contents/config/main.xml":      "plasma-systemmonitorrc",
	},

	"libksieve": {
		"src/ksieveui/settings/sieve-editor.kcfg.cmake": "libksieverc",
	},

	"plasma-framework": {
		"autotests/data/testconfigpackage/contents/config/main.xml":                      "plasma-frameworkrc",
		"examples/applets/conditionalloader/contents/config/main.xml":                    "plasma-frameworkrc",
		"examples/applets/config/contents/config/main.xml":                               "plasma-frameworkrc",
		"examples/applets/notes/contents/config/main.xml":                                "plasma-frameworkrc",
		"examples/applets/testshaders/contents/config/main.xml":                          "plasma-frameworkrc",
		"examples/wallpapers/autumn/contents/config/main.xml":                            "plasma-frameworkrc",
		"templates/plasma-wallpaper-with-qml-extension/package/contents/config/main.xml": "plasma-frameworkrc",
		"templates/plasma-wallpaper/package/contents/config/main.xml":                    "plasma-frameworkrc",
	},

	"mailcommon": {
		"src/settings.kcfg":            "mailcommonrc",
		"src/settings/mailcommon.kcfg": "mailcommonrc",
	},
}

var rcToModuleMapping = map[string]string{
	"kactivitymanagerdrc":                  "kactivitymanagerd",
	"alligatorrc":                          "alligator",
	"katomicrc":                            "katomic",
	"kbreakoutrc":                          "kbreakout",
	"klettresrc":                           "klettres",
	"granatierrc":                          "granatier",
	"kapptemplaterc":                       "kapptemplate",
	"kblocksrc":                            "kblocks",
	"bomberrc":                             "bomber",
	"kaddressbookrc":                       "kaddressbook",
	"plasmaparc":                           "plasma-pa",
	"kded_device_automounterrc":            "kded_device_automounter",
	"kcminputrc":                           "kcminput",
	"kglobalshortcutsrc":                   "shortcuts",
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
	"khotkeysrc":                           "khotkeys",
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
	"jpegcreatorrc":                        "kio",
	"ksquaresrc":                           "ksquares",
	"kdiamondrc":                           "kdiamond",
	"khelpcenterrc":                        "khelpcenter",
	"kamosorc":                             "kamoso",
	"kweather/kweatherrc":                  "kweather",
	"spectaclerc":                          "spectacle",
	"kalendarrc":                           "kalendar",
	"GitKlientSettings":                    "GitKlientSettings",
	"tellyskoutrc":                         "tellyskout",
	"akregatorrc":                          "akregator",
	"arkrc":                                "ark",
	"kbouncerc":                            "kbounce",
	"mailcomposerrc":                       "messagelib",
	"messagecorerc":                        "messagelib",
	"mailviewerrc":                         "messagelib",
	"customtemplatesrc":                    "messagelib",
	"templatesconfigurationrc":             "messagelib",
	"kminesrc":                             "kmines",
	"spacebarrc":                           "spacebar",
	"oxygenrc":                             "oxygen",
	"kgetrc":                               "kget",
	"kget_bittorrentfactory.rc":            "kget",
	"kget_checksumsearchfactory.rc":        "kget",
	"kget_metalinkfactory.rc":              "kget",
	"kget_mirrorsearchfactory.rc":          "kget",
	"kget_mmsfactory.rc":                   "kget",
	"kget_multisegkiofactory.rc":           "kget",
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
	"resourcebaserc":                       "akonadi",
	"akonadi_contactrc":                    "akonadi-contacts",
	"akonadi-calendarrc":                   "akonadi-calendar",
	"akonadi_newmailnotifier_agentrc":      "akonadi_newmailnotifier",
	"maildispatcheragentrc":                "akonadi_maildispatcher",
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
	"kmplotrc":                             "kmplot",
	"libkcalutils_htmlexportrc":            "kcalutils",
	"keditbookmarksrc":                     "keditbookmarks",
	"incidenceeditorrc":                    "incidenceeditor",
	"muondatasourcesrc":                    "kconfig",
	"kconfig_compiler_kf5_test_rc":         "kconfig",
	"kconfigdialog_unittestrc":             "kconfigwidgets",
	"kgpgrc":                               "kgpg",
	"kcmfonts":                             "plasma-workspace",
	"ktorrent_ipfilterrc":                  "ktorrent",
	"krfbrc":                               "krfb",
	"klinesrc":                             "klines",
	"akonadi_sendlater_agentrc":            "knotes",
	"webengineurlinterceptoradblockrc":     "kdepim-addons",
	"kigorc":                               "kigo",
	"kastsrc":                              "kasts",
	"krdcrc":                               "krdc",
	"ktorrentrc":                           "ktorrent",
	"test_fileextensions_rc":               "kconfig",
	"kokorc":                               "koko",
	"ktriprc":                              "ktrip",
	"ktorrent_infowidgetrc":                "ktorrent",
	"ktorrent_magnetgeneratorrc":           "ktorrent",
	"test3arc":                             "kconfig",
	"konquerorrc":                          "konqueror",
	"kde4apprc":                            "kdevelop",
	"kapmanrc":                             "kapman",
	"PlasmaUserFeedback":                   "plasma-workspace",
	"bovorc":                               "bovo",
	"eventviewsrc":                         "eventviews",
	"akonadi_mailmerge_agentrc":            "kmail",
	"knetwalkrc":                           "knetwalk",
	"kmahjonggrc":                          "kmahjongg",
	"test7rc":                              "kconfig",
	"akonadi_followupreminder_agentrc":     "kmail",
	"powerdevilrc":                         "powerdevil",
	"ktorrent_logviewerrc":                 "ktorrent",
	"ktorrent_searchrc":                    "ktorrent",
	"examplerc":                            "kconfig",
	"test_statedatarc":                     "kconfig",
	"bluedevilreceiverrc":                  "bluedevil",
	"fileviewgitpluginrc":                  "dolphin-plugins",
	"kollisionrc":                          "kollision",
	"viewerapprc":                          "eventviews",
	"krulerrc":                             "kruler",
	"freespacenotifierrc":                  "plasma-workspace",
	"kmail2rc":                             "kmail",
	"globalnotesettings":                   "knotes",
	"systemmonitorrc":                      "plasma-systemmonitor",
	"ktorrent_bwschedulerrc":               "ktorrent",
	"ktorrent_statsrc":                     "ktorrent",
	"ktscanforlostfilespluginrc":           "ktorrent",
	"test3rc":                              "kconfig",
	"test4rc":                              "kconfig",
	"angelfishrc":                          "angelfish",
	"mailtransports":                       "kmailtransport",
	"knavalbattlerc":                       "knavalbattle",
	"kgeographyrc":                         "kgeography",
	"fileviewhgpluginrc":                   "dolphin-plugins",
	"kaccessrc":                            "plasma-desktop",
	"ktorrent_mediaplayerrc":               "ktorrent",
	"ktscanfolderpluginrc":                 "ktorrent",
	"kreversirc":                           "kreversi",
	"fileviewsvnpluginrc":                  "dolphin-plugins",
	"dotnottrackrc":                        "kdepim-addons",
	"ktorrent_upnprc":                      "ktorrent",
	"test10rc":                             "kconfig",
	"test_enums_and_properties.kcfgc":      "kconfig",
	"test_translation_rc":                  "kconfig",
	"keystatusplasmoidrc":                  "kconfig",
	"okular-generator-ghostscriptrc":       "okular",
	"gwenview_importerrc":                  "gwenview",
	"sometestfilerc":                       "kcmutils",
	"plasma-frameworkrc":                   "plasma-framework",
	"plasma-integrationrc":                 "plasma-integration",
	"kdeclarativerc":                       "kdeclarative",
	"sddm-kcmrc":                           "sddm-kcm",
	"messagelibrc":                         "messagelib",
	"plasma-systemmonitorrc":               "plasma-systemmonitor",
	"libksysguardrc":                       "libksysguard",
	"plasma-parc":                          "plasma-pa",
	"plasma-workspacerc":                   "plasma-workspace",
	"kmailrc":                              "kmail",
	"plasma-remotecontrollersrc":           "plasma-remotecontrollers",
	"knotesrc":                             "knotes",
	"mailcommonrc":                         "mailcommon",
	"plasma-mobilerc":                      "plasma-mobile",
	"kdeplasma-addonsrc":                   "kdeplasma-addons",
	"plasma-desktoprc":                     "plasma-desktop",
	"kconfigrc":                            "kconfig",
	"plasma-bigscreenrc":                   "plasma-bigscreen",
	"libksieverc":                          "libksieve",
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
