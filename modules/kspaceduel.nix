{ config, lib, pkgs, ... }:
with lib;
let
  cfg = config.programs.plasma;
  moduleCfg = config.programs.plasma.kspaceduel;
in {
  options.programs.plasma.kspaceduel = {
    enable = mkEnableOption ''
      Enable kspaceduel
    '';
    package = mkOption {
      default = if (pkgs ? kspaceduel) then
                        pkgs.kspaceduel
                      else
                        (if pkgs.libsForQt5 ? kspaceduel then pkgs.libsForQt5.kspaceduel else false);
      defaultText = literalExpression "pkgs.kspaceduel";
      type = with types; either bool package;
      description = mdDoc "Package to use.";
    };
    "Game" = with types; mkOption {
      type = submodule {
        options = { 
          "ai$(Player)Difficulty" = mkOption {
            type = nullOr (either str (enum [ 
              "Trainee"
              "Normal"
              "Hard"
              "Insane"
            ]));
            default = "Normal";
            description = ''
              

              Type: Enum
              Choices: 
                - Trainee
                - Normal
                - Hard
                - Insane
            '';
          };
          lastConfig = mkOption {
            type = nullOr (either str int);
            default = 0;
            description = ''
              

              Type: Int
            '';
          };
          "player$(Player)IsAi" = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          refreshTime = mkOption {
            type = nullOr (either str int);
            default = 33;
            description = ''
              

              Type: Int
              Min: 10
              Max: 100
            '';
          };
          "startHitPointsP$(Player)" = mkOption {
            type = nullOr (either str int);
            default = 99;
            description = ''
              

              Type: Int
              Min: 1
              Max: 99
            '';
          };
          timeAfterKill = mkOption {
            type = nullOr (either str float);
            default = 42.9;
            description = ''
              

              Type: Double
            '';
          };
        };
      };
      default = {};
      description = "Game";
    };    
  };
  config = mkIf (cfg.enable && moduleCfg.enable) {
    home.packages = mkIf (moduleCfg.package != false) [ moduleCfg.package ];
    programs.plasma.files."kspaceduelrc" = removeAttrs moduleCfg [ "enable" "package" ];
  };
}
