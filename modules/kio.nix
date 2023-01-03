{ config, lib, ... }:
with lib;
let cfg = config.programs.plasma;
in {
  options.programs.plasma.kio = { 
    "General" = with types; mkOption {
      type = submodule {
        options = { 
          rotate = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Rotate JPEG automatically

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
    programs.plasma.files."jpegcreatorrc" = cfg.kio;
  };
}
