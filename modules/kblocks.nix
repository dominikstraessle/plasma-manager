{ config, lib, ... }:
with lib;
let cfg = config.programs.plasma;
in {
  options.programs.plasma.kblocks = { 
    "General" = with types; mkOption {
      type = submodule {
        options = { 
          Theme = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              The graphical theme to be used.

              Type: String
            '';
          };
        };
      };
      default = {};
      description = "General";
    };    
    "Preferences" = with types; mkOption {
      type = submodule {
        options = { 
          Sounds = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Whether sound effects should be played.

              Type: Bool
            '';
          };
        };
      };
      default = {};
      description = "Preferences";
    };    
  };
  config = mkIf cfg.enable {
    programs.plasma.files."kblocksrc" = cfg.kblocks;
  };
}
