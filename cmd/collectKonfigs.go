package cmd

import (
	"bytes"
	"encoding/base64"
	"encoding/json"
	"encoding/xml"
	"errors"
	"fmt"
	"github.com/spf13/cobra"
	"gopkg.in/yaml.v3"
	"io"
	"io/ioutil"
	"log"
	"net/http"
	"net/url"
	"os"
	"sort"
	"strconv"
	"strings"
	"sync"
	"text/template"
	"time"
)

var repos = []string{
	//source: https://github.com/NixOS/nixpkgs/blob/master/pkgs/applications/kde/default.nix
	"akonadi",
	"akonadi-calendar",
	"akonadi-calendar-tools",
	"akonadi-contacts",
	"akonadi-import-wizard",
	"akonadi-mime",
	"akonadi-notes",
	"akonadi-search",
	"akonadiconsole",
	"akregator",
	"ark",
	"baloo-widgets",
	"bomber",
	"bovo",
	"calendarsupport",
	"dolphin",
	"dolphin-plugins",
	"dragon",
	"elisa",
	"eventviews",
	"falkon",
	"ffmpegthumbs",
	"filelight",
	"granatier",
	"grantleetheme",
	"gwenview",
	"incidenceeditor",
	"k3b",
	"kaccounts-integration",
	"kaccounts-providers",
	"kaddressbook",
	"kalarm",
	"kalendar",
	"kalzium",
	"kamoso",
	"kapman",
	"kapptemplate",
	"kate",
	"katomic",
	"kblackbox",
	"kblocks",
	"kbounce",
	"kbreakout",
	"kcachegrind",
	"kcalc",
	"kcalutils",
	"kcharselect",
	"kcolorchooser",
	"kdebugsettings",
	"kdeconnect-kde",
	"kdegraphics-mobipocket",
	"kdegraphics-thumbnailers",
	"kdenetwork-filesharing",
	"kdenlive",
	"kdepim-addons",
	"kdepim-runtime",
	"kdev-php",
	"kdev-python",
	"kdevelop",
	"kdevelop-pg-qt",
	"kdevelop-unwrapped",
	"kdf",
	"kdialog",
	"kdiamond",
	"keditbookmarks",
	"kfind",
	"kfloppy",
	"kgeography",
	"kget",
	"kgpg",
	"khelpcenter",
	"kidentitymanagement",
	"kig",
	"kigo",
	"killbots",
	"kimap",
	"kio-extras",
	"kio-gdrive",
	"kipi-plugins",
	"kirigami-gallery",
	"kitinerary",
	"kldap",
	"kleopatra",
	"klettres",
	"klines",
	"kmag",
	"kmahjongg",
	"kmail",
	"kmail-account-wizard",
	"kmailtransport",
	"kmbox",
	"kmime",
	"kmines",
	"kmix",
	"kmousetool",
	"kmplot",
	"knavalbattle",
	"knetwalk",
	"knights",
	"knotes",
	"kolf",
	"kollision",
	"kolourpaint",
	"kompare",
	"konqueror",
	"konquest",
	"konsole",
	"kontact",
	"konversation",
	"kontactinterface",
	"korganizer",
	"kpat",
	"kpimtextedit",
	"kpkpass",
	"kpublictransport",
	"kqtquickcharts",
	"krdc",
	"kreversi",
	"krfb",
	"kruler",
	"ksanecore",
	"kshisen",
	"ksmtp",
	"kspaceduel",
	"ksquares",
	"ksudoku",
	"ksystemlog",
	"kteatime",
	"ktimer",
	"ktnef",
	"ktorrent",
	"ktouch",
	"kturtle",
	"kwalletmanager",
	"kwave",
	"libgravatar",
	"libkcddb",
	"libkdcraw",
	"libkdegames",
	"libkdepim",
	"libkexiv2",
	"libkgapi",
	"libkipi",
	"libkleo",
	"libkmahjongg",
	"libkomparediff2",
	"libksane",
	"libksieve",
	"libktorrent",
	"mailcommon",
	"mailimporter",
	"marble",
	"mbox-importer",
	"messagelib",
	"minuet",
	"okular",
	"picmi",
	"pim-data-exporter",
	"pim-sieve-editor",
	"pimcommon",
	"print-manager",
	"rocs",
	"skanlite",
	"skanpage",
	"spectacle",
	"umbrello",
	"yakuake",
	"zanshin",
	//source: https://github.com/NixOS/nixpkgs/blob/master/pkgs/desktops/plasma-5/default.nix
	"aura-browser",
	"bluedevil",
	"breeze-gtk",
	"breeze-qt5",
	"breeze-grub",
	"breeze-plymouth",
	"discover",
	"kactivitymanagerd",
	"kde-cli-tools",
	"kde-gtk-config",
	"kdecoration",
	"kdeplasma-addons",
	"kgamma5",
	"khotkeys",
	"kinfocenter",
	"kmenuedit",
	"kpipewire",
	"kscreen",
	"kscreenlocker",
	"ksshaskpass",
	"ksystemstats",
	"kwallet-pam",
	"kwayland-integration",
	"kwin",
	"kwrited",
	"layer-shell-qt",
	"libkscreen",
	"libksysguard",
	"milou",
	"oxygen",
	"oxygen-sounds",
	"plank-player",
	"plasma-bigscreen",
	"plasma-browser-integration",
	"plasma-desktop",
	"plasma-disks",
	"plasma-integration",
	"plasma-mobile",
	"plasma-nano",
	"plasma-nm",
	"plasma-pa",
	"plasma-remotecontrollers",
	"plasma-sdk",
	"plasma-systemmonitor",
	"plasma-thunderbolt",
	"plasma-vault",
	"plasma-workspace",
	"plasma-workspace-wallpapers",
	"polkit-kde-agent",
	"powerdevil",
	"qqc2-breeze-style",
	"sddm-kcm",
	"systemsettings",
	"xdg-desktop-portal-kde",
	"plasma-applet-caffeine-plus",
	"plasma-applet-virtual-desktop-bar",
	"bismuth",
	"kwin-dynamic-workspaces",
	"kwin-tiling",
	"krohnkite",
	"krunner-ssh",
	"krunner-symbols",
	"kzones",
	"lightly",
	"parachute",
	//source: https://github.com/NixOS/nixpkgs/blob/master/pkgs/applications/plasma-mobile/default.nix
	"alligator",
	"angelfish",
	"audiotube",
	"calindori",
	"kalk",
	"kasts",
	"kclock",
	"keysmith",
	"koko",
	"krecorder",
	"ktrip",
	"kweather",
	"neochat",
	"plasma-dialer",
	"plasma-phonebook",
	"plasma-settings",
	"plasmatube",
	"spacebar",
	//source: https://github.com/NixOS/nixpkgs/blob/master/pkgs/applications/maui/default.nix
	"mauikit",
	"mauikit-accounts",
	"mauikit-filebrowsing",
	"mauikit-imagetools",
	"mauikit-texteditor",
	"mauiman",
	"booth",
	"buho",
	"clip",
	"communicator",
	"index",
	"nota",
	"pix",
	"shelf",
	"station",
	"vvave",
	//source: https://github.com/NixOS/nixpkgs/blob/master/pkgs/development/libraries/kde-frameworks/default.nix
	"attica",
	"bluez-qt",
	"breeze-icons",
	"kapidox",
	"karchive",
	"kcalendarcore",
	"kcodecs",
	"kconfig",
	"kcontacts",
	"kcoreaddons",
	"kdbusaddons",
	"kdnssd",
	"kguiaddons",
	"kholidays",
	"ki18n",
	"kidletime",
	"kirigami2",
	"kitemmodels",
	"kitemviews",
	"kplotting",
	"kquickcharts",
	"kwayland",
	"kwidgetsaddons",
	"kwindowsystem",
	"modemmanager-qt",
	"networkmanager-qt",
	"oxygen-icons5",
	"prison",
	"qqc2-desktop-style",
	"solid",
	"sonnet",
	"syntax-highlighting",
	"threadweaver",
	"kactivities",
	"kactivities-stats",
	"kauth",
	"kcompletion",
	"kcrash",
	"kdoctools",
	"kfilemetadata",
	"kimageformats",
	"kjobwidgets",
	"knotifications",
	"kpackage",
	"kpty",
	"kunitconversion",
	"syndication",
	"baloo",
	"kbookmarks",
	"kcmutils",
	"kconfigwidgets",
	"kdav",
	"kdeclarative",
	"kded",
	"kdesignerplugin",
	"kdesu",
	"kemoticons",
	"kglobalaccel",
	"kiconthemes",
	"kinit",
	"kio",
	"knewstuff",
	"knotifyconfig",
	"kparts",
	"kpeople",
	"krunner",
	"kservice",
	"ktexteditor",
	"ktextwidgets",
	"kwallet",
	"kxmlgui",
	"kxmlrpcclient",
	"plasma-framework",
	"kpurpose",
	"frameworkintegration",
	"kdelibs4support",
	"khtml",
	"kjs",
	"kjsembed",
	"kmediaplayer",
	"kross",
	// additional
	"kwin",
	"breeze",
	"kstars",
	"baloo",
	"discover",
	"fielding",
	"gitklient",
	"haruna",
	"kscreenlocker",
	"plasma-desktop",
}

