{ config, lib, ... }:
with lib;
let cfg = config.programs.plasma;
in {
  options.programs.plasma.ktrip = { 
    "Backends" = with types; mkOption {
      type = submodule {
        options = { 
          EnabledBackends = mkOption {
            type = nullOr (either str (listOf str));
            default = "";
            description = ''
              Enabled backends

              Type: StringList
            '';
          };
        };
      };
      default = {};
      description = "Backends";
    };    
    "General" = with types; mkOption {
      type = submodule {
        options = { 
          firstRun = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              First run

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
    programs.plasma.files."ktriprc" = cfg.ktrip;
  };
}
