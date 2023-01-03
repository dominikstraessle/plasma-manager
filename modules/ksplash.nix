{ config, lib, ... }:
with lib;
let cfg = config.programs.plasma;
in {
  options.programs.plasma.ksplash = { 
    "KSplash" = with types; mkOption {
      type = submodule {
        options = { 
          Engine = mkOption {
            type = nullOr str;
            default = ''theme() == QStringLiteral("None") ? QStringLiteral("none") : QStringLiteral("KSplashQML")'';
            defaultText = "Code: true";
            description = ''
              For future use

              Type: String
            '';
          };
          Theme = mkOption {
            type = nullOr str;
            default = "org.kde.breeze.desktop";
            description = ''
              Name of the current splash theme

              Type: String
            '';
          };
        };
      };
      default = {};
      description = "KSplash";
    };    
  };
  config = mkIf cfg.enable {
    programs.plasma.files."ksplashrc" = cfg.ksplash;
  };
}
