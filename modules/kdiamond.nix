{ config, lib, ... }:
with lib;
let cfg = config.programs.plasma;
in {
  options.programs.plasma.kdiamond = { 
    "Preferences" = with types; mkOption {
      type = submodule {
        options = { 
          Untimed = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Play an untimed game.

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
    programs.plasma.files."kdiamondrc" = cfg.kdiamond;
  };
}
