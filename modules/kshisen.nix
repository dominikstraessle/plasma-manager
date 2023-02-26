{ config, lib, ... }:
with lib;
let
  cfg = config.programs.plasma;
  moduleCfg = config.programs.plasma.kshisen;
in {
  options.programs.plasma.kshisen = {
    enable = mkEnableOption ''
      Enable kshisen
    '';
    package = mkOption {
      default = if (pkgs ? kshisen) then
                        pkgs.kshisen
                      else
                        (if pkgs.libsForQt5 ? kshisen then pkgs.libsForQt5.kshisen else false);
      defaultText = literalExpression "pkgs.kshisen";
      type = either bool types.package;
      description = mdDoc "Package to use.";
    };
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
  config = mkIf (cfg.enable && moduleCfg.enable) {
    home.packages = mkIf moduleCfg.package [ moduleCfg.package ];
    programs.plasma.files."kshisenrc" = removeAttrs moduleCfg [ "enable" "package" ];
  };
}
