{ config, lib, ... }:
with lib;
let
  cfg = config.programs.plasma;
  moduleCfg = config.programs.plasma.kpat;
in {
  options.programs.plasma.kpat = {
    enable = mkEnableOption ''
      Enable kpat
    '';
    package = mkOption {
      default = if (pkgs ? kpat) then
                        pkgs.kpat
                      else
                        (if pkgs.libsForQt5 ? kpat then pkgs.libsForQt5.kpat else false);
      defaultText = literalExpression "pkgs.kpat";
      type = with types; either bool package;
      description = mdDoc "Package to use.";
    };
    "General Settings" = with types; mkOption {
      type = submodule {
        options = { 
          Autodrop = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          BakersDozenEmptyStackFill = mkOption {
            type = nullOr (either str int);
            default = 2;
            description = ''
              

              Type: Int
            '';
          };
          BakersDozenSequenceBuiltBy = mkOption {
            type = nullOr (either str int);
            default = 2;
            description = ''
              

              Type: Int
            '';
          };
          BakersDozenSolverIterationsLimit = mkOption {
            type = nullOr (either str int);
            default = 200000;
            description = ''
              

              Type: Int
            '';
          };
          BakersDozenStackFacedown = mkOption {
            type = nullOr (either str int);
            default = 0;
            description = ''
              

              Type: Int
            '';
          };
          Cardname = mkOption {
            type = nullOr str;
            default = "svg-oxygen-air";
            description = ''
              

              Type: String
            '';
          };
          CastleEmptyStackFill = mkOption {
            type = nullOr (either str int);
            default = 0;
            description = ''
              

              Type: Int
            '';
          };
          CastleFoundation = mkOption {
            type = nullOr (either str int);
            default = 1;
            description = ''
              

              Type: Int
            '';
          };
          CastleLayout = mkOption {
            type = nullOr (either str int);
            default = 0;
            description = ''
              

              Type: Int
            '';
          };
          CastleReserves = mkOption {
            type = nullOr (either str int);
            default = 0;
            description = ''
              

              Type: Int
            '';
          };
          CastleSequenceBuiltBy = mkOption {
            type = nullOr (either str int);
            default = 2;
            description = ''
              

              Type: Int
            '';
          };
          CastleSolverIterationsLimit = mkOption {
            type = nullOr (either str int);
            default = 200000;
            description = ''
              

              Type: Int
            '';
          };
          CastleStackFaceup = mkOption {
            type = nullOr (either str int);
            default = 1;
            description = ''
              

              Type: Int
            '';
          };
          CastleStacks = mkOption {
            type = nullOr (either str int);
            default = 8;
            description = ''
              

              Type: Int
            '';
          };
          FreecellDecks = mkOption {
            type = nullOr (either str int);
            default = 0;
            description = ''
              

              Type: Int
            '';
          };
          FreecellEmptyStackFill = mkOption {
            type = nullOr (either str int);
            default = 0;
            description = ''
              

              Type: Int
            '';
          };
          FreecellReserves = mkOption {
            type = nullOr (either str int);
            default = 4;
            description = ''
              

              Type: Int
            '';
          };
          FreecellSequenceBuiltBy = mkOption {
            type = nullOr (either str int);
            default = 0;
            description = ''
              

              Type: Int
            '';
          };
          FreecellSolverIterationsLimit = mkOption {
            type = nullOr (either str int);
            default = 200000;
            description = ''
              

              Type: Int
            '';
          };
          FreecellStacks = mkOption {
            type = nullOr (either str int);
            default = 2;
            description = ''
              

              Type: Int
            '';
          };
          GolfSolverIterationsLimit = mkOption {
            type = nullOr (either str int);
            default = 1000000;
            description = ''
              

              Type: Int
            '';
          };
          KlondikeEasy = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          PlaySounds = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          RememberStateOnExit = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          SimpleSimonSolverIterationsLimit = mkOption {
            type = nullOr (either str int);
            default = 200000;
            description = ''
              

              Type: Int
            '';
          };
          Solver = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          SpiderStackFaceup = mkOption {
            type = nullOr (either str int);
            default = 0;
            description = ''
              

              Type: Int
            '';
          };
          SpiderSuits = mkOption {
            type = nullOr (either str int);
            default = 2;
            description = ''
              

              Type: Int
            '';
          };
        };
      };
      default = {};
      description = "General Settings";
    };    
  };
  config = mkIf (cfg.enable && moduleCfg.enable) {
    home.packages = mkIf moduleCfg.package [ moduleCfg.package ];
    programs.plasma.files."kpatrc" = removeAttrs moduleCfg [ "enable" "package" ];
  };
}
