{ config, lib, ... }:
with lib;
let cfg = config.programs.plasma;
in {
  options.programs.plasma.kwin = { 
    "Plugins" = with types; mkOption {
      type = submodule {
        options = { 
          "desktopchangeosdEnabled" = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Display in an OSD the virtual desktop name when switching between virtual desktops

              Type: bool
            '';
          };
        };
      };
      default = {};
      description = "Plugins";
    };    
    "Script-desktopchangeosd" = with types; mkOption {
      type = submodule {
        options = { 
          "PopupHideDelay" = mkOption {
            type = nullOr (either str int);
            default = 1000;
            description = ''
              Duraton of the OSD

              Type: int
            '';
          };
          "TextOnly" = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Whether or not to display desktop layout in the OSD

              Type: bool
            '';
          };
        };
      };
      default = {};
      description = "Script-desktopchangeosd";
    };    
    "Windows" = with types; mkOption {
      type = submodule {
        options = { 
          "RollOverDesktops" = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Whether or not, we circle through the virtual desktop when moving from one to the next

              Type: bool
            '';
          };
        };
      };
      default = {};
      description = "Windows";
    };    
  };
  config = mkIf cfg.enable {
    programs.plasma.files."kwinrc" = cfg.kwin;
  };
}