// collectKonfigsCmd represents the collectKonfigs command
var collectKonfigsCmd = &cobra.Command{
	Use:   "collectKonfigs",
	Short: "Collect kcfg files (konfigs) from the kde github organisation",
	Long: `Collect kcfg files

           Using github code search api you can search for .kcfg and similar files on github.
           The file contents are then stored together with metadata in a yaml file.
           Existing entries will just be updated.
           No existing entries will be removed.

           After collecting the infos, you can proceed with the kcfg2nix command.
`,
	Run: func(cmd *cobra.Command, args []string) {
		tokenFile, err := cmd.Flags().GetString("tokenFile")
		if err != nil {
			log.Fatalf("missing token file: %v", err)
		}
		username, err := cmd.Flags().GetString("username")
		if err != nil {
			log.Fatalf("missing username: %v", err)
		}
		moduleInfosFile, err := cmd.Flags().GetString("moduleInfosFile")
		if err != nil {
			log.Fatalf("missing info file: %v", err)
		}
		urlTemplate, err := cmd.Flags().GetString("urlTemplate")
		if err != nil {
			log.Fatalf("missing info file: %v", err)
		}
		query, err := cmd.Flags().GetString("query")
		if err != nil {
			log.Fatalf("missing info file: %v", err)
		}
		downloader := NewDownloader(tokenFile, username, urlTemplate)

		if query != "" {
			downloader.PopulateFromQuery(moduleInfosFile, query)
			return
		}

		repos, err := cmd.Flags().GetStringSlice("repos")
		if err != nil {
			log.Fatalf("missing repos: %s", err)
		}
		builder := strings.Builder{}
		for _, repo := range repos {
			builder.WriteString(`+repo%3AKDE%2F`)
			builder.WriteString(url.QueryEscape(repo))
			url := builder.String()
			downloader.Populate(moduleInfosFile, url)
			builder = strings.Builder{}
		}
	},
}

