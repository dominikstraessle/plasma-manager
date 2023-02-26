{ config, lib, ... }:
with lib;
let
  cfg = config.programs.plasma;
  moduleCfg = config.programs.plasma.powerdevil;
in {
  options.programs.plasma.powerdevil = {
    enable = mkEnableOption ''
      Enable powerdevil
    '';
    package = mkOption {
      default = if (pkgs ? powerdevil) then
                        pkgs.powerdevil
                      else
                        (if pkgs.libsForQt5 ? powerdevil then pkgs.libsForQt5.powerdevil else false);
      defaultText = literalExpression "pkgs.powerdevil";
      type = with types; either bool package;
      description = mdDoc "Package to use.";
    };
    "BatteryManagement" = with types; mkOption {
      type = submodule {
        options = { 
          BatteryCriticalAction = mkOption {
            type = nullOr (either str int);
            default = 2;
            description = ''
              

              Type: Int
            '';
          };
          BatteryCriticalLevel = mkOption {
            type = nullOr (either str int);
            default = 5;
            description = ''
              

              Type: Int
            '';
          };
          BatteryLowLevel = mkOption {
            type = nullOr (either str int);
            default = 10;
            description = ''
              

              Type: Int
            '';
          };
          PeripheralBatteryLowLevel = mkOption {
            type = nullOr (either str int);
            default = 10;
            description = ''
              

              Type: Int
            '';
          };
        };
      };
      default = {};
      description = "BatteryManagement";
    };    
    "Brightness" = with types; mkOption {
      type = submodule {
        options = { 
          brightnessAnimationDuration = mkOption {
            type = nullOr (either str int);
            default = 250;
            description = ''
              

              Type: Int
            '';
          };
          brightnessAnimationThreshold = mkOption {
            type = nullOr (either str int);
            default = 100;
            description = ''
              

              Type: Int
            '';
          };
        };
      };
      default = {};
      description = "Brightness";
    };    
    "General" = with types; mkOption {
      type = submodule {
        options = { 
          doNotInhibitOnLidClose = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          pausePlayersOnSuspend = mkOption {
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
  };
  config = mkIf (cfg.enable && moduleCfg.enable) {
    home.packages = mkIf moduleCfg.package [ moduleCfg.package ];
    programs.plasma.files."powerdevilrc" = removeAttrs moduleCfg [ "enable" "package" ];
  };
}
