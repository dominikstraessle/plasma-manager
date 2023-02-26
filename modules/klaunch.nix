{ config, lib, ... }:
with lib;
let
  cfg = config.programs.plasma;
  moduleCfg = config.programs.plasma.klaunch;
in {
  options.programs.plasma.klaunch = {
    enable = mkEnableOption ''
      Enable klaunch
    '';
    package = mkOption {
      default = if (pkgs ? klaunch) then
                        pkgs.klaunch
                      else
                        (if pkgs.libsForQt5 ? klaunch then pkgs.libsForQt5.klaunch else false);
      defaultText = literalExpression "pkgs.klaunch";
      type = with types; either bool package;
      description = mdDoc "Package to use.";
    };
    "BusyCursorSettings" = with types; mkOption {
      type = submodule {
        options = { 
          Blinking = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          Bouncing = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          Timeout = mkOption {
            type = nullOr (either str int);
            default = 5;
            description = ''
              Timeout in seconds

              Type: Int
            '';
          };
        };
      };
      default = {};
      description = "BusyCursorSettings";
    };    
    "FeedbackStyle" = with types; mkOption {
      type = submodule {
        options = { 
          BusyCursor = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          TaskbarButton = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
        };
      };
      default = {};
      description = "FeedbackStyle";
    };    
    "TaskbarButtonSettings" = with types; mkOption {
      type = submodule {
        options = { 
          Timeout = mkOption {
            type = nullOr (either str int);
            default = 5;
            description = ''
              Timeout in seconds

              Type: Int
            '';
          };
        };
      };
      default = {};
      description = "TaskbarButtonSettings";
    };    
  };
  config = mkIf (cfg.enable && moduleCfg.enable) {
    home.packages = mkIf moduleCfg.package [ moduleCfg.package ];
    programs.plasma.files."klaunchrc" = removeAttrs moduleCfg [ "enable" "package" ];
  };
}
