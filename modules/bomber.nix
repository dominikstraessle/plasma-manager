{ config, lib, ... }:
with lib;
let cfg = config.programs.plasma;
in {
  options.programs.plasma.bomber = { 
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
    programs.plasma.files."bomberrc" = cfg.bomber;
  };
}
