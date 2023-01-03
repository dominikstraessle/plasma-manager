{ config, lib, ... }:
with lib;
let cfg = config.programs.plasma;
in {
  options.programs.plasma.kbounce = { 
    "General" = with types; mkOption {
      type = submodule {
        options = { 
          BackgroundPicturePath = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              

              Type: String
            '';
          };
          UseRandomBackgroundPictures = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
        };
      };
      default = {};
      description = "General";
    };    
    "Sound" = with types; mkOption {
      type = submodule {
        options = { 
          PlaySounds = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Whether game sounds are played.

              Type: Bool
            '';
          };
        };
      };
      default = {};
      description = "Sound";
    };    
  };
  config = mkIf cfg.enable {
    programs.plasma.files."kbouncerc" = cfg.kbounce;
  };
}
