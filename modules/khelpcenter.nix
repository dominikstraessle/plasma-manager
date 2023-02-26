{ config, lib, pkgs, ... }:
with lib;
let
  cfg = config.programs.plasma;
  moduleCfg = config.programs.plasma.khelpcenter;
in {
  options.programs.plasma.khelpcenter = {
    enable = mkEnableOption ''
      Enable khelpcenter
    '';
    package = mkOption {
      default = if (pkgs ? khelpcenter) then
                        pkgs.khelpcenter
                      else
                        (if pkgs.libsForQt5 ? khelpcenter then pkgs.libsForQt5.khelpcenter else false);
      defaultText = literalExpression "pkgs.khelpcenter";
      type = with types; either bool package;
      description = mdDoc "Package to use.";
    };
    "General" = with types; mkOption {
      type = submodule {
        options = { 
          AppsRoot = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              

              Type: Path
            '';
          };
          "Font zoom factor" = mkOption {
            type = nullOr (either str int);
            default = 100;
            description = ''
              

              Type: Int
            '';
          };
          MetaInfoDirs = mkOption {
            type = nullOr (either str (listOf str));
            default = "";
            description = ''
              

              Type: PathList
            '';
          };
          ShowMissingDocs = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          UseKonqSettings = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
        };
      };
      default = {};
      description = "General";
    };    
    "Glossary" = with types; mkOption {
      type = submodule {
        options = { 
          CachedGlossary = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              

              Type: Path
            '';
          };
          CachedGlossaryTimestamp = mkOption {
            type = nullOr (either str int);
            default = 0;
            description = ''
              

              Type: Int
            '';
          };
        };
      };
      default = {};
      description = "Glossary";
    };    
    "Info pages" = with types; mkOption {
      type = submodule {
        options = { 
          "Search paths" = mkOption {
            type = nullOr (either str (listOf str));
            default = "/usr/share/info,/usr/info,/usr/lib/info,/usr/local/info,/usr/local/lib/info,/usr/X11R6/info,/usr/X11R6/lib/info,/usr/X11R6/lib/xemacs/info";
            description = ''
              

              Type: PathList
            '';
          };
        };
      };
      default = {};
      description = "Info pages";
    };    
    "Layout" = with types; mkOption {
      type = submodule {
        options = { 
          CurrentTab = mkOption {
            type = nullOr (either str (enum [ 
              "Content"
              "Search"
              "Glossary"
            ]));
            default = "Content";
            description = ''
              Currently visible navigator tab

              Type: Enum
              Choices: 
                - Content
                - Search
                - Glossary
            '';
          };
        };
      };
      default = {};
      description = "Layout";
    };    
    "MainWindowState" = with types; mkOption {
      type = submodule {
        options = { 
          Splitter = mkOption {
            type = nullOr (either str (listOf int));
            default = "";
            description = ''
              

              Type: IntList
            '';
          };
        };
      };
      default = {};
      description = "MainWindowState";
    };    
    "ScrollKeeper" = with types; mkOption {
      type = submodule {
        options = { 
          ShowEmptyDirs = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
        };
      };
      default = {};
      description = "ScrollKeeper";
    };    
    "Search" = with types; mkOption {
      type = submodule {
        options = { 
          IndexDirectory = mkOption {
            type = nullOr str;
            default = ''QStandardPaths::writableLocation(QStandardPaths::CacheLocation) + QStringLiteral("/index/")'';
            defaultText = "Code: true";
            description = ''
              Path to index directory.

              Type: Path
            '';
          };
          MaxCount = mkOption {
            type = nullOr (either str int);
            default = 1;
            description = ''
              

              Type: Int
            '';
          };
          Method = mkOption {
            type = nullOr (either str int);
            default = 0;
            description = ''
              

              Type: Int
            '';
          };
        };
      };
      default = {};
      description = "Search";
    };    
  };
  config = mkIf (cfg.enable && moduleCfg.enable) {
    home.packages = mkIf (moduleCfg.package != false) [ moduleCfg.package ];
    programs.plasma.files."khelpcenterrc" = removeAttrs moduleCfg [ "enable" "package" ];
  };
}
