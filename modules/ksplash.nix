{ config, lib, ... }:
with lib;
let
  cfg = config.programs.plasma;
  moduleCfg = config.programs.plasma.ksplash;
in {
  options.programs.plasma.ksplash = {
    enable = mkEnableOption ''
      Enable ksplash
    '';
    package = mkOption {
      default = if (pkgs ? ksplash) then
                        pkgs.ksplash
                      else
                        (if pkgs.libsForQt5 ? ksplash then pkgs.libsForQt5.ksplash else false);
      defaultText = literalExpression "pkgs.ksplash";
      type = either bool types.package;
      description = mdDoc "Package to use.";
    };
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
  config = mkIf (cfg.enable && moduleCfg.enable) {
    home.packages = mkIf moduleCfg.package [ moduleCfg.package ];
    programs.plasma.files."ksplashrc" = removeAttrs moduleCfg [ "enable" "package" ];
  };
}
