{ config, lib, ... }:
with lib;
let cfg = config.programs.plasma;
in {
  options.programs.plasma.kcmutils = { 
    "Mouse" = with types; mkOption {
      type = submodule {
        options = { 
          cursorSize = mkOption {
            type = nullOr (either str int);
            default = 24;
            description = ''
              Current cursor size

              Type: Int
            '';
          };
          cursorTheme = mkOption {
            type = nullOr str;
            default = "breeze_cursors";
            description = ''
              Name of the current cursor theme

              Type: String
            '';
          };
        };
      };
      default = {};
      description = "Mouse";
    };    
  };
  config = mkIf cfg.enable {
    programs.plasma.files."sometestfilerc" = cfg.kcmutils;
  };
}
