{ config, lib, pkgs, ... }:
with lib;
let
  cfg = config.programs.plasma;
  moduleCfg = config.programs.plasma.kollision;
in {
  options.programs.plasma.kollision = {
    enable = mkEnableOption ''
      Enable kollision
    '';
    package = mkOption {
      default = if (pkgs ? kollision) then
                        pkgs.kollision
                      else
                        (if pkgs.libsForQt5 ? kollision then pkgs.libsForQt5.kollision else false);
      defaultText = literalExpression "pkgs.kollision";
      type = with types; either bool package;
      description = mdDoc "Package to use.";
    };
    "game_options" = with types; mkOption {
      type = submodule {
        options = { 
          IncreaseBallSize = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Whether automatically increasing ball size should be applied.

              Type: Bool
            '';
          };
        };
      };
      default = {};
      description = "game_options";
    };    
    "sounds" = with types; mkOption {
      type = submodule {
        options = { 
          EnableSounds = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Whether sound effects should be played.

              Type: Bool
            '';
          };
        };
      };
      default = {};
      description = "sounds";
    };    
  };
  config = mkIf (cfg.enable && moduleCfg.enable) {
    home.packages = mkIf moduleCfg.package [ moduleCfg.package ];
    programs.plasma.files."kollisionrc" = removeAttrs moduleCfg [ "enable" "package" ];
  };
}