func init() {
	rootCmd.AddCommand(collectKonfigsCmd)
	collectKonfigsCmd.Flags().StringP("username", "n", "", "Your github username")
	collectKonfigsCmd.Flags().StringP("tokenFile", "t", "token.secret", "File with a github personal access token")
	urlTemplate := `https://api.github.com/search/code?q=kcfg+xmlns{{ . }}+extension%3Akcfg+extension%3Axml+language%3AXML&type=Code&ref=advsearch&l=XML`
	//urlTemplate := `https://api.github.com/search/code?q=kcfg+xmlns{{ . }}&type=Code`
	collectKonfigsCmd.Flags().StringP("urlTemplate", "u", urlTemplate, "Url template where the kde repo name will be inserted for each repo")
	collectKonfigsCmd.Flags().StringSliceP("repos", "r", repos, "All repo names to search for configs")
	collectKonfigsCmd.Flags().StringP("query", "q", "", "A custom query to search for")
}

type searchResultRepository struct {
	Name string `json:"name"`
}

type searchResultItem struct {
	Name       string                 `json:"name"`
	Path       string                 `json:"path"`
	Url        string                 `json:"url"`
	Repository searchResultRepository `json:"repository"`
}

type searchResult struct {
	TotalCount int                `json:"total_count"`
	Items      []searchResultItem `json:"items"`
}

type Downloader struct {
	client   http.Client
	token    string
	username string
	template *template.Template
}

