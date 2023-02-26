{ config, lib, ... }:
with lib;
let
  cfg = config.programs.plasma;
  moduleCfg = config.programs.plasma.klines;
in {
  options.programs.plasma.klines = {
    enable = mkEnableOption ''
      Enable klines
    '';
    package = mkOption {
      default = if (pkgs ? klines) then
                        pkgs.klines
                      else
                        (if pkgs.libsForQt5 ? klines then pkgs.libsForQt5.klines else false);
      defaultText = literalExpression "pkgs.klines";
      type = with types; either bool package;
      description = mdDoc "Package to use.";
    };
    "Game" = with types; mkOption {
      type = submodule {
        options = { 
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
          ShowNext = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Whether to show the next set of balls.

              Type: Bool
            '';
          };
        };
      };
      default = {};
      description = "Game";
    };    
  };
  config = mkIf (cfg.enable && moduleCfg.enable) {
    home.packages = mkIf moduleCfg.package [ moduleCfg.package ];
    programs.plasma.files."klinesrc" = removeAttrs moduleCfg [ "enable" "package" ];
  };
}
