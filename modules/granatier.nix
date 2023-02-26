{ config, lib, ... }:
with lib;
let
  cfg = config.programs.plasma;
  moduleCfg = config.programs.plasma.granatier;
in {
  options.programs.plasma.granatier = {
    enable = mkEnableOption ''
      Enable granatier
    '';
    package = mkOption {
      default = if (pkgs ? granatier) then
                        pkgs.granatier
                      else
                        (if pkgs.libsForQt5 ? granatier then pkgs.libsForQt5.granatier else false);
      defaultText = literalExpression "pkgs.granatier";
      type = either bool types.package;
      description = mdDoc "Package to use.";
    };
    "General" = with types; mkOption {
      type = submodule {
        options = { 
          Arena = mkOption {
            type = nullOr str;
            default = "arenas/granatier.desktop";
            description = ''
              The arena to be used.

              Type: String
            '';
          };
          "BlastTime1" = mkOption {
            type = nullOr (either str int);
            default = 30;
            description = ''
              This is only for the artists to make their life easier.

              Type: Int
            '';
          };
          "BlastTime2" = mkOption {
            type = nullOr (either str int);
            default = 70;
            description = ''
              This is only for the artists to make their life easier.

              Type: Int
            '';
          };
          "BlastTime3" = mkOption {
            type = nullOr (either str int);
            default = 200;
            description = ''
              This is only for the artists to make their life easier.

              Type: Int
            '';
          };
          "BlastTime4" = mkOption {
            type = nullOr (either str int);
            default = 100;
            description = ''
              This is only for the artists to make their life easier.

              Type: Int
            '';
          };
          "BlastTime5" = mkOption {
            type = nullOr (either str int);
            default = 100;
            description = ''
              This is only for the artists to make their life easier.

              Type: Int
            '';
          };
          Dummy = mkOption {
            type = nullOr (either str int);
            default = 0;
            description = ''
              This is a dummy setting for player setup.

              Type: Int
            '';
          };
          FirstRun = mkOption {
            type = nullOr (either str int);
            default = 1;
            description = ''
              Check if it is the first run of the game.

              Type: Int
            '';
          };
          InitialBombArmory = mkOption {
            type = nullOr (either str int);
            default = 1;
            description = ''
              The initial bomb armory.

              Type: Int
            '';
          };
          InitialBombPower = mkOption {
            type = nullOr (either str int);
            default = 1;
            description = ''
              The initial bomb power.

              Type: Int
            '';
          };
          InitialSpeed = mkOption {
            type = nullOr (either str int);
            default = 2;
            description = ''
              The initial speed.

              Type: Int
            '';
          };
          PointsToWin = mkOption {
            type = nullOr (either str int);
            default = 5;
            description = ''
              The points a user needs to win the game.

              Type: Int
            '';
          };
          RandomArenaMode = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Use random arenas.

              Type: Bool
            '';
          };
          RandomArenaModeArenaList = mkOption {
            type = nullOr (either str (listOf str));
            default = "";
            description = ''
              List of arenas, used in random mode.

              Type: StringList
            '';
          };
          RoundTime = mkOption {
            type = nullOr (either str int);
            default = 180;
            description = ''
              Time for a round.

              Type: Int
            '';
          };
          ShowAllTiles = mkOption {
            type = nullOr (either str int);
            default = 0;
            description = ''
              This is only for the artists to make their life easier.

              Type: Int
            '';
          };
          Sounds = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Whether sound effects should be played.

              Type: Bool
            '';
          };
          Theme = mkOption {
            type = nullOr str;
            default = "themes/granatier.desktop";
            description = ''
              The graphical theme to be used.

              Type: String
            '';
          };
          UseWilhelmScream = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Whether to use the Wilhelm Scream for dying players.

              Type: Bool
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
    programs.plasma.files."granatierrc" = removeAttrs moduleCfg [ "enable" "package" ];
  };
}
