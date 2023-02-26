{ config, lib, pkgs, ... }:
with lib;
let
  cfg = config.programs.plasma;
  moduleCfg = config.programs.plasma.kmplot;
in {
  options.programs.plasma.kmplot = {
    enable = mkEnableOption ''
      Enable kmplot
    '';
    package = mkOption {
      default = if (pkgs ? kmplot) then
                        pkgs.kmplot
                      else
                        (if pkgs.libsForQt5 ? kmplot then pkgs.libsForQt5.kmplot else false);
      defaultText = literalExpression "pkgs.kmplot";
      type = with types; either bool package;
      description = mdDoc "Package to use.";
    };
    "Colors" = with types; mkOption {
      type = submodule {
        options = { 
          AxesColor = mkOption {
            type = nullOr str;
            default = "#282828";
            description = ''
              Axis-line color

              Type: Color
            '';
          };
          "Color0" = mkOption {
            type = nullOr str;
            default = "#191970";
            description = ''
              Color of function 1

              Type: Color
            '';
          };
          "Color1" = mkOption {
            type = nullOr str;
            default = "#006400";
            description = ''
              Color of function 2

              Type: Color
            '';
          };
          "Color2" = mkOption {
            type = nullOr str;
            default = "#FF4500";
            description = ''
              Color of function 3

              Type: Color
            '';
          };
          "Color3" = mkOption {
            type = nullOr str;
            default = "#808000";
            description = ''
              Color of function 4

              Type: Color
            '';
          };
          "Color4" = mkOption {
            type = nullOr str;
            default = "#FF1493";
            description = ''
              Color of function 5

              Type: Color
            '';
          };
          "Color5" = mkOption {
            type = nullOr str;
            default = "#B111DD";
            description = ''
              Color of function 6

              Type: Color
            '';
          };
          "Color6" = mkOption {
            type = nullOr str;
            default = "#800000";
            description = ''
              Color of function 7

              Type: Color
            '';
          };
          "Color7" = mkOption {
            type = nullOr str;
            default = "#0000CD";
            description = ''
              Color of function 8

              Type: Color
            '';
          };
          "Color8" = mkOption {
            type = nullOr str;
            default = "#FF8C00";
            description = ''
              Color of function 9

              Type: Color
            '';
          };
          "Color9" = mkOption {
            type = nullOr str;
            default = "#3CB400";
            description = ''
              Color of function 10

              Type: Color
            '';
          };
          GridColor = mkOption {
            type = nullOr str;
            default = "#AEAEAE";
            description = ''
              Grid Color

              Type: Color
            '';
          };
        };
      };
      default = {};
      description = "Colors";
    };    
    "Coordinate System" = with types; mkOption {
      type = submodule {
        options = { 
          AxesLineWidth = mkOption {
            type = nullOr (either str float);
            default = 0.2;
            description = ''
              Axis-line width

              Type: Double
            '';
          };
          GridLineWidth = mkOption {
            type = nullOr (either str float);
            default = 0.1;
            description = ''
              Grid Line Width

              Type: Double
            '';
          };
          GridStyle = mkOption {
            type = nullOr (either str int);
            default = 1;
            description = ''
              Grid Style

              Type: Int
            '';
          };
          LabelHorizontalAxis = mkOption {
            type = nullOr str;
            default = "X";
            description = ''
              Label to Horizontal Axis

              Type: String
            '';
          };
          LabelVerticalAxis = mkOption {
            type = nullOr str;
            default = "Y";
            description = ''
              Label to Vertical Axis

              Type: String
            '';
          };
          ShowArrows = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Checked if arrows are visible

              Type: Bool
            '';
          };
          ShowAxes = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Checked if axes are visible

              Type: Bool
            '';
          };
          ShowLabel = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Checked if labels are visible

              Type: Bool
            '';
          };
          TicLength = mkOption {
            type = nullOr (either str float);
            default = 0.5;
            description = ''
              Tic length

              Type: Double
            '';
          };
          TicWidth = mkOption {
            type = nullOr (either str float);
            default = 0.3;
            description = ''
              Tic width

              Type: Double
            '';
          };
          XMax = mkOption {
            type = nullOr str;
            default = "8";
            description = ''
              Right boundary

              Type: String
            '';
          };
          XMin = mkOption {
            type = nullOr str;
            default = "-8";
            description = ''
              Left boundary

              Type: String
            '';
          };
          YMax = mkOption {
            type = nullOr str;
            default = "8";
            description = ''
              Upper boundary

              Type: String
            '';
          };
          YMin = mkOption {
            type = nullOr str;
            default = "-8";
            description = ''
              Lower boundary

              Type: String
            '';
          };
        };
      };
      default = {};
      description = "Coordinate System";
    };    
    "Fonts" = with types; mkOption {
      type = submodule {
        options = { 
          AxesFont = mkOption {
            type = nullOr str;
            default = "QFontDatabase::systemFont(QFontDatabase::GeneralFont)";
            defaultText = "Code: true";
            description = ''
              Font of the axis labels

              Type: Font
            '';
          };
          HeaderTableFont = mkOption {
            type = nullOr str;
            default = "QFontDatabase::systemFont(QFontDatabase::GeneralFont)";
            defaultText = "Code: true";
            description = ''
              Font of the printed header table

              Type: Font
            '';
          };
          LabelFont = mkOption {
            type = nullOr str;
            default = "QFontDatabase::systemFont(QFontDatabase::GeneralFont)";
            defaultText = "Code: true";
            description = ''
              Font of diagram labels

              Type: Font
            '';
          };
        };
      };
      default = {};
      description = "Fonts";
    };    
    "General" = with types; mkOption {
      type = submodule {
        options = { 
          DefaultEquationForm = mkOption {
            type = nullOr (either str (enum [ 
              "Function"
              "Implicit"
            ]));
            default = "Function";
            description = ''
              

              Type: Enum
              Choices: 
                - Function
                - Implicit
            '';
          };
          DetailedTracing = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Extra detail when tracing

              Type: Bool
            '';
          };
          anglemode = mkOption {
            type = nullOr (either str int);
            default = 0;
            description = ''
              Radians instead of degrees

              Type: Int
            '';
          };
          backgroundcolor = mkOption {
            type = nullOr str;
            default = "#FFFFFF";
            description = ''
              Background color

              Type: Color
            '';
          };
          zoomInStep = mkOption {
            type = nullOr (either str int);
            default = 20;
            description = ''
              Zoom-in step

              Type: Int
            '';
          };
          zoomOutStep = mkOption {
            type = nullOr (either str int);
            default = 25;
            description = ''
              Zoom-out step

              Type: Int
            '';
          };
        };
      };
      default = {};
      description = "General";
    };    
    "Scaling" = with types; mkOption {
      type = submodule {
        options = { 
          XScaling = mkOption {
            type = nullOr str;
            default = "1";
            description = ''
              Width of a unit from tic to tic

              Type: String
            '';
          };
          XScalingMode = mkOption {
            type = nullOr (either str int);
            default = 0;
            description = ''
              Whether to use automatic or custom scaling.

              Type: Int
            '';
          };
          YScaling = mkOption {
            type = nullOr str;
            default = "1";
            description = ''
              Height of a unit from tic to tic

              Type: String
            '';
          };
          YScalingMode = mkOption {
            type = nullOr (either str int);
            default = 0;
            description = ''
              Whether to use automatic or custom scaling.

              Type: Int
            '';
          };
        };
      };
      default = {};
      description = "Scaling";
    };    
  };
  config = mkIf (cfg.enable && moduleCfg.enable) {
    home.packages = mkIf moduleCfg.package [ moduleCfg.package ];
    programs.plasma.files."kmplotrc" = removeAttrs moduleCfg [ "enable" "package" ];
  };
}
