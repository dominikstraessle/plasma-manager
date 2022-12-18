{ config, lib, ... }:
with lib;
let cfg = config.programs.plasma;
in {
  options.programs.plasma.kwin = { 
    "Wayland" = with types; mkOption {
      type = submodule {
        options = { 
          InputMethod = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              

              Type: Path
            '';
          };
        };
      };
      default = {};
      description = "Wayland";
    };    
  };
  config = mkIf cfg.enable {
    programs.plasma.files."kwinrc" = cfg.kwin;
  };
}
