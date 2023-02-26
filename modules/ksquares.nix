{ config, lib, pkgs, ... }:
with lib;
let
  cfg = config.programs.plasma;
  moduleCfg = config.programs.plasma.ksquares;
in {
  options.programs.plasma.ksquares = {
    enable = mkEnableOption ''
      Enable ksquares
    '';
    package = mkOption {
      default = if (pkgs ? ksquares) then
                        pkgs.ksquares
                      else
                        (if pkgs.libsForQt5 ? ksquares then pkgs.libsForQt5.ksquares else false);
      defaultText = literalExpression "pkgs.ksquares";
      type = with types; either bool package;
      description = mdDoc "Package to use.";
    };
    "AI" = with types; mkOption {
      type = submodule {
        options = { 
          Difficulty = mkOption {
            type = nullOr (either str int);
            default = 0;
            description = ''
              Difficulty

              Type: Int
            '';
          };
        };
      };
      default = {};
      description = "AI";
    };    
    "Display" = with types; mkOption {
      type = submodule {
        options = { 
          HighlightColor = mkOption {
            type = nullOr str;
            default = "220,100,100";
            description = ''
              Highlight Color

              Type: Color
            '';
          };
          IndicatorLineColor = mkOption {
            type = nullOr str;
            default = "255,255,0";
            description = ''
              Indicator Line Color

              Type: Color
            '';
          };
          LineColor = mkOption {
            type = nullOr str;
            default = "0,0,0";
            description = ''
              Line Color

              Type: Color
            '';
          };
        };
      };
      default = {};
      description = "Display";
    };    
    "Game Settings" = with types; mkOption {
      type = submodule {
        options = { 
          BoardHeight = mkOption {
            type = nullOr (either str int);
            default = 7;
            description = ''
              Height of board

              Type: Int
            '';
          };
          BoardWidth = mkOption {
            type = nullOr (either str int);
            default = 10;
            description = ''
              Width of board

              Type: Int
            '';
          };
          HumanList = mkOption {
            type = nullOr (either str (listOf int));
            default = "2,2,2,2";
            description = ''
              Human or AI

              Type: IntList
            '';
          };
          NumOfPlayers = mkOption {
            type = nullOr (either str int);
            default = 2;
            description = ''
              Number of Players

              Type: Int
            '';
          };
          PlayerNames = mkOption {
            type = nullOr (either str (listOf str));
            default = "";
            description = ''
              Player Names

              Type: StringList
            '';
          };
          QuickStart = mkOption {
            type = nullOr (either str int);
            default = 0;
            description = ''
              Quick start the game

              Type: Int
            '';
          };
        };
      };
      default = {};
      description = "Game Settings";
    };    
  };
  config = mkIf (cfg.enable && moduleCfg.enable) {
    home.packages = mkIf (moduleCfg.package != false) [ moduleCfg.package ];
    programs.plasma.files."ksquaresrc" = removeAttrs moduleCfg [ "enable" "package" ];
  };
}
