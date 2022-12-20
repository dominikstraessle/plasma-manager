{ config, lib, ... }:
with lib;
let cfg = config.programs.plasma;
in {
  options.programs.plasma.discover = { 
    "DiscoverUI" = with types; mkOption {
      type = submodule {
        options = { 
          appsListPageSorting = mkOption {
            type = nullOr (either str int);
            default = "ResourcesProxyModel::SortableRatingRole";
            description = ''
              

              Type: Int
            '';
          };
          installedPageSorting = mkOption {
            type = nullOr (either str int);
            default = "ResourcesProxyModel::NameRole";
            description = ''
              

              Type: Int
            '';
          };
        };
      };
      default = {};
      description = "DiscoverUI";
    };    
    "Global" = with types; mkOption {
      type = submodule {
        options = { 
          FeedbackLevel = mkOption {
            type = nullOr (either str int);
            default = "int(KUserFeedback::Provider::NoTelemetry)";
            description = ''
              

              Type: Int
            '';
          };
          LastNotificationTime = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              

              Type: DateTime
            '';
          };
          LastUnattendedTrigger = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              

              Type: DateTime
            '';
          };
          RequiredNotificationInterval = mkOption {
            type = nullOr (either str int);
            default = "60 * 60 * 24";
            defaultText = "Code: true";
            description = ''
              

              Type: Int
            '';
          };
          UseUnattendedUpdates = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
        };
      };
      default = {};
      description = "Global";
    };    
    "Software" = with types; mkOption {
      type = submodule {
        options = { 
          UseOfflineUpdates = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
        };
      };
      default = {};
      description = "Software";
    };    
  };
  config = mkIf cfg.enable {
    programs.plasma.files."discoverrc" = cfg.discover;
  };
}
