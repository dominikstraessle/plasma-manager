{ config, lib, ... }:
with lib;
let cfg = config.programs.plasma;
in {
  options.programs.plasma.kshisen = { 
    "Game" = with types; mkOption {
      type = submodule {
        options = { 
          ChineseStyle = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          Gravity = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          Level = mkOption {
            type = nullOr (either str int);
            default = 1;
            description = ''
              

              Type: Int
              Min: 0
              Max: 2
            '';
          };
          ShowUnsolvableMessage = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          Size = mkOption {
            type = nullOr (either str int);
            default = 2;
            description = ''
              

              Type: Int
              Min: 0
              Max: 5
            '';
          };
          Solvable = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          Sounds = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          Speed = mkOption {
            type = nullOr (either str int);
            default = 2;
            description = ''
              

              Type: Int
              Min: 0
              Max: 4
            '';
          };
          TilesCanSlide = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
        };
      };
      default = {};
      description = "Game";
    };    
    "General" = with types; mkOption {
      type = submodule {
        options = { 
          "Background_file" = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              The background to use.

              Type: String
            '';
          };
          "Tileset_file" = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              The tile set to use.

              Type: String
            '';
          };
        };
      };
      default = {};
      description = "General";
    };    
  };
  config = mkIf cfg.enable {
    programs.plasma.files."kshisenrc" = cfg.kshisen;
  };
}
