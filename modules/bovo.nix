{ config, lib, ... }:
with lib;
let cfg = config.programs.plasma;
in {
  options.programs.plasma.bovo = { 
    "bovo" = with types; mkOption {
      type = submodule {
        options = { 
          ai = mkOption {
            type = nullOr (either str (enum [ 
              "Gabor"
              "Aron"
            ]));
            default = "Gabor";
            description = ''
              AI engine to use.

              Type: Enum
              Choices: 
                - Gabor
                - Aron
            '';
          };
          animation = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Whether moves should be animated or not.

              Type: Bool
            '';
          };
          playbackSpeed = mkOption {
            type = nullOr (either str int);
            default = 400;
            description = ''
              Speed of demo and replay playback.

              Type: Int
              Min: 150
              Max: 2000
            '';
          };
          theme = mkOption {
            type = nullOr str;
            default = "scribble";
            description = ''
              Theme

              Type: String
            '';
          };
        };
      };
      default = {};
      description = "bovo";
    };    
  };
  config = mkIf cfg.enable {
    programs.plasma.files."bovorc" = cfg.bovo;
  };
}
