{ config, lib, ... }:
with lib;
let cfg = config.programs.plasma;
in {
  options.programs.plasma.kclock = { 
    "General" = with types; mkOption {
      type = submodule {
        options = { 
          showAlarms = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Whether or not to show the next alarm to ring.

              Type: Bool
            '';
          };
          showDate = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Whether or not to show the date below the time.

              Type: Bool
            '';
          };
          textAlignment = mkOption {
            type = nullOr str;
            default = "Center";
            description = ''
              The alignment of the widget text.

              Type: String
            '';
          };
          twelveHourTime = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Whether or not to show the time in 12 hour format rather than 24 hour format.

              Type: Bool
            '';
          };
        };
      };
      default = {};
      description = "General";
    };    
    "Global" = with types; mkOption {
      type = submodule {
        options = { 
          timeFormat = mkOption {
            type = nullOr str;
            default = "SystemDefault";
            description = ''
              Whether to use 24 hour or 12 hour time in the UI.

              Type: String
            '';
          };
        };
      };
      default = {};
      description = "Global";
    };    
  };
  config = mkIf cfg.enable {
    programs.plasma.files."kclockrc" = cfg.kclock;
  };
}
