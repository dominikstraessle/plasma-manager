{ config, lib, ... }:
with lib;
let
  cfg = config.programs.plasma;
  moduleCfg = config.programs.plasma.kactivitymanagerd;
in {
  options.programs.plasma.kactivitymanagerd = {
    enable = mkEnableOption ''
      Enable kactivitymanagerd
    '';
    package = mkOption {
      default = if (pkgs ? kactivitymanagerd) then
                        pkgs.kactivitymanagerd
                      else
                        (if pkgs.libsForQt5 ? kactivitymanagerd then pkgs.libsForQt5.kactivitymanagerd else false);
      defaultText = literalExpression "pkgs.kactivitymanagerd";
      type = either bool types.package;
      description = mdDoc "Package to use.";
    };
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
  config = mkIf (cfg.enable && moduleCfg.enable) {
    home.packages = mkIf moduleCfg.package [ moduleCfg.package ];
    programs.plasma.files."kactivitymanagerdrc" = removeAttrs moduleCfg [ "enable" "package" ];
  };
}
