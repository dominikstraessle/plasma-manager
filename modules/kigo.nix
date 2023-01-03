{ config, lib, ... }:
with lib;
let cfg = config.programs.plasma;
in {
  options.programs.plasma.kigo = { 
    "Backend" = with types; mkOption {
      type = submodule {
        options = { 
          EngineCommand = mkOption {
            type = nullOr str;
            default = ''
                QStandardPaths::findExecutable(QStringLiteral("gnugo")) + QStringLiteral(" --mode gtp")
            '';
            defaultText = "Code: true";
            description = ''
              The current game engine command with (optional) parameters

              Type: String
            '';
          };
          EngineWorking = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
        };
      };
      default = {};
      description = "Backend";
    };    
    "Game" = with types; mkOption {
      type = submodule {
        options = { 
          BlackPlayerHuman = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Is black a human player?

              Type: Bool
            '';
          };
          BlackPlayerName = mkOption {
            type = nullOr str;
            default = ''i18n("Black Player")'';
            defaultText = "Code: true";
            description = ''
              The name of the black player

              Type: String
            '';
          };
          BlackPlayerStrength = mkOption {
            type = nullOr (either str int);
            default = 10;
            description = ''
              The strength of the black player

              Type: Int
              Min: 1
              Max: 10
            '';
          };
          BoardSize = mkOption {
            type = nullOr (either str int);
            default = 9;
            description = ''
              Go board size

              Type: Int
              Min: 3
              Max: 19
            '';
          };
          FixedHandicapValue = mkOption {
            type = nullOr (either str int);
            default = 4;
            description = ''
              Extra stones for the black player

              Type: Int
              Min: 1
              Max: 9
            '';
          };
          Komi = mkOption {
            type = nullOr (either str float);
            default = 4.5;
            description = ''
              Komi

              Type: Double
              Min: 0
              Max: 50
            '';
          };
          WhitePlayerHuman = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Is white a human player?

              Type: Bool
            '';
          };
          WhitePlayerName = mkOption {
            type = nullOr str;
            default = ''i18n("White Player")'';
            defaultText = "Code: true";
            description = ''
              The name of the white player

              Type: String
            '';
          };
          WhitePlayerStrength = mkOption {
            type = nullOr (either str int);
            default = 1;
            description = ''
              The strength of the white player

              Type: Int
              Min: 1
              Max: 10
            '';
          };
        };
      };
      default = {};
      description = "Game";
    };    
    "UserInterface" = with types; mkOption {
      type = submodule {
        options = { 
          HintVisibleTime = mkOption {
            type = nullOr (either str float);
            default = 3.0;
            description = ''
              Number of seconds for which a hint is visible

              Type: Double
              Min: 1.0
              Max: 5.0
            '';
          };
          ShowBoardLabels = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Determines whether board labels are shown

              Type: Bool
            '';
          };
          ShowMoveNumbers = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Move numbers are drawn onto stones if enabled

              Type: Bool
            '';
          };
          Theme = mkOption {
            type = nullOr str;
            default = "default";
            description = ''
              The graphical theme to be used

              Type: String
            '';
          };
        };
      };
      default = {};
      description = "UserInterface";
    };    
  };
  config = mkIf cfg.enable {
    programs.plasma.files."kigorc" = cfg.kigo;
  };
}
