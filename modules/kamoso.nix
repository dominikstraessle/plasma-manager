{ config, lib, ... }:
with lib;
let cfg = config.programs.plasma;
in {
  options.programs.plasma.kamoso = { 
    "General" = with types; mkOption {
      type = submodule {
        options = { 
          saveUrl = mkOption {
            type = nullOr str;
            default = "QUrl::fromLocalFile(QStandardPaths::writableLocation(QStandardPaths::PicturesLocation))";
            defaultText = "Code: true";
            description = ''
              Where the photos are saved.

              Type: Url
            '';
          };
          saveVideos = mkOption {
            type = nullOr str;
            default = "QUrl::fromLocalFile(QStandardPaths::writableLocation(QStandardPaths::MoviesLocation))";
            defaultText = "Code: true";
            description = ''
              Where the photos are saved.

              Type: Url
            '';
          };
        };
      };
      default = {};
      description = "General";
    };    
    "WebcamSettings" = with types; mkOption {
      type = submodule {
        options = { 
          deviceObjectId = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              Points to the last used webcam.

              Type: String
            '';
          };
          mirrored = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Vertically mirror the camera view.

              Type: bool
            '';
          };
        };
      };
      default = {};
      description = "WebcamSettings";
    };    
  };
  config = mkIf cfg.enable {
    programs.plasma.files."kamosorc" = cfg.kamoso;
  };
}
