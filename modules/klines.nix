{ config, lib, ... }:
with lib;
let cfg = config.programs.plasma;
in {
  options.programs.plasma.klines = { 
    "Game" = with types; mkOption {
      type = submodule {
        options = { 
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
          ShowNext = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Whether to show the next set of balls.

              Type: Bool
            '';
          };
        };
      };
      default = {};
      description = "Game";
    };    
  };
  config = mkIf cfg.enable {
    programs.plasma.files."klinesrc" = cfg.klines;
  };
}
