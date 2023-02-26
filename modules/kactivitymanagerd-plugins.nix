{ config, lib, pkgs, ... }:
with lib;
let
  cfg = config.programs.plasma;
  moduleCfg = config.programs.plasma.kactivitymanagerd-plugins;
in {
  options.programs.plasma.kactivitymanagerd-plugins = {
    enable = mkEnableOption ''
      Enable kactivitymanagerd-plugins
    '';
    package = mkOption {
      default = if (pkgs ? kactivitymanagerd-plugins) then
                        pkgs.kactivitymanagerd-plugins
                      else
                        (if pkgs.libsForQt5 ? kactivitymanagerd-plugins then pkgs.libsForQt5.kactivitymanagerd-plugins else false);
      defaultText = literalExpression "pkgs.kactivitymanagerd-plugins";
      type = with types; either bool package;
      description = mdDoc "Package to use.";
    };
    "Plugin-org.kde.ActivityManager.Resources.Scoring" = with types; mkOption {
      type = submodule {
        options = { 
          "allowed-applications" = mkOption {
            type = nullOr (either str (listOf str));
            default = "";
            description = ''
              List of Applications whose activity history to save

              Type: StringList
            '';
          };
          "blocked-applications" = mkOption {
            type = nullOr (either str (listOf str));
            default = "";
            description = ''
              List of Applications whose activity history not to save

              Type: StringList
            '';
          };
          "blocked-by-default" = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          "keep-history-for" = mkOption {
            type = nullOr (either str int);
            default = 0;
            description = ''
              How many months keep the activity history

              Type: Int
            '';
          };
          "what-to-remember" = mkOption {
            type = nullOr (either str int);
            default = 0;
            description = ''
              Which data to keep in activity history

              Type: Int
            '';
          };
        };
      };
      default = {};
      description = "Plugin-org.kde.ActivityManager.Resources.Scoring";
    };    
  };
  config = mkIf (cfg.enable && moduleCfg.enable) {
    home.packages = mkIf moduleCfg.package [ moduleCfg.package ];
    programs.plasma.files."kactivitymanagerd-pluginsrc" = removeAttrs moduleCfg [ "enable" "package" ];
  };
}
