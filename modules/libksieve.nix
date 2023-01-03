{ config, lib, ... }:
with lib;
let cfg = config.programs.plasma;
in {
  options.programs.plasma.libksieve = { 
    "General" = with types; mkOption {
      type = submodule {
        options = { 
          UseGraphicEditorByDefault = mkOption {
            type = nullOr (either str bool);
            default = "${USE_GRAPHICAL_SIEVE_EDITOR}";
            description = ''
              Use graphical editor by default to edit sieve script.

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
    programs.plasma.files."libksieverc" = cfg.libksieve;
  };
}
