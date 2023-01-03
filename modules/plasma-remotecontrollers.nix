{ config, lib, ... }:
with lib;
let cfg = config.programs.plasma;
in {
  options.programs.plasma.plasma-remotecontrollers = { 
    "Inhibit" = with types; mkOption {
      type = submodule {
        options = { 
          Applications = mkOption {
            type = nullOr (either str (listOf str));
            default = "kodi.desktop,xonotic-sdl.desktop,steam_app_*";
            description = ''
              

              Type: StringList
            '';
          };
        };
      };
      default = {};
      description = "Inhibit";
    };    
  };
  config = mkIf cfg.enable {
    programs.plasma.files."plasma-remotecontrollersrc" = cfg.plasma-remotecontrollers;
  };
}
