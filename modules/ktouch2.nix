{ config, lib, pkgs, ... }:
with lib;
let
  cfg = config.programs.plasma;
  moduleCfg = config.programs.plasma.ktouch2;
in {
  options.programs.plasma.ktouch2 = {
    enable = mkEnableOption ''
      Enable ktouch2
    '';
    package = mkOption {
      default = if (pkgs ? ktouch2) then
                        pkgs.ktouch2
                      else
                        (if pkgs.libsForQt5 ? ktouch2 then pkgs.libsForQt5.ktouch2 else false);
      defaultText = literalExpression "pkgs.ktouch2";
      type = with types; either bool package;
      description = mdDoc "Package to use.";
    };
    "Colors" = with types; mkOption {
      type = submodule {
        options = { 
          "FingerColor$(Index)" = mkOption {
            type = nullOr str;
            default = "#ff0000";
            description = ''
              The keyboard tinting color to highlight keys for each finger.

              Type: Color
            '';
          };
          FingerOpacity = mkOption {
            type = nullOr (either str float);
            default = 12.5;
            description = ''
              How transparent finger colors should be shown.

              Type: Double
              Min: 0
              Max: 100
            '';
          };
        };
      };
      default = {};
      description = "Colors";
    };    
    "General" = with types; mkOption {
      type = submodule {
        options = { 
          KeyboardLayoutName = mkOption {
            type = nullOr str;
            default = "us";
            description = ''
              The keyboard layout to use on non-X11 platforms

              Type: String
            '';
          };
        };
      };
      default = {};
      description = "General";
    };    
    "Session" = with types; mkOption {
      type = submodule {
        options = { 
          LastUsedProfileId = mkOption {
            type = nullOr (either str int);
            default = -1;
            description = ''
              The ID of the last used profile.

              Type: Int
            '';
          };
        };
      };
      default = {};
      description = "Session";
    };    
    "Training" = with types; mkOption {
      type = submodule {
        options = { 
          EnforceTypingErrorCorrection = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Controls whether typing errors have to be corrected or not.

              Type: Bool
            '';
          };
          NextLineWithReturn = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Return key at the end of a line will switch to next line.

              Type: Bool
            '';
          };
          NextLineWithSpace = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Space key at the end of a line will switch to next line.

              Type: Bool
            '';
          };
          RequiredAccuracy = mkOption {
            type = nullOr (either str float);
            default = 98.0;
            description = ''
              The minimum required typing accuracy in percent to unlock the next lesson.

              Type: Double
              Min: 90
              Max: 100
            '';
          };
          RequiredStrokesPerMinute = mkOption {
            type = nullOr (either str int);
            default = 180;
            description = ''
              The minimum required amount of strokes per minute to unlock the next lesson.

              Type: Int
              Min: 0
              Max: 360
            '';
          };
          ShowKeyboard = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Controls the visibility of the keyboard during training.

              Type: Bool
            '';
          };
          ShowStatistics = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Controls the visibility of realtime statistics during training.

              Type: Bool
            '';
          };
        };
      };
      default = {};
      description = "Training";
    };    
  };
  config = mkIf (cfg.enable && moduleCfg.enable) {
    home.packages = mkIf (moduleCfg.package != false) [ moduleCfg.package ];
    programs.plasma.files."ktouch2rc" = removeAttrs moduleCfg [ "enable" "package" ];
  };
}
