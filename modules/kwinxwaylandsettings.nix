{ config, lib, ... }:
with lib;
let cfg = config.programs.plasma;
in {
  options.programs.plasma.kwin = { 
    "Xwayland" = with types; mkOption {
      type = submodule {
        options = { 
          XwaylandEavesdrops = mkOption {
            type = nullOr (either str (enum [ 
              "None"
              "Modifiers"
              "Combinations"
              "All"
            ]));
            default = "None";
            description = ''
              

              Type: Enum
              Choices: 
                - None
                - Modifiers
                - Combinations
                - All
            '';
          };
        };
      };
      default = {};
      description = "Xwayland";
    };    
  };
  config = mkIf cfg.enable {
    programs.plasma.files."kwinrc" = cfg.kwin;
  };
}
