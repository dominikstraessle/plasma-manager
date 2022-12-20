{ config, lib, ... }:
with lib;
let cfg = config.programs.plasma;
in {
  options.programs.plasma.kcalc = {
    "Colors" = with types;
      mkOption {
        type = submodule {
          options = {
            "BackColor" = mkOption {
              type = nullOr str;
              default = "defaultColor";
              defaultText = "Code: true";
              description = ''
                The background color of the display.

                Type: Color
              '';
            };
            "ConstantsButtonsColor" = mkOption {
              type = nullOr str;
              default = "defaultButtonColor";
              defaultText = "Code: true";
              description = ''
                The color of constants buttons.

                Type: Color
              '';
            };
            "ConstantsFontsColor" = mkOption {
              type = nullOr str;
              default = "defaultFontColor";
              defaultText = "Code: true";
              description = ''
                The color of constants fonts.

                Type: Color
              '';
            };
            "ForeColor" = mkOption {
              type = nullOr str;
              default = "defaultColor";
              defaultText = "Code: true";
              description = ''
                The foreground color of the display.

                Type: Color
              '';
            };
            "FunctionButtonsColor" = mkOption {
              type = nullOr str;
              default = "defaultButtonColor";
              defaultText = "Code: true";
              description = ''
                The color of function buttons.

                Type: Color
              '';
            };
            "FunctionFontsColor" = mkOption {
              type = nullOr str;
              default = "defaultFontColor";
              defaultText = "Code: true";
              description = ''
                The color of function fonts.

                Type: Color
              '';
            };
            "HexButtonsColor" = mkOption {
              type = nullOr str;
              default = "defaultButtonColor";
              defaultText = "Code: true";
              description = ''
                The color of hex buttons.

                Type: Color
              '';
            };
            "HexFontsColor" = mkOption {
              type = nullOr str;
              default = "defaultFontColor";
              defaultText = "Code: true";
              description = ''
                The color of hex fonts.

                Type: Color
              '';
            };
            "MemoryButtonsColor" = mkOption {
              type = nullOr str;
              default = "defaultButtonColor";
              defaultText = "Code: true";
              description = ''
                The color of memory buttons.

                Type: Color
              '';
            };
            "MemoryFontsColor" = mkOption {
              type = nullOr str;
              default = "defaultFontColor";
              defaultText = "Code: true";
              description = ''
                The color of memory fonts.

                Type: Color
              '';
            };
            "NumberButtonsColor" = mkOption {
              type = nullOr str;
              default = "defaultButtonColor";
              defaultText = "Code: true";
              description = ''
                The color of number buttons.

                Type: Color
              '';
            };
            "NumberFontsColor" = mkOption {
              type = nullOr str;
              default = "defaultFontColor";
              defaultText = "Code: true";
              description = ''
                The color of number fonts.

                Type: Color
              '';
            };
            "OperationButtonsColor" = mkOption {
              type = nullOr str;
              default = "defaultButtonColor";
              defaultText = "Code: true";
              description = ''
                The color of operation buttons.

                Type: Color
              '';
            };
            "OperationFontsColor" = mkOption {
              type = nullOr str;
              default = "defaultFontColor";
              defaultText = "Code: true";
              description = ''
                The color of operation font.

                Type: Color
              '';
            };
            "StatButtonsColor" = mkOption {
              type = nullOr str;
              default = "defaultButtonColor";
              defaultText = "Code: true";
              description = ''
                The color of statistical buttons.

                Type: Color
              '';
            };
            "StatFontsColor" = mkOption {
              type = nullOr str;
              default = "defaultFontColor";
              defaultText = "Code: true";
              description = ''
                The color of statistical fonts.

                Type: Color
              '';
            };
          };
        };
        default = { };
        description = "Colors";
      };
    "Font" = with types;
      mkOption {
        type = submodule {
          options = {
            "ButtonFont" = mkOption {
              type = nullOr str;
              default = "QFontDatabase::systemFont(QFontDatabase::GeneralFont)";
              defaultText = "Code: true";
              description = ''
                The font to use for the buttons.

                Type: Font
              '';
            };
            "DisplayFont" = mkOption {
              type = nullOr str;
              default = "defaultDisplayFont";
              defaultText = "Code: true";
              description = ''
                The font to use in the display.

                Type: Font
              '';
            };
            "HistoryFont" = mkOption {
              type = nullOr str;
              default = "QFontDatabase::systemFont(QFontDatabase::GeneralFont)";
              defaultText = "Code: true";
              description = ''
                The font to use in the history.

                Type: Font
              '';
            };
          };
        };
        default = { };
        description = "Font";
      };
    "General" = with types;
      mkOption {
        type = submodule {
          options = {
            "AngleMode" = mkOption {
              type = nullOr (either str int);
              default = 0;
              description = ''
                Degrees, radians or grads

                Type: UInt
              '';
            };
            "BaseMode" = mkOption {
              type = nullOr (either str int);
              default = 10;
              description = ''
                Numeric base

                Type: UInt
              '';
            };
            "CalculatorMode" = mkOption {
              type = nullOr (either str
                (enum [ "simple" "science" "statistics" "numeral" ]));
              default = "";
              description = ''


                Type: Enum
                Choices: 
                  - simple: Easy Calculator Mode
                  - science: Science Calculator Mode
                  - statistics: Statistic Calculator Mode
                  - numeral: Numeral System Mode
              '';
            };
            "ShowBitset" = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''
                Whether to show the bit edit widget.

                Type: Bool
              '';
            };
            "ShowConstants" = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''
                Whether to show constant buttons.

                Type: Bool
              '';
            };
            "ShowHistory" = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''
                Whether to show the history window.

                Type: Bool
              '';
            };
            "beep" = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''
                Whether to beep on error.

                Type: Bool
              '';
            };
            "captionresult" = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''
                Whether to show the result in the window title.

                Type: Bool
              '';
            };
            "groupdigits" = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''
                Whether to group digits.

                Type: Bool
              '';
            };
            "repeatlastoperation" = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''
                Enables that the last operation is repeated when "=" is pressed

                Type: Bool
              '';
            };
            "twoscomplement" = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''
                Whether to use Two's Complement for non-decimal numbers.

                Type: Bool
              '';
            };
          };
        };
        default = { };
        description = "General";
      };
    "Grouping" = with types;
      mkOption {
        type = submodule {
          options = {
            "binaryGrouping" = mkOption {
              type = nullOr (either str int);
              default = 4;
              description = ''
                Binary figures will be separated by a whitespace after every Xth digit.

                Type: UInt
              '';
            };
            "hexadecimalGrouping" = mkOption {
              type = nullOr (either str int);
              default = 2;
              description = ''
                Hexadecimal figures will be separated by a whitespace after every Xth digit.

                Type: UInt
              '';
            };
            "octalGrouping" = mkOption {
              type = nullOr (either str int);
              default = 4;
              description = ''
                Octal figures will be separated by a whitespace after every Xth digit.

                Type: UInt
              '';
            };
          };
        };
        default = { };
        description = "Grouping";
      };
    "Precision" = with types;
      mkOption {
        type = submodule {
          options = {
            "fixed" = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''
                Whether to use fixed decimal places.

                Type: Bool
              '';
            };
            "fixedprecision" = mkOption {
              type = nullOr (either str int);
              default = 2;
              description = ''
                Number of fixed decimal digits.

                Type: UInt
              '';
            };
            "precision" = mkOption {
              type = nullOr (either str int);
              default = 12;
              description = ''
                Maximum number of digits displayed.

                Type: UInt
                Min: 8
                Max: 200
              '';
            };
          };
        };
        default = { };
        description = "Precision";
      };
    "UserConstants" = with types;
      mkOption {
        type = submodule {
          options = {
            "nameConstant$(ConstIndex)" = mkOption {
              type = nullOr str;
              default = "nameConstant5";
              defaultText = "Code: true";
              description = ''
                Name of the user programmable constants.

                Type: String
              '';
            };
            "valueConstant$(ConstIndex)" = mkOption {
              type = nullOr str;
              default = "0";
              description = ''
                List of user programmable constants

                Type: String
              '';
            };
          };
        };
        default = { };
        description = "UserConstants";
      };
  };
  config = mkIf cfg.enable { programs.plasma.files."kcalcrc" = cfg.kcalc; };
}
