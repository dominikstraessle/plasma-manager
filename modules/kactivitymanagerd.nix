{ config, lib, ... }:
with lib;
let cfg = config.programs.plasma;
in {
  options.programs.plasma.kactivitymanagerd = { 
    "Plugins" = with types; mkOption {
      type = submodule {
        options = { 
          "org.kde.ActivityManager.ResourceScoringEnabled" = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          "org.kde.ActivityManager.VirtualDesktopSwitchEnabled" = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
        };
      };
      default = {};
      description = "Plugins";
    };    
  };
  config = mkIf cfg.enable {
    programs.plasma.files."kactivitymanagerdrc" = cfg.kactivitymanagerd;
  };
}
