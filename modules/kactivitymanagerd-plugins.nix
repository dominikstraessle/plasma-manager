{ config, lib, ... }:
with lib;
let cfg = config.programs.plasma;
in {
  options.programs.plasma.kactivitymanagerd-plugins = {
    "Plugin-org.kde.ActivityManager.Resources.Scoring" = with types;
      mkOption {
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
        default = { };
        description = "Plugin-org.kde.ActivityManager.Resources.Scoring";
      };
  };
  config = mkIf cfg.enable {
    programs.plasma.files."kactivitymanagerd-pluginsrc" =
      cfg.kactivitymanagerd-plugins;
  };
}
