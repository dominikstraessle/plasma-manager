{ config, lib, ... }:
with lib;
let cfg = config.programs.plasma;
in {
  options.programs.plasma.kwin = { 
    "Input" = with types; mkOption {
      type = submodule {
        options = { 
          "TabletMode" = mkOption {
            type = nullOr str;
            default = "auto";
            description = ''
              Automatically switch to touch-optimized mode

              Type: String
            '';
          };
        };
      };
      default = {};
      description = "Input";
    };    
    "Wayland" = with types; mkOption {
      type = submodule {
        options = { 
          "EnablePrimarySelection" = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Enable middle click selection pasting

              Type: bool
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
