{ config, lib, ... }:
with lib;
let cfg = config.programs.plasma;
in {
  options.programs.plasma.config = { 
    "General" = with types; mkOption {
      type = submodule {
        options = { 
          ShouldShow = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Whether to show the welcome app on next boot, because the user has not either skipped or completed the initial setup process.

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
    programs.plasma.files."configrc" = cfg.config;
  };
}
