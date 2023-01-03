{ config, lib, ... }:
with lib;
let cfg = config.programs.plasma;
in {
  options.programs.plasma.kmines = { 
    "General" = with types; mkOption {
      type = submodule {
        options = { 
          "disable_score_on_reset" = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          "explore_with_left_click_on_number_cells" = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Left click on a number cell will have the same effect as mid click.

              Type: Bool
            '';
          };
          "kmines_reset" = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          "question mark" = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Whether the "unsure" marker may be used.

              Type: Bool
            '';
          };
        };
      };
      default = {};
      description = "General";
    };    
    "Options" = with types; mkOption {
      type = submodule {
        options = { 
          "custom height" = mkOption {
            type = nullOr (either str int);
            default = 10;
            description = ''
              The height of the playing field.

              Type: Int
              Min: 5
              Max: 50
            '';
          };
          "custom mines" = mkOption {
            type = nullOr (either str int);
            default = 20;
            description = ''
              The number of mines in the playing field.

              Type: Int
              Min: 1
            '';
          };
          "custom width" = mkOption {
            type = nullOr (either str int);
            default = 10;
            description = ''
              The width of the playing field.

              Type: Int
              Min: 5
              Max: 50
            '';
          };
        };
      };
      default = {};
      description = "Options";
    };    
  };
  config = mkIf cfg.enable {
    programs.plasma.files."kminesrc" = cfg.kmines;
  };
}
