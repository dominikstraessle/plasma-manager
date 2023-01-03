{ config, lib, ... }:
with lib;
let cfg = config.programs.plasma;
in {
  options.programs.plasma.katomic = { 
    "Game" = with types; mkOption {
      type = submodule {
        options = { 
          AnimationSpeed = mkOption {
            type = nullOr (either str (enum [ 
              "Slow"
              "Normal"
              "Fast"
            ]));
            default = "Normal";
            description = ''
              The speed of the animations.

              Type: Enum
              Choices: 
                - Slow
                - Normal
                - Fast
            '';
          };
        };
      };
      default = {};
      description = "Game";
    };    
    "General" = with types; mkOption {
      type = submodule {
        options = { 
          LastPlayedLevelSet = mkOption {
            type = nullOr str;
            default = "default_levels";
            description = ''
              Last played levelset

              Type: String
            '';
          };
          SavedBackgroundHeight = mkOption {
            type = nullOr (either str int);
            default = -1;
            description = ''
              Height of saved background

              Type: Int
            '';
          };
          SavedBackgroundWidth = mkOption {
            type = nullOr (either str int);
            default = -1;
            description = ''
              Width of saved background

              Type: Int
            '';
          };
        };
      };
      default = {};
      description = "General";
    };    
  };
  config = mkIf cfg.enable {
    programs.plasma.files."katomicrc" = cfg.katomic;
  };
}
