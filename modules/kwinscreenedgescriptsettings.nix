{ config, lib, ... }:
with lib;
let cfg = config.programs.plasma;
in {
  options.programs.plasma.kwin = { 
    "Script-$(ScriptName)" = with types; mkOption {
      type = submodule {
        options = { 
          "BorderActivate" = mkOption {
            type = nullOr (either str (listOf int));
            default = "ElectricNone";
            description = ''
              

              Type: IntList
            '';
          };
        };
      };
      default = {};
      description = "Script-$(ScriptName)";
    };    
  };
  config = mkIf cfg.enable {
    programs.plasma.files."kwinrc" = cfg.kwin;
  };
}