func NewDownloader(tokenFile, username, url string) *Downloader {
	token, err := ioutil.ReadFile(tokenFile)
	if err != nil {
		log.Fatalf("failed to read github token: %s", err)
	}

	t := template.New("url template")
	t, err = t.Parse(url)
	if err != nil {
		log.Fatalf("failed to parse template: %v", err)
	}
	return &Downloader{
		token:    string(token),
		username: username,
		client:   http.Client{},
		template: t,
	}
}

func (k *Downloader) Populate(file string, repoSearch string) {
	allInfos := LoadInfos(file)

	writer := &strings.Builder{}
	err := k.template.Execute(writer, repoSearch)
	if err != nil {
		log.Fatalf("failed to execute template: %v", err)
	}

	searchUrl := writer.String()
	log.Printf("download from %s", searchUrl)
	r, closeFunc := k.download(searchUrl)
	defer closeFunc()

	result := decodeSearchResult(r)

	log.Printf("found %d results", result.TotalCount)
	for _, i := range result.Items {
		log.Printf("file: %s", i.Path)
	}

	m := &sync.Mutex{}
	wg := &sync.WaitGroup{}
	wg.Add(len(result.Items))
	for _, item := range result.Items {
		if strings.Contains(item.Name, "xsd") || strings.Contains(item.Name, "'%{APPNAMELC}config.kcfg'") || strings.Contains(item.Name, "KDE.xml") {
			fmt.Printf("Skip: %s\n", item)
			wg.Done()
			continue
		}

		i := item
		go k.collectInfoFunc(m, wg, allInfos, i)
	}

	wg.Wait()
	k.exportInfos(file, allInfos)
}

func (k *Downloader) collectInfoFunc(m *sync.Mutex, wg *sync.WaitGroup, infos map[string][]*KfcFileInfo, i searchResultItem) {
	f := k.collectInfos(i)
	if f == nil {
		wg.Done()
		return
	}
	m.Lock()
	if _, ok := infos[i.Repository.Name]; ok {
		isNew := true
		for index, existingInfo := range infos[i.Repository.Name] {
			if existingInfo.Path == f.Path {
				infos[i.Repository.Name][index] = f
				isNew = false
				break
			}
		}

		if isNew {
			infos[i.Repository.Name] = append(infos[i.Repository.Name], f)
		}
	} else {
		infos[i.Repository.Name] = []*KfcFileInfo{f}
	}
	defer m.Unlock()
	defer wg.Done()
}

func (k *Downloader) collectInfos(i searchResultItem) *KfcFileInfo {
	f := &KfcFileInfo{
		Name: i.Name,
		Path: i.Path,
		Url:  i.Url,
	}
	b, closeFunc := k.download(i.Url)
	defer closeFunc()

	dec := json.NewDecoder(b)
	var result KfcFileInfo
	if err := dec.Decode(&result); err != nil {
		log.Printf("failed to decode xml: %v", err)
		return nil
	}
	getKcfg(result)

	f.Download = result.Download
	f.Kcfg = getKcfg(result)
	f.RcName = f.Kcfg.KcfgFile.Name
	return f
}

func getKcfg(result KfcFileInfo) ConfigKcfg {
	content, err := base64.StdEncoding.DecodeString(result.Content)
	if err != nil {
		log.Fatalf("failed to decode content: %v", err)
	}

	dec := xml.NewDecoder(bytes.NewReader(content))
	var doc ConfigKcfg
	if err := dec.Decode(&doc); err != nil {
		log.Printf("failed to parse rc: %v\n%v", err, result)
		return doc
	}
	//for i, group := range doc.Groups {
	//	for j, entry := range group.Entries {
	//		if strings.Contains(entry.Code, "\t") {
	//			doc.Groups[i].Entries[j].Code = strings.ReplaceAll(entry.Code, "\t", "  ")
	//		}
	//	}
	//}
	return doc
}

func decodeSearchResult(r io.ReadCloser) searchResult {
	dec := json.NewDecoder(r)
	var result searchResult
	if err := dec.Decode(&result); err != nil {
		b, readErr := io.ReadAll(r)
		log.Fatalf("failed to decode json search result: %v, %v\n%v", err, readErr, string(b))
	}
	return result
}

