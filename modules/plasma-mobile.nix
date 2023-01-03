{ config, lib, ... }:
with lib;
let cfg = config.programs.plasma;
in {
  options.programs.plasma.plasma-mobile = { 
    "General" = with types; mkOption {
      type = submodule {
        options = { 
          AppOrder = mkOption {
            type = nullOr (either str (listOf str));
            default = "org.kde.phone.dialer.desktop";
            description = ''
              order of apps

              Type: StringList
            '';
          };
        };
      };
      default = {};
      description = "General";
    };    
  };
  config = mkIf cfg.enable {
    programs.plasma.files."plasma-mobilerc" = cfg.plasma-mobile;
  };
}
