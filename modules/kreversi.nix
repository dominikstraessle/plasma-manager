{ config, lib, ... }:
with lib;
let cfg = config.programs.plasma;
in {
  options.programs.plasma.kreversi = { 
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
          CompetitiveGameChoice = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Whether to play competitively in contrast to casually.

              Type: Bool
            '';
          };
          UseColoredChips = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Whether to use colored chips instead of black and white ones.

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
    programs.plasma.files."kreversirc" = cfg.kreversi;
  };
}