func (k *Downloader) download(url string) (io.ReadCloser, func()) {
	if strings.Contains(url, "search") {
		for i := 0; i < 10; i++ {
			fmt.Print(".")
			time.Sleep(time.Second)
		}
	}
	fmt.Println()
	r, _ := http.NewRequest(http.MethodGet, url, nil)
	r.Header.Add("Authorization", "Basic "+basicAuth(k.username, k.token))
	r.Header.Add("user-agent", "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36")
	resp, err := k.client.Do(r)
	if err != nil {
		log.Fatalf("Failed to get %s, %v", url, err)
	}

	remaining, err := strconv.ParseInt(resp.Header.Get("X-Ratelimit-Remaining"), 10, 64)
	if err != nil {
		log.Fatalf("failed to get ratelimit remaining: %v", err)
	}

	log.Printf("limit: %d", remaining)

	//if remaining <= 20 {
	//log.Printf("rate limit: sleep for %ds", 30)
	//time.Sleep(time.Second * 30)
	//}

	return resp.Body, func() {
		err = resp.Body.Close()
		if err != nil {
			log.Fatalf("failed to close body: %v", err)
		}
	}
}

func fileExists(filePath string) bool {
	_, err := os.Stat(filePath)
	return !errors.Is(err, os.ErrNotExist)
}

func LoadInfos(file string) map[string][]*KfcFileInfo {
	if !fileExists(file) {
		_, err := os.Create(file)
		if err != nil {
			log.Fatalf("failed to create infos file: %v", err)
		}
		return map[string][]*KfcFileInfo{}
	}

	b, err := ioutil.ReadFile(file)
	if err != nil {
		log.Fatalf("failed to load infos: %v", err)
	}
	yamlText := strings.ReplaceAll(string(b), "\t", "  ")

	var infos []*RepoKfcFileInfos
	err = yaml.NewDecoder(strings.NewReader(yamlText)).Decode(&infos)
	if err != nil {
		log.Fatalf("failed to decode infos: %v", err)
	}

	allInfos := map[string][]*KfcFileInfo{}
	for _, info := range infos {
		allInfos[info.Name] = info.Infos
	}

	return allInfos
}

func (k *Downloader) exportInfos(file string, infos map[string][]*KfcFileInfo) {
	sortedInfos := sortInfos(infos)

	b, err := yaml.Marshal(sortedInfos)
	if err != nil {
		log.Fatalf("failed to marshal yaml: %v", err)
	}
	err = ioutil.WriteFile(file, b, 0644)
	if err != nil {
		log.Fatalf("failed to export infos: %v", err)
	}
}

func (k *Downloader) PopulateFromQuery(file string, query string) {
	allInfos := LoadInfos(file)

	searchUrl := "https://api.github.com/search/code" + query
	log.Printf("download from %s", searchUrl)
	r, closeFunc := k.download(searchUrl)
	defer closeFunc()

	result := decodeSearchResult(r)

	log.Printf("found %d results", result.TotalCount)
	for _, i := range result.Items {
		log.Printf("file: %s", i.Path)
	}

	m := &sync.Mutex{}
	wg := &sync.WaitGroup{}
	wg.Add(len(result.Items))
	for _, item := range result.Items {
		if strings.Contains(item.Name, "xsd") || strings.Contains(item.Name, "'%{APPNAMELC}config.kcfg'") || strings.Contains(item.Name, "KDE.xml") {
			fmt.Printf("Skip: %s\n", item)
			wg.Done()
			continue
		}

		i := item
		go k.collectInfoFunc(m, wg, allInfos, i)
	}

	wg.Wait()
	k.exportInfos(file, allInfos)
}

func sortInfos(infos map[string][]*KfcFileInfo) []*RepoKfcFileInfos {
	var keys []string
	for k := range infos {
		keys = append(keys, k)
	}
	sort.Strings(keys)

	var sortedInfos []*RepoKfcFileInfos
	for _, k := range keys {
		items := infos[k]
		sort.Slice(items, func(i, j int) bool {
			return items[i].Path < items[j].Path
		})

		sortedInfos = append(sortedInfos, &RepoKfcFileInfos{Name: k, Infos: items})
	}
	return sortedInfos
}

func basicAuth(username, password string) string {
	auth := username + ":" + password
	return base64.StdEncoding.EncodeToString([]byte(auth))
}
