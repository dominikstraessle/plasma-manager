{ config, lib, pkgs, ... }:
with lib;
let
  cfg = config.programs.plasma;
  moduleCfg = config.programs.plasma.discover;
in {
  options.programs.plasma.discover = {
    enable = mkEnableOption ''
      Enable discover
    '';
    package = mkOption {
      default = if (pkgs ? discover) then
                        pkgs.discover
                      else
                        (if pkgs.libsForQt5 ? discover then pkgs.libsForQt5.discover else false);
      defaultText = literalExpression "pkgs.discover";
      type = with types; either bool package;
      description = mdDoc "Package to use.";
    };
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
  config = mkIf (cfg.enable && moduleCfg.enable) {
    home.packages = mkIf (moduleCfg.package != false) [ moduleCfg.package ];
    programs.plasma.files."discoverrc" = removeAttrs moduleCfg [ "enable" "package" ];
  };
}
