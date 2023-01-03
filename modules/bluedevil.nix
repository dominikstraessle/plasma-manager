{ config, lib, ... }:
with lib;
let cfg = config.programs.plasma;
in {
  options.programs.plasma.bluedevil = { 
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
  config = mkIf cfg.enable {
    programs.plasma.files."bluedevilreceiverrc" = cfg.bluedevil;
  };
}
