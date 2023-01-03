{ config, lib, ... }:
with lib;
let cfg = config.programs.plasma;
in {
  options.programs.plasma.kbreakout = { 
    "General" = with types; mkOption {
      type = submodule {
        options = { 
          FireOnClick = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Fire on mouse click

              Type: Bool
            '';
          };
        };
      };
      default = {};
      description = "General";
    };    
  };
  config = mkIf cfg.enable {
    programs.plasma.files."kbreakoutrc" = cfg.kbreakout;
  };
}
