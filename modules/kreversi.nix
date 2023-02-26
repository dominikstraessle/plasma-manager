{ config, lib, pkgs, ... }:
with lib;
let
  cfg = config.programs.plasma;
  moduleCfg = config.programs.plasma.kreversi;
in {
  options.programs.plasma.kreversi = {
    enable = mkEnableOption ''
      Enable kreversi
    '';
    package = mkOption {
      default = if (pkgs ? kreversi) then
                        pkgs.kreversi
                      else
                        (if pkgs.libsForQt5 ? kreversi then pkgs.libsForQt5.kreversi else false);
      defaultText = literalExpression "pkgs.kreversi";
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
          CompetitiveGameChoice = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Whether to play competitively in contrast to casually.

              Type: Bool
            '';
          };
          UseColoredChips = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Whether to use colored chips instead of black and white ones.

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
    programs.plasma.files."kreversirc" = removeAttrs moduleCfg [ "enable" "package" ];
  };
}
