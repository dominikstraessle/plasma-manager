{ config, lib, ... }:
with lib;
let cfg = config.programs.plasma;
in {
  options.programs.plasma.klaunch = { 
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
  config = mkIf cfg.enable {
    programs.plasma.files."klaunchrc" = cfg.klaunch;
  };
}
