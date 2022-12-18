{ config, lib, ... }:
with lib;
let cfg = config.programs.plasma;
in {
  options.programs.plasma.kwin = { 
    "Effect-$(EffectName)" = with types; mkOption {
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
      description = "Effect-$(EffectName)";
    };    
  };
  config = mkIf cfg.enable {
    programs.plasma.files."kwinrc" = cfg.kwin;
  };
}
