{ config, lib, pkgs, ... }:
with lib;
let
  cfg = config.programs.plasma;
  moduleCfg = config.programs.plasma.ktorrent;
in {
  options.programs.plasma.ktorrent = {
    enable = mkEnableOption ''
      Enable ktorrent
    '';
    package = mkOption {
      default = if (pkgs ? ktorrent) then
                        pkgs.ktorrent
                      else
                        (if pkgs.libsForQt5 ? ktorrent then pkgs.libsForQt5.ktorrent else false);
      defaultText = literalExpression "pkgs.ktorrent";
      type = with types; either bool package;
      description = mdDoc "Package to use.";
    };
    "downloads" = with types; mkOption {
      type = submodule {
        options = { 
          allowUnencryptedConnections = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Allow unencrypted connections

              Type: Bool
            '';
          };
          alwaysMinimizeToSystemTray = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Always minimize to system tray on startup.

              Type: Bool
            '';
          };
          autoRenameSingleFileTorrents = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          checkWhenFinished = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          completedDir = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              Folder to move completed downloaded files to

              Type: String
            '';
          };
          cpuUsage = mkOption {
            type = nullOr (either str int);
            default = 50;
            description = ''
              

              Type: Int
              Min: 1
              Max: 250
            '';
          };
          customIP = mkOption {
            type = nullOr str;
            default = "QString()";
            defaultText = "Code: true";
            description = ''
              IP to pass to the tracker

              Type: String
            '';
          };
          decreasePriorityOfStalledTorrents = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          dhtPort = mkOption {
            type = nullOr (either str int);
            default = 7881;
            description = ''
              DHT port

              Type: Int
              Min: 1
              Max: 65535
            '';
          };
          dhtSupport = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Support for DHT

              Type: Bool
            '';
          };
          diskPrealloc = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          downloadBandwidth = mkOption {
            type = nullOr (either str int);
            default = 500;
            description = ''
              Download bandwidth (in kb/s):

              Type: Int
              Min: 0
              Max: 1000000
            '';
          };
          dscp = mkOption {
            type = nullOr (either str int);
            default = 0;
            description = ''
              

              Type: Int
              Min: 0
              Max: 63
            '';
          };
          errorTorrentColor = mkOption {
            type = nullOr str;
            default = "QColor(Qt::red)";
            defaultText = "Code: true";
            description = ''
              

              Type: Color
            '';
          };
          fullDiskPrealloc = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          goodShareRatioColor = mkOption {
            type = nullOr str;
            default = "QColor(40, 205, 40)";
            defaultText = "Code: true";
            description = ''
              

              Type: Color
            '';
          };
          greenRatio = mkOption {
            type = nullOr (either str float);
            default = 0.8;
            description = ''
              

              Type: Double
              Min: 0
            '';
          };
          guiUpdateInterval = mkOption {
            type = nullOr (either str int);
            default = 1000;
            description = ''
              GUI update interval

              Type: Int
              Min: 500
              Max: 5000
            '';
          };
          highlightNewTorrents = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          highlightTorrentNameByTrackerStatus = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          httpProxy = mkOption {
            type = nullOr str;
            default = "QString()";
            defaultText = "Code: true";
            description = ''
              

              Type: String
            '';
          };
          httpProxyPort = mkOption {
            type = nullOr (either str int);
            default = 8080;
            description = ''
              

              Type: Int
              Min: 1
              Max: 65535
            '';
          };
          keepSeeding = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Keep seeding after download has finished

              Type: Bool
            '';
          };
          lastSaveDir = mkOption {
            type = nullOr str;
            default = "QString()";
            defaultText = "Code: true";
            description = ''
              Directory which was used as the last save directory

              Type: String
            '';
          };
          lookUpHostnameOfPeers = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          lowShareRatioColor = mkOption {
            type = nullOr str;
            default = "QColor(Qt::red)";
            defaultText = "Code: true";
            description = ''
              

              Type: Color
            '';
          };
          manuallyControlTorrents = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          maxConnectingSockets = mkOption {
            type = nullOr (either str int);
            default = 50;
            description = ''
              

              Type: Int
              Min: 10
              Max: 500
            '';
          };
          maxConnections = mkOption {
            type = nullOr (either str int);
            default = 120;
            description = ''
              Maximum number of connections per torrent (0 = no limit)

              Type: Int
              Min: 0
            '';
          };
          maxDownloadRate = mkOption {
            type = nullOr (either str int);
            default = 0;
            description = ''
              Maximum download speed in KiB/sec (0 = no limit)

              Type: Int
              Min: 0
            '';
          };
          maxDownloads = mkOption {
            type = nullOr (either str int);
            default = 5;
            description = ''
              Maximum number of downloads (0 = no limit)

              Type: Int
              Min: 0
            '';
          };
          maxRatio = mkOption {
            type = nullOr (either str float);
            default = 0.0;
            description = ''
              Maximum share ratio (0 = no limit)

              Type: Double
              Min: 0
            '';
          };
          maxSeedTime = mkOption {
            type = nullOr (either str float);
            default = 0.0;
            description = ''
              Maximum seed time in hours (0 = no limit)

              Type: Double
              Min: 0
            '';
          };
          maxSeeds = mkOption {
            type = nullOr (either str int);
            default = 10;
            description = ''
              Maximum number of seeds (0 = no limit)

              Type: Int
              Min: 0
            '';
          };
          maxTotalConnections = mkOption {
            type = nullOr (either str int);
            default = 800;
            description = ''
              Maximum number of connections for all torrents (0 = no limit) 

              Type: Int
              Min: 0
            '';
          };
          maxUploadRate = mkOption {
            type = nullOr (either str int);
            default = 0;
            description = ''
              Maximum upload speed in KiB/sec (0 = no limit)

              Type: Int
              Min: 0
            '';
          };
          minDiskSpace = mkOption {
            type = nullOr (either str int);
            default = 100;
            description = ''
              When there is no space left to complete download, and the available disk space is less than this value, the torrent will be stopped.

              Type: Int
              Min: 10
              Max: 10000
            '';
          };
          networkInterface = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              

              Type: String
            '';
          };
          noTrackerConnectionColor = mkOption {
            type = nullOr str;
            default = "QColor(Qt::red)";
            defaultText = "Code: true";
            description = ''
              

              Type: Color
            '';
          };
          numMagnetDownloadingSlots = mkOption {
            type = nullOr (either str int);
            default = 5;
            description = ''
              

              Type: Int
              Min: 1
              Max: 100
            '';
          };
          numUploadSlots = mkOption {
            type = nullOr (either str int);
            default = 2;
            description = ''
              Number of upload slots

              Type: Int
              Min: 2
              Max: 100
            '';
          };
          okTorrentColor = mkOption {
            type = nullOr str;
            default = "QColor(40, 205, 40)";
            defaultText = "Code: true";
            description = ''
              

              Type: Color
            '';
          };
          okTrackerConnectionColor = mkOption {
            type = nullOr str;
            default = "QColor(40, 205, 40)";
            defaultText = "Code: true";
            description = ''
              

              Type: Color
            '';
          };
          onlyUseUtp = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          openAllTorrentsSilently = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          openMultipleTorrentsSilently = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          pexEnabled = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          port = mkOption {
            type = nullOr (either str int);
            default = 6881;
            description = ''
              Port

              Type: Int
              Min: 0
              Max: 65535
            '';
          };
          previewSizeAudio = mkOption {
            type = nullOr (either str int);
            default = 256;
            description = ''
              

              Type: Int
              Min: 16
            '';
          };
          previewSizeVideo = mkOption {
            type = nullOr (either str int);
            default = 2048;
            description = ''
              

              Type: Int
              Min: 16
            '';
          };
          primaryTransportProtocol = mkOption {
            type = nullOr (either str int);
            default = 0;
            description = ''
              

              Type: Int
              Min: 0
              Max: 1
            '';
          };
          requeueMagnets = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          requeueMagnetsTime = mkOption {
            type = nullOr (either str int);
            default = 5;
            description = ''
              

              Type: Int
              Min: 1
              Max: 60
            '';
          };
          saveDir = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              Folder to store downloaded files

              Type: String
            '';
          };
          showPopups = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Show popup messages when torrent is finished.

              Type: Bool
            '';
          };
          showSpeedBarInTrayIcon = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Show speed bar in tray icon

              Type: Bool
            '';
          };
          showSystemTrayIcon = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Show a system tray icon

              Type: Bool
            '';
          };
          showTotalSpeedInTitle = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Show a total speeds in the title

              Type: Bool
            '';
          };
          shownColumns = mkOption {
            type = nullOr (either str (listOf int));
            default = "";
            description = ''
              Columns shown in KTorrentView

              Type: IntList
            '';
          };
          socksEnabled = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          socksPassword = mkOption {
            type = nullOr str;
            default = "QString()";
            defaultText = "Code: true";
            description = ''
              

              Type: String
            '';
          };
          socksPort = mkOption {
            type = nullOr (either str int);
            default = 1080;
            description = ''
              

              Type: Int
              Min: 1
              Max: 65535
            '';
          };
          socksProxy = mkOption {
            type = nullOr str;
            default = "QString()";
            defaultText = "Code: true";
            description = ''
              

              Type: String
            '';
          };
          socksUsePassword = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          socksUsername = mkOption {
            type = nullOr str;
            default = "QString()";
            defaultText = "Code: true";
            description = ''
              

              Type: String
            '';
          };
          socksVersion = mkOption {
            type = nullOr (either str int);
            default = 5;
            description = ''
              

              Type: Int
              Min: 4
              Max: 5
            '';
          };
          stallTimer = mkOption {
            type = nullOr (either str int);
            default = 15;
            description = ''
              

              Type: Int
              Min: 1
            '';
          };
          stalledTorrentColor = mkOption {
            type = nullOr str;
            default = "QColor(255, 174, 0)";
            defaultText = "Code: true";
            description = ''
              

              Type: Color
            '';
          };
          startDownloadsOnLowDiskSpace = mkOption {
            type = nullOr (either str int);
            default = 0;
            description = ''
              Start downloads on low disk space?

              Type: Int
            '';
          };
          suppressSleep = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          tempDir = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              Folder to store temporary files

              Type: String
            '';
          };
          timeoutTrackerConnectionColor = mkOption {
            type = nullOr str;
            default = "QColor(0, 170, 110)";
            defaultText = "Code: true";
            description = ''
              

              Type: Color
            '';
          };
          torrentCopyDir = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              Folder to copy .torrent files to

              Type: String
            '';
          };
          trackerListUrl = mkOption {
            type = nullOr str;
            default = "https://newtrackon.com/api/stable";
            description = ''
              

              Type: String
            '';
          };
          typeOfService = mkOption {
            type = nullOr (either str int);
            default = 8;
            description = ''
              

              Type: Int
              Min: 0
              Max: 255
            '';
          };
          udpTrackerPort = mkOption {
            type = nullOr (either str int);
            default = 8881;
            description = ''
              Port

              Type: Int
              Min: 0
              Max: 65535
            '';
          };
          uploadBandwidth = mkOption {
            type = nullOr (either str int);
            default = 500;
            description = ''
              Upload bandwidth (in kb/s):

              Type: Int
              Min: 0
              Max: 1000000
            '';
          };
          useCompletedDir = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Whether to automatically move completed downloads to completedDir

              Type: Bool
            '';
          };
          useCustomIP = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Whether to use a custom IP to pass to the tracker

              Type: Bool
            '';
          };
          useEncryption = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Use protocol encryption

              Type: Bool
            '';
          };
          useKDEProxySettings = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          useProxyForTracker = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          useProxyForWebSeeds = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          useSaveDir = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Whether to automatically save downloads to saveDir

              Type: Bool
            '';
          };
          useTorrentCopyDir = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Whether to automatically copy .torrent files to torrentCopyDir

              Type: Bool
            '';
          };
          utpEnabled = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          warningsTrackerConnectionColor = mkOption {
            type = nullOr str;
            default = "QColor(255, 80, 0)";
            defaultText = "Code: true";
            description = ''
              

              Type: Color
            '';
          };
          webseedsEnabled = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
        };
      };
      default = {};
      description = "downloads";
    };    
    "general" = with types; mkOption {
      type = submodule {
        options = { 
          AntiAliasing = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Use anti aliasing on charts?

              Type: Bool
            '';
          };
          CnAvgLConnPerRunTorrColor = mkOption {
            type = nullOr str;
            default = "#f0f";
            description = ''
              Color of the avg connected leechers per running torrent on connections chart

              Type: Color
            '';
          };
          CnAvgLConnPerTorrColor = mkOption {
            type = nullOr str;
            default = "#00f";
            description = ''
              Color of the avg connected leecher per torrent on connections chart

              Type: Color
            '';
          };
          CnAvgSConnPerRunTorrColor = mkOption {
            type = nullOr str;
            default = "#707";
            description = ''
              Color of the avg connected seeds per running torrent on connections chart

              Type: Color
            '';
          };
          CnAvgSConnPerTorrColor = mkOption {
            type = nullOr str;
            default = "#007";
            description = ''
              Color of the avg connected seeds per torrent on connections chart

              Type: Color
            '';
          };
          CnLConnColor = mkOption {
            type = nullOr str;
            default = "#f00";
            description = ''
              Color of the connected leechers on connections chart

              Type: Color
            '';
          };
          CnLSwarmsColor = mkOption {
            type = nullOr str;
            default = "#700";
            description = ''
              Color of the leechers in swarms on connections chart

              Type: Color
            '';
          };
          CnSConnColor = mkOption {
            type = nullOr str;
            default = "#0f0";
            description = ''
              Color of the connected seeds on connections chart

              Type: Color
            '';
          };
          CnSSwarmsColor = mkOption {
            type = nullOr str;
            default = "#070";
            description = ''
              Color of the seeds in swarms on connections chart

              Type: Color
            '';
          };
          ConnsSamples = mkOption {
            type = nullOr (either str int);
            default = 384;
            description = ''
              Samples to show on connections chart

              Type: UInt
            '';
          };
          DataGatherIval = mkOption {
            type = nullOr (either str int);
            default = 750;
            description = ''
              Interval in milliseconds between data gathering

              Type: UInt
            '';
          };
          DhtNodesColor = mkOption {
            type = nullOr str;
            default = "#f00";
            description = ''
              Color of the nodes on DHT chart

              Type: Color
            '';
          };
          DhtSpdSamples = mkOption {
            type = nullOr (either str int);
            default = 384;
            description = ''
              Samples to show on DHT chart

              Type: UInt
            '';
          };
          DhtTasksColor = mkOption {
            type = nullOr str;
            default = "#00f";
            description = ''
              Color of the tasks on DHT chart

              Type: Color
            '';
          };
          DlAvgColor = mkOption {
            type = nullOr str;
            default = "#00f";
            description = ''
              Color of the average on dl chart

              Type: Color
            '';
          };
          DlLimitColor = mkOption {
            type = nullOr str;
            default = "#000";
            description = ''
              Color of the limit on dl chart

              Type: Color
            '';
          };
          DlSpdColor = mkOption {
            type = nullOr str;
            default = "#f00";
            description = ''
              Color of the speed on dl chart

              Type: Color
            '';
          };
          DlSpdSamples = mkOption {
            type = nullOr (either str int);
            default = 192;
            description = ''
              Samples to show on download chart

              Type: UInt
            '';
          };
          DrawBgdGrid = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Draw ugly grey background grid?

              Type: Bool
            '';
          };
          MaxMode = mkOption {
            type = nullOr (either str int);
            default = 1;
            description = ''
              Method of determining maximum value of the scale

              Type: UInt
            '';
          };
          PeersSpdSamples = mkOption {
            type = nullOr (either str int);
            default = 192;
            description = ''
              Samples to show on peers chart

              Type: UInt
            '';
          };
          PrAvgFromLColor = mkOption {
            type = nullOr str;
            default = "#f00";
            description = ''
              Color of the avg from leecher on peers chart

              Type: Color
            '';
          };
          PrAvgFromSColor = mkOption {
            type = nullOr str;
            default = "#00f";
            description = ''
              Color of the avg from seeds on peers chart

              Type: Color
            '';
          };
          PrAvgToLColor = mkOption {
            type = nullOr str;
            default = "#0f0";
            description = ''
              Color of the avg to leecher on peers chart

              Type: Color
            '';
          };
          PrFromLColor = mkOption {
            type = nullOr str;
            default = "#f0f";
            description = ''
              Color of the leechers on peers chart

              Type: Color
            '';
          };
          PrFromSColor = mkOption {
            type = nullOr str;
            default = "#FFA200";
            description = ''
              Color of the seeds on peers chart

              Type: Color
            '';
          };
          ScanForLostFilesWidgetPosition = mkOption {
            type = nullOr (either str int);
            default = 0;
            description = ''
              

              Type: Int
              Min: 0
              Max: 2
            '';
          };
          ShowLeechersInSwarms = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Whether to show leachers in swarms

              Type: Bool
            '';
          };
          ShowSeedsInSwarms = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Whether to show seeds in swarms

              Type: Bool
            '';
          };
          UlAvgColor = mkOption {
            type = nullOr str;
            default = "#00f";
            description = ''
              Color of the avg on upload chart

              Type: Color
            '';
          };
          UlLimitColor = mkOption {
            type = nullOr str;
            default = "#000";
            description = ''
              Color of the limit on upload chart

              Type: Color
            '';
          };
          UlSpdColor = mkOption {
            type = nullOr str;
            default = "#f00";
            description = ''
              Color of the speed on upload chart

              Type: Color
            '';
          };
          UlSpdSamples = mkOption {
            type = nullOr (either str int);
            default = 192;
            description = ''
              Samples to show on upload chart

              Type: UInt
            '';
          };
          UpdateEveryGuiUpdates = mkOption {
            type = nullOr (either str int);
            default = 2;
            description = ''
              Update charts every n gui updates

              Type: UInt
            '';
          };
          WidgetType = mkOption {
            type = nullOr (either str int);
            default = 0;
            description = ''
              Type of widget used for chart drawing

              Type: UInt
            '';
          };
          actionDelete = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Delete action checked.

              Type: Bool
            '';
          };
          actionMove = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Move action checked.

              Type: Bool
            '';
          };
          addToGroup = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          autoUpdate = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          autoUpdateInterval = mkOption {
            type = nullOr (either str int);
            default = 7;
            description = ''
              

              Type: Int
              Min: 1
              Max: 1000
            '';
          };
          customBrowser = mkOption {
            type = nullOr str;
            default = "/usr/bin/firefox";
            description = ''
              Custom browser executable path

              Type: String
            '';
          };
          customtracker = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Toggles if a custom tracker is used

              Type: Bool
            '';
          };
          defaultDevice = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              Default UPnP device to use

              Type: String
            '';
          };
          dn = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Show dn

              Type: Bool
            '';
          };
          filterURL = mkOption {
            type = nullOr str;
            default = ''QUrl(QStringLiteral("http://list.iblocklist.com/?list=bt_level1&fileformat=p2p&archiveformat=gz"))'';
            defaultText = "Code: true";
            description = ''
              Level1 filter url

              Type: Url
            '';
          };
          firstColor = mkOption {
            type = nullOr str;
            default = "QColor()";
            defaultText = "Code: true";
            description = ''
              

              Type: Color
            '';
          };
          folders = mkOption {
            type = nullOr (either str (listOf str));
            default = "";
            description = ''
              

              Type: StringList
            '';
          };
          group = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              

              Type: String
            '';
          };
          itemColor = mkOption {
            type = nullOr str;
            default = "QColor(0,255,0,255)";
            defaultText = "Code: true";
            description = ''
              

              Type: Color
            '';
          };
          lastColor = mkOption {
            type = nullOr str;
            default = "QColor()";
            defaultText = "Code: true";
            description = ''
              

              Type: Color
            '';
          };
          logWidgetPosition = mkOption {
            type = nullOr (either str int);
            default = 0;
            description = ''
              

              Type: Int
              Min: 0
              Max: 2
            '';
          };
          maxBlockCount = mkOption {
            type = nullOr (either str int);
            default = 200;
            description = ''
              

              Type: Int
              Min: 50
              Max: 500000
            '';
          };
          onlypublic = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Only enable on public torrents

              Type: Bool
            '';
          };
          openInExternal = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          openSilently = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Whether to open torrent silently or not.

              Type: Bool
            '';
          };
          popup = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Show popup

              Type: Bool
            '';
          };
          recursive = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Scan directories recursively.

              Type: Bool
            '';
          };
          restorePreviousSession = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          scheduleBackgroundColor = mkOption {
            type = nullOr str;
            default = "QColor(Qt::yellow)";
            defaultText = "Code: true";
            description = ''
              

              Type: Color
            '';
          };
          scheduleLineColor = mkOption {
            type = nullOr str;
            default = "QColor(Qt::blue)";
            defaultText = "Code: true";
            description = ''
              

              Type: Color
            '';
          };
          screensaverDownloadLimit = mkOption {
            type = nullOr (either str int);
            default = 0;
            description = ''
              

              Type: Int
              Min: 0
            '';
          };
          screensaverLimits = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          screensaverUploadLimit = mkOption {
            type = nullOr (either str int);
            default = 0;
            description = ''
              

              Type: Int
              Min: 0
            '';
          };
          searchEngine = mkOption {
            type = nullOr (either str int);
            default = 0;
            description = ''
              Current search engine

              Type: Int
            '';
          };
          showChunkView = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Show chunk download view tab in main window

              Type: Bool
            '';
          };
          showPeerView = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Show peer view tab in main window

              Type: Bool
            '';
          };
          showTrackersView = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Show trackers view tab in main window

              Type: Bool
            '';
          };
          showWebSeedsTab = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          skipIncomplete = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          skipVideos = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          suspendedColor = mkOption {
            type = nullOr str;
            default = "QColor(255,0,0,255)";
            defaultText = "Code: true";
            description = ''
              

              Type: Color
            '';
          };
          torrenttracker = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Grabs a tracker from the torrent file

              Type: Bool
            '';
          };
          tr = mkOption {
            type = nullOr str;
            default = "http://tracker.openbittorrent.com/announce";
            description = ''
              The default tracker

              Type: String
            '';
          };
          useCustomBrowser = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Use custom browser

              Type: Bool
            '';
          };
          useDefaultBrowser = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Use default browser

              Type: Bool
            '';
          };
          "useLevel1" = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Use level1 filter?

              Type: Bool
            '';
          };
          useProxySettings = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Use proxy settings for search

              Type: Bool
            '';
          };
          useRichText = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Use rich log text

              Type: Bool
            '';
          };
        };
      };
      default = {};
      description = "general";
    };    
  };
  config = mkIf (cfg.enable && moduleCfg.enable) {
    home.packages = mkIf moduleCfg.package [ moduleCfg.package ];
    programs.plasma.files."ktorrentrc" = removeAttrs moduleCfg [ "enable" "package" ];
  };
}
