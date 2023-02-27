{ config, lib, pkgs, ... }:
with lib;
let
  cfg = config.programs.plasma;
  moduleCfg = config.programs.plasma.konqueror;
in {
  options.programs.plasma.konqueror = {
    enable = mkEnableOption ''
      Enable konqueror
    '';
    package = mkOption {
      default = if (pkgs ? konqueror) then
                        pkgs.konqueror
                      else
                        (if pkgs.libsForQt5 ? konqueror then pkgs.libsForQt5.konqueror else false);
      defaultText = literalExpression "pkgs.konqueror";
      type = with types; either bool package;
      description = mdDoc "Package to use.";
    };
    "FMSettings" = with types; mkOption {
      type = submodule {
        options = { 
          AddTabButton = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          AlwaysNewWin = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Open folders in separate windows

              Type: Bool
            '';
          };
          AlwaysTabbedMode = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          CloseTabButton = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          FileTipsItems = mkOption {
            type = nullOr (either str int);
            default = 6;
            description = ''
              

              Type: Int
            '';
          };
          KonquerorTabforExternalURL = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          MMBOpensTab = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          MaximumTabLength = mkOption {
            type = nullOr (either str int);
            default = 30;
            description = ''
              

              Type: Int
            '';
          };
          MinimumTabLength = mkOption {
            type = nullOr (either str int);
            default = 3;
            description = ''
              

              Type: Int
            '';
          };
          MouseMiddleClickClosesTab = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          NewTabsInFront = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          OpenAfterCurrentPage = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          OpenWithItems = mkOption {
            type = nullOr (either str int);
            default = 2;
            description = ''
              Number of Open With items in the File menu

              Type: Int
            '';
          };
          PermanentCloseButton = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          PopupsWithinTabs = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          ShowDeleteCommand = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Show 'Delete' menu entries which bypass the trashcan

              Type: Bool
            '';
          };
          ShowFileTips = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Show file tips

              Type: Bool
            '';
          };
          ShowPreviewsInFileTips = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Show previews in file tips

              Type: Bool
            '';
          };
          TabCloseActivatePrevious = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          TabPosition = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              

              Type: String
            '';
          };
        };
      };
      default = {};
      description = "FMSettings";
    };    
    "HTML Settings" = with types; mkOption {
      type = submodule {
        options = { 
          AutoDelayedActions = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          AutoLoadImages = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          AutomaticDetectionLanguage = mkOption {
            type = nullOr (either str int);
            default = "";
            description = ''
              

              Type: Int
            '';
          };
          ChangeCursor = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          DefaultEncoding = mkOption {
            type = nullOr str;
            default = null;
            defaultText = "Code: true";
            description = ''
              

              Type: String
            '';
          };
          EnableFavicon = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          EnforceDefaultCharset = mkOption {
            type = nullOr (either str bool);
            default = "";
            description = ''
              

              Type: Bool
            '';
          };
          Fonts = mkOption {
            type = nullOr (either str (listOf str));
            default = "";
            description = ''
              

              Type: StringList
            '';
          };
          FormCompletion = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          HoverLinks = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          MaxFormCompletionItems = mkOption {
            type = nullOr (either str int);
            default = 10;
            description = ''
              

              Type: Int
            '';
          };
          MediumFontSize = mkOption {
            type = nullOr (either str int);
            default = 12;
            description = ''
              

              Type: Int
            '';
          };
          MinimumFontSize = mkOption {
            type = nullOr (either str int);
            default = null;
            defaultText = "Code: true";
            description = ''
              

              Type: Int
            '';
          };
          ShowAnimations = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              

              Type: String
            '';
          };
          StandardFont = mkOption {
            type = nullOr str;
            default = null;
            defaultText = "Code: true";
            description = ''
              Standard font

              Type: Font
            '';
          };
          UnderlineLinks = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          UserStyleSheetEnabled = mkOption {
            type = nullOr (either str bool);
            default = "";
            description = ''
              

              Type: Bool
            '';
          };
        };
      };
      default = {};
      description = "HTML Settings";
    };    
    "HistorySettings" = with types; mkOption {
      type = submodule {
        options = { 
          MaximumHistoryEntriesPerView = mkOption {
            type = nullOr (either str int);
            default = 50;
            description = ''
              Maximum number of history items per view

              Type: Int
            '';
          };
          OpenGroups = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              

              Type: String
            '';
          };
        };
      };
      default = {};
      description = "HistorySettings";
    };    
    "Java/JavaScript Settings" = with types; mkOption {
      type = submodule {
        options = { 
          AppletServerTimeout = mkOption {
            type = nullOr (either str int);
            default = 60;
            description = ''
              

              Type: Int
            '';
          };
          ECMADomainSettings = mkOption {
            type = nullOr (either str (listOf str));
            default = "";
            description = ''
              

              Type: StringList
            '';
          };
          ECMADomains = mkOption {
            type = nullOr (either str (listOf str));
            default = "true";
            description = ''
              

              Type: StringList
            '';
          };
          EnableJavaScript = mkOption {
            type = nullOr (either str bool);
            default = "";
            description = ''
              

              Type: Bool
            '';
          };
          EnableJavaScriptDebug = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          EnablePlugins = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          JavaArgs = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              

              Type: String
            '';
          };
          JavaDomainSettings = mkOption {
            type = nullOr (either str (listOf str));
            default = "";
            description = ''
              

              Type: StringList
            '';
          };
          JavaDomains = mkOption {
            type = nullOr (either str (listOf str));
            default = "";
            description = ''
              

              Type: StringList
            '';
          };
          JavaPath = mkOption {
            type = nullOr str;
            default = null;
            defaultText = "Code: true";
            description = ''
              

              Type: Path
            '';
          };
          JavaScriptDomainAdvice = mkOption {
            type = nullOr (either str (listOf str));
            default = "";
            description = ''
              

              Type: StringList
            '';
          };
          PluginDomains = mkOption {
            type = nullOr (either str (listOf str));
            default = "";
            description = ''
              

              Type: StringList
            '';
          };
          ReportJavaScriptErrors = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          ShowJavaConsole = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          ShutdownAppletServer = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          UseKio = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          UseSecurityManager = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          WindowFocusPolicy = mkOption {
            type = nullOr (either str int);
            default = "";
            description = ''
              

              Type: UInt
            '';
          };
          WindowMovePolicy = mkOption {
            type = nullOr (either str int);
            default = "";
            description = ''
              

              Type: UInt
            '';
          };
          WindowOpenPolicy = mkOption {
            type = nullOr (either str int);
            default = "";
            description = ''
              

              Type: UInt
            '';
          };
          WindowResizePolicy = mkOption {
            type = nullOr (either str int);
            default = "";
            description = ''
              

              Type: UInt
            '';
          };
          WindowStatusPolicy = mkOption {
            type = nullOr (either str int);
            default = "";
            description = ''
              

              Type: UInt
            '';
          };
        };
      };
      default = {};
      description = "Java/JavaScript Settings";
    };    
    "MainView Settings" = with types; mkOption {
      type = submodule {
        options = { 
          BackRightClick = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          OpenMiddleClick = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          ToggableViewsShown = mkOption {
            type = nullOr (either str (listOf str));
            default = "";
            description = ''
              

              Type: StringList
            '';
          };
        };
      };
      default = {};
      description = "MainView Settings";
    };    
    "Notification Messages" = with types; mkOption {
      type = submodule {
        options = { 
          MultipleTabConfirm = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          "plugin-application/x-shockwave-flash" = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              

              Type: String
            '';
          };
          "plugin-image/svg+xml" = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              

              Type: String
            '';
          };
        };
      };
      default = {};
      description = "Notification Messages";
    };    
    "Options" = with types; mkOption {
      type = submodule {
        options = { 
          ArchiveType = mkOption {
            type = nullOr str;
            default = "application/x-webarchive";
            description = ''
              Archive &type:

              Type: String
            '';
          };
          CloseWhenFinished = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Close when finished

              Type: Bool
            '';
          };
          FixExtensions = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Save in standard web archive format

              Type: Bool
            '';
          };
          NoProxy = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Do not use proxy

              Type: Bool
            '';
          };
          RandomWait = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Randomise wait time

              Type: Bool
            '';
          };
          RunInTerminal = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Run in terminal

              Type: Bool
            '';
          };
          WaitTime = mkOption {
            type = nullOr (either str int);
            default = 1;
            description = ''
              Wait time:

              Type: UInt
              Min: 0
              Max: 60
            '';
          };
        };
      };
      default = {};
      description = "Options";
    };    
    "Reusing" = with types; mkOption {
      type = submodule {
        options = { 
          AlwaysHavePreloaded = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          PreloadOnStartup = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
        };
      };
      default = {};
      description = "Reusing";
    };    
    "SessionManagerSettings" = with types; mkOption {
      type = submodule {
        options = { 
          AutoSaveInterval = mkOption {
            type = nullOr (either str int);
            default = 10;
            description = ''
              

              Type: Int
            '';
          };
        };
      };
      default = {};
      description = "SessionManagerSettings";
    };    
    "Settings" = with types; mkOption {
      type = submodule {
        options = { 
          BgImage = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              

              Type: String
            '';
          };
          CompletionMode = mkOption {
            type = nullOr (either str (enum [ 
            ]));
            default = null;
            defaultText = "Code: true";
            description = ''
              

              Type: Enum
            '';
          };
          "Number of most visited URLs" = mkOption {
            type = nullOr (either str int);
            default = 10;
            description = ''
              

              Type: Int
            '';
          };
          SaveURLInProfile = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
        };
      };
      default = {};
      description = "Settings";
    };    
    "Trash" = with types; mkOption {
      type = submodule {
        options = { 
          ConfirmDelete = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Ask confirmation for deleting a file.

              Type: Bool
            '';
          };
          ConfirmTrash = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Ask confirmation for move to trash

              Type: Bool
            '';
          };
          OpenTabsInsideCurrentWindow = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Open tabs inside current window

              Type: Bool
            '';
          };
        };
      };
      default = {};
      description = "Trash";
    };    
    "UndoManagerSettings" = with types; mkOption {
      type = submodule {
        options = { 
          maxNumClosedItems = mkOption {
            type = nullOr (either str int);
            default = 20;
            description = ''
              Maximum number of Closed Items

              Type: Int
              Min: 0
            '';
          };
        };
      };
      default = {};
      description = "UndoManagerSettings";
    };    
    "UserSettings" = with types; mkOption {
      type = submodule {
        options = { 
          HomeURL = mkOption {
            type = nullOr str;
            default = "https://www.kde.org/";
            description = ''
              Home Page

              Type: Path
            '';
          };
          StartURL = mkOption {
            type = nullOr str;
            default = "konq:konqueror";
            description = ''
              Start Page

              Type: Path
            '';
          };
        };
      };
      default = {};
      description = "UserSettings";
    };    
  };
  config = mkIf (cfg.enable && moduleCfg.enable) {
    home.packages = mkIf (moduleCfg.package != false) [ moduleCfg.package ];
    programs.plasma.files."konquerorrc" = removeAttrs moduleCfg [ "enable" "package" ];
  };
}
