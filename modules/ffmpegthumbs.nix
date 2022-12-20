{ config, lib, ... }:
with lib;
let cfg = config.programs.plasma;
in {
  options.programs.plasma.ffmpegthumbs = { 
    "General" = with types; mkOption {
      type = submodule {
        options = { 
          cacheSize = mkOption {
            type = nullOr (either str int);
            default = 51200;
            description = ''
              Cache size (KiB)

              Type: UInt
            '';
          };
          filmstrip = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Embed filmstrip effect

              Type: Bool
            '';
          };
          sequenceSeekPercentages = mkOption {
            type = nullOr (either str (listOf int));
            default = "20,35,50,65,80";
            description = ''
              Sequence seek percentages

              Type: IntList
            '';
          };
        };
      };
      default = {};
      description = "General";
    };    
  };
  config = mkIf cfg.enable {
    programs.plasma.files."ffmpegthumbsrc" = cfg.ffmpegthumbs;
  };
}
