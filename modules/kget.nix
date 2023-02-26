{ config, lib, ... }:
with lib;
let
  cfg = config.programs.plasma;
  moduleCfg = config.programs.plasma.kget;
in {
  options.programs.plasma.kget = {
    enable = mkEnableOption ''
      Enable kget
    '';
    package = mkOption {
      default = if (pkgs ? kget) then
                        pkgs.kget
                      else
                        (if pkgs.libsForQt5 ? kget then pkgs.libsForQt5.kget else false);
      defaultText = literalExpression "pkgs.kget";
      type = with types; either bool package;
      description = mdDoc "Package to use.";
    };
    "Advanced" = with types; mkOption {
      type = submodule {
        options = { 
          AfterFinishAction = mkOption {
            type = nullOr (either str int);
            default = 0;
            description = ''
              

              Type: Int
            '';
          };
          AfterFinishActionEnabled = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          AutoPaste = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          AutoPasteCaseSensitive = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          AutoPastePatternSyntaxes = mkOption {
            type = nullOr (either str (listOf int));
            default = "0";
            description = ''
              

              Type: IntList
            '';
          };
          AutoPastePatterns = mkOption {
            type = nullOr (either str (listOf str));
            default = "*";
            description = ''
              

              Type: StringList
            '';
          };
          AutoPasteTypes = mkOption {
            type = nullOr (either str (listOf int));
            default = "0";
            description = ''
              

              Type: IntList
            '';
          };
          EnableKUIServerIntegration = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          EnableSystemTray = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          ExportGlobalJob = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          ExportSingleTransfer = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          FilesAlwaysAsk = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          FilesAutomaticRename = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          FilesOverwrite = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          HistoryBackend = mkOption {
            type = nullOr (either str int);
            default = 1;
            description = ''
              

              Type: Int
            '';
          };
          KonquerorIntegration = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          StartupAction = mkOption {
            type = nullOr (either str int);
            default = 0;
            description = ''
              

              Type: Int
            '';
          };
          TimedDisconnect = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          TimedDisconnectDateTime = mkOption {
            type = nullOr str;
            default = "QDateTime::currentDateTime()";
            defaultText = "Code: true";
            description = ''
              

              Type: DateTime
            '';
          };
          TimedDownload = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          TimedDownloadDateTime = mkOption {
            type = nullOr str;
            default = "QDateTime::currentDateTime()";
            defaultText = "Code: true";
            description = ''
              

              Type: DateTime
            '';
          };
        };
      };
      default = {};
      description = "Advanced";
    };    
    "AdvancedDetails" = with types; mkOption {
      type = submodule {
        options = { 
          ChunksColumnWidths = mkOption {
            type = nullOr (either str (listOf int));
            default = "";
            description = ''
              

              Type: IntList
            '';
          };
          FileColumnWidths = mkOption {
            type = nullOr (either str (listOf int));
            default = "";
            description = ''
              

              Type: IntList
            '';
          };
          PeersColumnWidths = mkOption {
            type = nullOr (either str (listOf int));
            default = "";
            description = ''
              

              Type: IntList
            '';
          };
        };
      };
      default = {};
      description = "AdvancedDetails";
    };    
    "Appearance" = with types; mkOption {
      type = submodule {
        options = { 
          AnimateDropTarget = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          AutoPasteHeaderState = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              

              Type: String
            '';
          };
          DockifyIndividual = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          HeaderState = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              

              Type: String
            '';
          };
          ShowDropTarget = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          ShowIndividual = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          ShowMain = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          TransferSettingsHeaderState = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              

              Type: String
            '';
          };
          VerificationHeaderState = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              

              Type: String
            '';
          };
        };
      };
      default = {};
      description = "Appearance";
    };    
    "ChecksumSearch" = with types; mkOption {
      type = submodule {
        options = { 
          ChecksumTypeList = mkOption {
            type = nullOr (either str (listOf str));
            default = "md5,md5,sha1,sha1,";
            description = ''
              List of the available search engine URLs

              Type: StringList
            '';
          };
          SearchStrings = mkOption {
            type = nullOr (either str (listOf str));
            default = ".md5,MD5SUMS,.sha1,SHA1SUMS,-CHECKSUM";
            description = ''
              List of the available search engines

              Type: StringList
            '';
          };
          UrlChangeModeList = mkOption {
            type = nullOr (either str (listOf int));
            default = "0,1,0,1,2";
            description = ''
              List of the available search engine URLs

              Type: IntList
            '';
          };
        };
      };
      default = {};
      description = "ChecksumSearch";
    };    
    "Dirs" = with types; mkOption {
      type = submodule {
        options = { 
          PreAlloc = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          TmpDir = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              

              Type: String
            '';
          };
          TorrentDir = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              

              Type: String
            '';
          };
        };
      };
      default = {};
      description = "Dirs";
    };    
    "Files" = with types; mkOption {
      type = submodule {
        options = { 
          ConnectionsPerUrl = mkOption {
            type = nullOr (either str int);
            default = 2;
            description = ''
              

              Type: Int
              Min: 1
              Max: 10
            '';
          };
          MirrorsPerFile = mkOption {
            type = nullOr (either str int);
            default = 3;
            description = ''
              

              Type: Int
              Min: 1
              Max: 10
            '';
          };
          SimultaneousFiles = mkOption {
            type = nullOr (either str int);
            default = 2;
            description = ''
              

              Type: Int
              Min: 1
              Max: 10
            '';
          };
        };
      };
      default = {};
      description = "Files";
    };    
    "General" = with types; mkOption {
      type = submodule {
        options = { 
          DownloadLimit = mkOption {
            type = nullOr (either str int);
            default = 0;
            description = ''
              

              Type: Int
            '';
          };
          EnableUTP = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          Port = mkOption {
            type = nullOr (either str int);
            default = 6881;
            description = ''
              

              Type: Int
            '';
          };
          UploadLimit = mkOption {
            type = nullOr (either str int);
            default = 0;
            description = ''
              

              Type: Int
            '';
          };
        };
      };
      default = {};
      description = "General";
    };    
    "Geometry" = with types; mkOption {
      type = submodule {
        options = { 
          HistoryColumnWidths = mkOption {
            type = nullOr (either str (listOf int));
            default = "";
            description = ''
              The width of the columns in the history view

              Type: IntList
            '';
          };
        };
      };
      default = {};
      description = "Geometry";
    };    
    "Groups" = with types; mkOption {
      type = submodule {
        options = { 
          AskForDestination = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          DirectoriesAsSuggestion = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
        };
      };
      default = {};
      description = "Groups";
    };    
    "Internal" = with types; mkOption {
      type = submodule {
        options = { 
          DropPosition = mkOption {
            type = nullOr str;
            default = "QPoint(-1, -1)";
            defaultText = "Code: true";
            description = ''
              

              Type: Point
            '';
          };
          DropSticky = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          FirstRun = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          LastDirectory = mkOption {
            type = nullOr str;
            default = "QStandardPaths::writableLocation(QStandardPaths::DownloadLocation)";
            defaultText = "Code: true";
            description = ''
              

              Type: Path
            '';
          };
          LastGroup = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              

              Type: String
            '';
          };
          LinkViewFilterPatternSyntax = mkOption {
            type = nullOr (either str int);
            default = 0;
            description = ''
              

              Type: Int
            '';
          };
          MainPosition = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              

              Type: Point
            '';
          };
          MainState = mkOption {
            type = nullOr (either str int);
            default = 0;
            description = ''
              

              Type: Int
            '';
          };
        };
      };
      default = {};
      description = "Internal";
    };    
    "Network" = with types; mkOption {
      type = submodule {
        options = { 
          GlobalDownloadLimit = mkOption {
            type = nullOr (either str int);
            default = 0;
            description = ''
              

              Type: Int
            '';
          };
          GlobalUploadLimit = mkOption {
            type = nullOr (either str int);
            default = 0;
            description = ''
              

              Type: Int
            '';
          };
          MaxConnections = mkOption {
            type = nullOr (either str int);
            default = 2;
            description = ''
              

              Type: Int
            '';
          };
          ReconnectDelay = mkOption {
            type = nullOr (either str int);
            default = 60;
            description = ''
              

              Type: Int
            '';
          };
          ReconnectOnBroken = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          ReconnectRetries = mkOption {
            type = nullOr (either str int);
            default = 5;
            description = ''
              

              Type: Int
            '';
          };
          SpeedLimit = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          TransferSpeedLimit = mkOption {
            type = nullOr (either str int);
            default = 20;
            description = ''
              

              Type: Int
            '';
          };
        };
      };
      default = {};
      description = "Network";
    };    
    "SearchEngines" = with types; mkOption {
      type = submodule {
        options = { 
          NameItems = mkOption {
            type = nullOr (either str (listOf str));
            default = "";
            description = ''
              List of the available search engines

              Type: StringList
            '';
          };
          UrlItems = mkOption {
            type = nullOr (either str (listOf str));
            default = "";
            description = ''
              List of the available search engine URLs

              Type: StringList
            '';
          };
          UseSearchEngines = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
        };
      };
      default = {};
      description = "SearchEngines";
    };    
    "Segments" = with types; mkOption {
      type = submodule {
        options = { 
          SaveSegSize = mkOption {
            type = nullOr (either str int);
            default = 100;
            description = ''
              

              Type: Int
            '';
          };
          Segments = mkOption {
            type = nullOr (either str int);
            default = 5;
            description = ''
              

              Type: Int
            '';
          };
        };
      };
      default = {};
      description = "Segments";
    };    
    "Threads" = with types; mkOption {
      type = submodule {
        options = { 
          Threads = mkOption {
            type = nullOr (either str int);
            default = 50;
            description = ''
              

              Type: Int
            '';
          };
        };
      };
      default = {};
      description = "Threads";
    };    
    "Verification" = with types; mkOption {
      type = submodule {
        options = { 
          ChecksumAutomaticVerification = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          ChecksumStrength = mkOption {
            type = nullOr (either str int);
            default = 1;
            description = ''
              

              Type: Int
            '';
          };
          SignatureAutomaticDownloading = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          SignatureAutomaticVerification = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          SignatureKeyServers = mkOption {
            type = nullOr (either str (listOf str));
            default = "http://keys.gnupg.net,http://stinkfoot.org,http://pgp.mit.edu,http://pgp.surfnet.nl,http://keyserver.gingerbear.net";
            description = ''
              

              Type: StringList
            '';
          };
          UseSearchVerification = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
        };
      };
      default = {};
      description = "Verification";
    };    
    "Webinterface" = with types; mkOption {
      type = submodule {
        options = { 
          WebinterfaceEnabled = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          WebinterfacePort = mkOption {
            type = nullOr (either str int);
            default = 8080;
            description = ''
              

              Type: Int
            '';
          };
          WebinterfaceUser = mkOption {
            type = nullOr str;
            default = "admin";
            description = ''
              

              Type: String
            '';
          };
        };
      };
      default = {};
      description = "Webinterface";
    };    
  };
  config = mkIf (cfg.enable && moduleCfg.enable) {
    home.packages = mkIf moduleCfg.package [ moduleCfg.package ];
    programs.plasma.files."kgetrc" = removeAttrs moduleCfg [ "enable" "package" ];
  };
}
