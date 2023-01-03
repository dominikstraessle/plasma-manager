{ config, lib, ... }:
with lib;
let cfg = config.programs.plasma;
in {
  options.programs.plasma.kollision = { 
    "game_options" = with types; mkOption {
      type = submodule {
        options = { 
          IncreaseBallSize = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Whether automatically increasing ball size should be applied.

              Type: Bool
            '';
          };
        };
      };
      default = {};
      description = "game_options";
    };    
    "sounds" = with types; mkOption {
      type = submodule {
        options = { 
          EnableSounds = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Whether sound effects should be played.

              Type: Bool
            '';
          };
        };
      };
      default = {};
      description = "sounds";
    };    
  };
  config = mkIf cfg.enable {
    programs.plasma.files."kollisionrc" = cfg.kollision;
  };
}
