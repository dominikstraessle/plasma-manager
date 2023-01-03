{ config, lib, ... }:
with lib;
let cfg = config.programs.plasma;
in {
  options.programs.plasma.systemsettings = { 
    "Main" = with types; mkOption {
      type = submodule {
        options = { 
          ActiveView = mkOption {
            type = nullOr str;
            default = "systemsettings_sidebar_mode";
            description = ''
              Internal name for the view used

              Type: String
            '';
          };
        };
      };
      default = {};
      description = "Main";
    };    
  };
  config = mkIf cfg.enable {
    programs.plasma.files."systemsettingsrc" = cfg.systemsettings;
  };
}
