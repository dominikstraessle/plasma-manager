{ config, lib, pkgs, ... }:
with lib;
let
  cfg = config.programs.plasma;
  moduleCfg = config.programs.plasma.bluedevil;
in {
  options.programs.plasma.bluedevil = {
    enable = mkEnableOption ''
      Enable bluedevil
    '';
    package = mkOption {
      default = if (pkgs ? bluedevil) then
                        pkgs.bluedevil
                      else
                        (if pkgs.libsForQt5 ? bluedevil then pkgs.libsForQt5.bluedevil else false);
      defaultText = literalExpression "pkgs.bluedevil";
      type = with types; either bool package;
      description = mdDoc "Package to use.";
    };
    "General" = with types; mkOption {
      type = submodule {
        options = { 
          autoAccept = mkOption {
            type = nullOr (either str int);
            default = 0;
            description = ''
              Whether allow to modify shared files

              Type: Int
            '';
          };
          saveUrl = mkOption {
            type = nullOr str;
            default = "QUrl::fromLocalFile(QStandardPaths::writableLocation(QStandardPaths::DownloadLocation))";
            defaultText = "Code: true";
            description = ''
              Save received files to:

              Type: Url
            '';
          };
        };
      };
      default = {};
      description = "General";
    };    
  };
  config = mkIf (cfg.enable && moduleCfg.enable) {
    home.packages = mkIf moduleCfg.package [ moduleCfg.package ];
    programs.plasma.files."bluedevilreceiverrc" = removeAttrs moduleCfg [ "enable" "package" ];
  };
}
