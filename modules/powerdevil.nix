{ config, lib, ... }:
with lib;
let cfg = config.programs.plasma;
in {
  options.programs.plasma.powerdevil = { 
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
  config = mkIf cfg.enable {
    programs.plasma.files."powerdevilrc" = cfg.powerdevil;
  };
}
