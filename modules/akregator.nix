{ config, lib, pkgs, ... }:
with lib;
let
  cfg = config.programs.plasma;
  moduleCfg = config.programs.plasma.akregator;
in {
  options.programs.plasma.akregator = {
    enable = mkEnableOption ''
      Enable akregator
    '';
    package = mkOption {
      default = if (pkgs ? akregator) then
                        pkgs.akregator
                      else
                        (if pkgs.libsForQt5 ? akregator then pkgs.libsForQt5.akregator else false);
      defaultText = literalExpression "pkgs.akregator";
      type = with types; either bool package;
      description = mdDoc "Package to use.";
    };
    "Advanced" = with types; mkOption {
      type = submodule {
        options = { 
          "Archive Backend" = mkOption {
            type = nullOr str;
            default = "metakit";
            description = ''
              Archive Backend

              Type: String
            '';
          };
          "Delay Mark Read" = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          "Mark Read Delay" = mkOption {
            type = nullOr (either str int);
            default = 0;
            description = ''
              

              Type: Int
            '';
          };
          "Reset Quick Filter On Node Change" = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
        };
      };
      default = {};
      description = "Advanced";
    };    
    "Appearance" = with types; mkOption {
      type = submodule {
        options = { 
          ColorNewArticles = mkOption {
            type = nullOr str;
            default = "#FF0000";
            description = ''
              

              Type: Color
            '';
          };
          ColorUnreadArticles = mkOption {
            type = nullOr str;
            default = "#0000FF";
            description = ''
              

              Type: Color
            '';
          };
          "Fixed Font" = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              

              Type: String
            '';
          };
          GrantleeDirectory = mkOption {
            type = nullOr str;
            default = "5.2";
            description = ''
              

              Type: String
            '';
          };
          "Sans Serif Font" = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              

              Type: String
            '';
          };
          "Serif Font" = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              

              Type: String
            '';
          };
          "Standard Font" = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              

              Type: String
            '';
          };
          UseCustomColors = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
        };
      };
      default = {};
      description = "Appearance";
    };    
    "Archive" = with types; mkOption {
      type = submodule {
        options = { 
          ArchiveMode = mkOption {
            type = nullOr (either str (enum [ 
              "keepAllArticles"
              "limitArticleNumber"
              "limitArticleAge"
              "disableArchiving"
            ]));
            default = "keepAllArticles";
            description = ''
              Archive Mode

              Type: Enum
              Choices: 
                - keepAllArticles: Keep All Articles
                - limitArticleNumber: Limit Number of Articles
                - limitArticleAge: Delete Expired Articles
                - disableArchiving: Disable Archiving
            '';
          };
          "Do Not Expire Important Articles" = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Do Not Expire Important Articles

              Type: Bool
            '';
          };
          "Max Article Age" = mkOption {
            type = nullOr (either str int);
            default = 60;
            description = ''
              Expiry Age

              Type: Int
            '';
          };
          "Max Article Number" = mkOption {
            type = nullOr (either str int);
            default = 1000;
            description = ''
              Article Limit

              Type: Int
            '';
          };
        };
      };
      default = {};
      description = "Archive";
    };    
    "Browser" = with types; mkOption {
      type = submodule {
        options = { 
          "Always Show Tab Bar" = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Always show the tab bar

              Type: Bool
            '';
          };
          "Close Button On Tabs" = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Show close buttons on tabs

              Type: Bool
            '';
          };
          EnableJavascript = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Enable Javascript

              Type: Bool
            '';
          };
          "External Browser Custom Command" = mkOption {
            type = nullOr str;
            default = "firefox %u";
            description = ''
              

              Type: String
            '';
          };
          "External Browser Use Custom Command" = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Use this command:

              Type: Bool
            '';
          };
          "External Browser Use Kde Default" = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Use default KDE web browser

              Type: Bool
            '';
          };
          "LMB Behaviour" = mkOption {
            type = nullOr (either str (enum [ 
              "OpenInInternalBrowser"
              "OpenInBackground"
              "OpenInExternalBrowser"
            ]));
            default = "OpenInInternalBrowser";
            description = ''
              

              Type: Enum
              Choices: 
                - OpenInInternalBrowser
                - OpenInBackground
                - OpenInExternalBrowser
            '';
          };
          "MMB Behaviour" = mkOption {
            type = nullOr (either str (enum [ 
              "OpenInInternalBrowser"
              "OpenInBackground"
              "OpenInExternalBrowser"
            ]));
            default = "OpenInExternalBrowser";
            description = ''
              

              Type: Enum
              Choices: 
                - OpenInInternalBrowser
                - OpenInBackground
                - OpenInExternalBrowser
            '';
          };
          "New Window In Tab" = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Open links in new tab instead of in new window

              Type: Bool
            '';
          };
        };
      };
      default = {};
      description = "Browser";
    };    
    "Columns" = with types; mkOption {
      type = submodule {
        options = { 
          "Articlelist Header States" = mkOption {
            type = nullOr (either str (listOf int));
            default = "";
            description = ''
              

              Type: IntList
            '';
          };
          "Articlelist Sort Column" = mkOption {
            type = nullOr (either str int);
            default = 0;
            description = ''
              

              Type: Int
            '';
          };
          "Articlelist Sort Order" = mkOption {
            type = nullOr (either str int);
            default = 0;
            description = ''
              

              Type: Int
            '';
          };
          "Feedlist Header States" = mkOption {
            type = nullOr (either str (listOf int));
            default = "";
            description = ''
              

              Type: IntList
            '';
          };
        };
      };
      default = {};
      description = "Columns";
    };    
    "General" = with types; mkOption {
      type = submodule {
        options = { 
          "Auto Fetch Interval" = mkOption {
            type = nullOr (either str int);
            default = 30;
            description = ''
              Interval for autofetching

              Type: Int
            '';
          };
          "Disable Introduction" = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          "Disable Save As Notification" = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          "Fetch On Startup" = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Fetch on startup

              Type: Bool
            '';
          };
          "Mark All Feeds Read On Startup" = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Mark all feeds as read on startup

              Type: Bool
            '';
          };
          "Show Tray Icon" = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Show tray icon

              Type: Bool
            '';
          };
          "Show Unread In Taskbar" = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Show Unread In Taskbar

              Type: Bool
            '';
          };
          "Use Interval Fetch" = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Use interval fetching

              Type: Bool
            '';
          };
          "Use Notifications" = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Use notifications

              Type: Bool
            '';
          };
        };
      };
      default = {};
      description = "General";
    };    
    "HTML Settings" = with types; mkOption {
      type = submodule {
        options = { 
          AccessKeyEnabled = mkOption {
            type = nullOr (either str bool);
            default = true;
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
          MediumFontSize = mkOption {
            type = nullOr (either str int);
            default = 12;
            description = ''
              

              Type: Int
            '';
          };
          MinimumFontSize = mkOption {
            type = nullOr (either str int);
            default = 8;
            description = ''
              

              Type: Int
            '';
          };
        };
      };
      default = {};
      description = "HTML Settings";
    };    
    "Network" = with types; mkOption {
      type = submodule {
        options = { 
          "Concurrent Fetches" = mkOption {
            type = nullOr (either str int);
            default = 6;
            description = ''
              Concurrent Fetches

              Type: Int
            '';
          };
          "Custom UserAgent" = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              

              Type: String
            '';
          };
          "Use HTML Cache" = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Use HTML Cache

              Type: Bool
            '';
          };
        };
      };
      default = {};
      description = "Network";
    };    
    "Security" = with types; mkOption {
      type = submodule {
        options = { 
          CheckPhishingUrl = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          LoadExternalReferences = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
        };
      };
      default = {};
      description = "Security";
    };    
    "View" = with types; mkOption {
      type = submodule {
        options = { 
          "Auto Expand Folders" = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Auto-Expand folders with unread articles

              Type: Bool
            '';
          };
          "Hide Read Feeds" = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Hide feeds with no unread articles

              Type: Bool
            '';
          };
          "Lock Feeds In Place" = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Prevent feeds from being moved in the list

              Type: Bool
            '';
          };
          "Show Quick Filter" = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Show Quick Filter

              Type: Bool
            '';
          };
          ShowMenuBar = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          "Splitter 1 Sizes" = mkOption {
            type = nullOr (either str (listOf int));
            default = "225,650";
            description = ''
              Sizes for first splitter

              Type: IntList
            '';
          };
          "Splitter 2 Sizes" = mkOption {
            type = nullOr (either str (listOf int));
            default = "50,350";
            description = ''
              Sizes for second splitter

              Type: IntList
            '';
          };
          "Status Filter" = mkOption {
            type = nullOr (either str int);
            default = 0;
            description = ''
              Status Filter

              Type: Int
            '';
          };
          "Text Filter" = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              Text Filter

              Type: String
            '';
          };
          "View Mode" = mkOption {
            type = nullOr (either str int);
            default = 0;
            description = ''
              View Mode

              Type: Int
            '';
          };
        };
      };
      default = {};
      description = "View";
    };    
  };
  config = mkIf (cfg.enable && moduleCfg.enable) {
    home.packages = mkIf (moduleCfg.package != false) [ moduleCfg.package ];
    programs.plasma.files."akregatorrc" = removeAttrs moduleCfg [ "enable" "package" ];
  };
}
