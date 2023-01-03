{ config, lib, ... }:
with lib;
let cfg = config.programs.plasma;
in {
  options.programs.plasma.alligator = { 
    "General" = with types; mkOption {
      type = submodule {
        options = { 
          articleFontSize = mkOption {
            type = nullOr (either str int);
            default = 10;
            description = ''
              Article font size

              Type: Int
            '';
          };
          articleFontUseSystem = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Use default system font

              Type: Bool
            '';
          };
          deleteAfterCount = mkOption {
            type = nullOr (either str int);
            default = 2;
            description = ''
              Delete after count

              Type: Int
            '';
          };
          deleteAfterType = mkOption {
            type = nullOr (either str int);
            default = 3;
            description = ''
              Delete after type

              Type: Int
            '';
          };
        };
      };
      default = {};
      description = "General";
    };    
  };
  config = mkIf cfg.enable {
    programs.plasma.files."alligatorrc" = cfg.alligator;
  };
}
