{ config, lib, ... }:
with lib;
let cfg = config.programs.plasma;
in {
  options.programs.plasma.kconfigwidgets = { 
    "Group1" = with types; mkOption {
      type = submodule {
        options = { 
          foo = mkOption {
            type = nullOr str;
            default = "default value";
            description = ''
              

              Type: String
            '';
          };
        };
      };
      default = {};
      description = "Group1";
    };    
  };
  config = mkIf cfg.enable {
    programs.plasma.files."kconfigdialog_unittestrc" = cfg.kconfigwidgets;
  };
}
