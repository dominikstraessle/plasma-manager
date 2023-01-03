{ config, lib, ... }:
with lib;
let cfg = config.programs.plasma;
in {
  options.programs.plasma.kapman = { 
    "General" = with types; mkOption {
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
          Theme = mkOption {
            type = nullOr str;
            default = "themes/mummies_crypt.desktop";
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
  };
  config = mkIf cfg.enable {
    programs.plasma.files."kapmanrc" = cfg.kapman;
  };
}
