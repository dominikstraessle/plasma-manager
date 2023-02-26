{ config, lib, pkgs, ... }:
with lib;
let
  cfg = config.programs.plasma;
  moduleCfg = config.programs.plasma.katomic;
in {
  options.programs.plasma.katomic = {
    enable = mkEnableOption ''
      Enable katomic
    '';
    package = mkOption {
      default = if (pkgs ? katomic) then
                        pkgs.katomic
                      else
                        (if pkgs.libsForQt5 ? katomic then pkgs.libsForQt5.katomic else false);
      defaultText = literalExpression "pkgs.katomic";
      type = with types; either bool package;
      description = mdDoc "Package to use.";
    };
    "Game" = with types; mkOption {
      type = submodule {
        options = { 
          AnimationSpeed = mkOption {
            type = nullOr (either str (enum [ 
              "Slow"
              "Normal"
              "Fast"
            ]));
            default = "Normal";
            description = ''
              The speed of the animations.

              Type: Enum
              Choices: 
                - Slow
                - Normal
                - Fast
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
          LastPlayedLevelSet = mkOption {
            type = nullOr str;
            default = "default_levels";
            description = ''
              Last played levelset

              Type: String
            '';
          };
          SavedBackgroundHeight = mkOption {
            type = nullOr (either str int);
            default = -1;
            description = ''
              Height of saved background

              Type: Int
            '';
          };
          SavedBackgroundWidth = mkOption {
            type = nullOr (either str int);
            default = -1;
            description = ''
              Width of saved background

              Type: Int
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
    programs.plasma.files."katomicrc" = removeAttrs moduleCfg [ "enable" "package" ];
  };
}
