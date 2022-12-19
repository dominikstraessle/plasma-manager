package cmd

import (
	"bytes"
	"encoding/base64"
	"encoding/json"
	"encoding/xml"
	"fmt"
	"github.com/spf13/cobra"
	"gopkg.in/yaml.v3"
	"io"
	"io/ioutil"
	"log"
	"net/http"
	"sort"
	"strings"
	"sync"
)

// collectKonfigsCmd represents the collectKonfigs command
var collectKonfigsCmd = &cobra.Command{
	Use:   "collectKonfigs",
	Short: "A brief description of your command",
	Long: `A longer description that spans multiple lines and likely contains examples
and usage of using your command. For example:

Cobra is a CLI library for Go that empowers applications.
This application is a tool to generate the needed files
to quickly create a Cobra application.`,
	Run: func(cmd *cobra.Command, args []string) {
		tokenFile, err := cmd.Flags().GetString("tokenFile")
		if err != nil {
			log.Fatalf("missing token file: %v", err)
		}
		NewDownloader(tokenFile).Populate()

	},
}

func init() {
	rootCmd.AddCommand(collectKonfigsCmd)

	// Here you will define your flags and configuration settings.

	// Cobra supports Persistent Flags which will work for this command
	// and all subcommands, e.g.:
	// collectKonfigsCmd.PersistentFlags().String("foo", "", "A help for foo")

	// Cobra supports local flags which will only run when this command
	// is called directly, e.g.:
	collectKonfigsCmd.Flags().StringP("tokenFile", "t", "token.secret", "File with a github personal access token")
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
	client http.Client
	token  string
}

func NewDownloader(tokenFile string) *Downloader {
	token, err := ioutil.ReadFile(tokenFile)
	if err != nil {
		log.Fatalf("failed to read github token: %s", err)
	}
	return &Downloader{
		token:  string(token),
		client: http.Client{},
	}
}

func (k *Downloader) Populate() {
	r, closer := k.download("https://api.github.com/search/code?q=kcfg+xmlns+language%3AXML+user%3Akde+language%3AXML&type=Code&per_page=100")
	defer closer()

	result := decodeSearchResult(r)

	var allInfos = map[string][]*KfcFileInfo{}
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
	k.exportInfos(allInfos)
}

func (k *Downloader) collectInfoFunc(m *sync.Mutex, wg *sync.WaitGroup, infos map[string][]*KfcFileInfo, i searchResultItem) {
	f := k.collectInfos(i)
	if f == nil {
		wg.Done()
		return
	}
	m.Lock()
	if _, ok := infos[i.Repository.Name]; ok {
		infos[i.Repository.Name] = append(infos[i.Repository.Name], f)
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
	return doc
}

func decodeSearchResult(r io.ReadCloser) searchResult {
	dec := json.NewDecoder(r)
	var result searchResult
	if err := dec.Decode(&result); err != nil {
		log.Fatal(err)
	}
	return result
}

func (k *Downloader) download(url string) (io.ReadCloser, func()) {
	r, _ := http.NewRequest(http.MethodGet, url, nil)
	r.Header.Add("Authorization", "Basic "+basicAuth("dominikstraessle", k.token))
	resp, err := k.client.Do(r)
	if err != nil {
		log.Fatalf("Failed to get %s, %v", url, err)
	}

	return resp.Body, func() {
		err = resp.Body.Close()
		if err != nil {
			log.Fatal(err)
		}
	}
}

func (k *Downloader) exportInfos(infos map[string][]*KfcFileInfo) {
	sortedInfos := sortInfos(infos)

	b, err := yaml.Marshal(sortedInfos)
	if err != nil {
		log.Fatalf("failed to marshal yaml: %v", err)
	}
	err = ioutil.WriteFile("infos.yaml", b, 0644)
	if err != nil {
		log.Fatalf("failed to export infos: %v", err)
	}
}

func sortInfos(infos map[string][]*KfcFileInfo) []struct {
	Name  string
	Infos []*KfcFileInfo
} {
	var keys []string
	for k := range infos {
		keys = append(keys, k)
	}
	sort.Strings(keys)

	var sortedInfos []struct {
		Name  string
		Infos []*KfcFileInfo
	}
	for _, k := range keys {
		items := infos[k]
		sort.Slice(items, func(i, j int) bool {
			return items[i].Path < items[j].Path
		})

		sortedInfos = append(sortedInfos, RepoKfcFileInfos{Name: k, Infos: items})
	}
	return sortedInfos
}

func basicAuth(username, password string) string {
	auth := username + ":" + password
	return base64.StdEncoding.EncodeToString([]byte(auth))
}
