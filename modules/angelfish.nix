{ config, lib, ... }:
with lib;
let
  cfg = config.programs.plasma;
  moduleCfg = config.programs.plasma.angelfish;
in {
  options.programs.plasma.angelfish = {
    enable = mkEnableOption ''
      Enable angelfish
    '';
    package = mkOption {
      default = if (pkgs ? angelfish) then
                        pkgs.angelfish
                      else
                        (if pkgs.libsForQt5 ? angelfish then pkgs.libsForQt5.angelfish else false);
      defaultText = literalExpression "pkgs.angelfish";
      type = either bool types.package;
      description = mdDoc "Package to use.";
    };
    "Browser" = with types; mkOption {
      type = submodule {
        options = { 
          homepage = mkOption {
            type = nullOr str;
            default = ''QStringLiteral("https://start.duckduckgo.com")'';
            description = ''
              

              Type: string
            '';
          };
          searchBaseUrl = mkOption {
            type = nullOr str;
            default = ''QStringLiteral("https://start.duckduckgo.com/?q=")'';
            description = ''
              

              Type: string
            '';
          };
        };
      };
      default = {};
      description = "Browser";
    };    
    "NavigationBar" = with types; mkOption {
      type = submodule {
        options = { 
          navBarBack = mkOption {
            type = nullOr (either str bool);
            default = "!SettingsHelper::isMobile()";
            description = ''
              

              Type: bool
            '';
          };
          navBarContextMenu = mkOption {
            type = nullOr (either str bool);
            default = "";
            description = ''
              

              Type: bool
            '';
          };
          navBarForward = mkOption {
            type = nullOr (either str bool);
            default = "!SettingsHelper::isMobile()";
            description = ''
              

              Type: bool
            '';
          };
          navBarMainMenu = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: bool
            '';
          };
          navBarReload = mkOption {
            type = nullOr (either str bool);
            default = "!SettingsHelper::isMobile()";
            description = ''
              

              Type: bool
            '';
          };
          navBarTabs = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: bool
            '';
          };
        };
      };
      default = {};
      description = "NavigationBar";
    };    
    "SettingsPage" = with types; mkOption {
      type = submodule {
        options = { 
          searchCustomUrl = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              

              Type: string
            '';
          };
        };
      };
      default = {};
      description = "SettingsPage";
    };    
    "WebView" = with types; mkOption {
      type = submodule {
        options = { 
          profile = mkOption {
            type = nullOr str;
            default = ''QStringLiteral("DefaultProfile")'';
            description = ''
              

              Type: string
            '';
          };
          webAutoLoadImages = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: bool
            '';
          };
          webJavaScriptEnabled = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: bool
            '';
          };
        };
      };
      default = {};
      description = "WebView";
    };    
    "Window" = with types; mkOption {
      type = submodule {
        options = { 
          windowHeight = mkOption {
            type = nullOr (either str int);
            default = 450;
            description = ''
              

              Type: int
            '';
          };
          windowWidth = mkOption {
            type = nullOr (either str int);
            default = 300;
            description = ''
              

              Type: int
            '';
          };
          windowX = mkOption {
            type = nullOr (either str int);
            default = "";
            description = ''
              

              Type: int
            '';
          };
          windowY = mkOption {
            type = nullOr (either str int);
            default = "";
            description = ''
              

              Type: int
            '';
          };
        };
      };
      default = {};
      description = "Window";
    };    
  };
  config = mkIf (cfg.enable && moduleCfg.enable) {
    home.packages = mkIf moduleCfg.package [ moduleCfg.package ];
    programs.plasma.files."angelfishrc" = removeAttrs moduleCfg [ "enable" "package" ];
  };
}
