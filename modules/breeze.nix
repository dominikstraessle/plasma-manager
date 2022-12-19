{ config, lib, ... }:
with lib;
let cfg = config.programs.plasma;
in {
  options.programs.plasma.breeze = {
    "Common" = with types;
      mkOption {
        type = submodule {
          options = {
            OutlineCloseButton = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''


                Type: Bool
              '';
            };
            ShadowColor = mkOption {
              type = nullOr str;
              default = "0, 0, 0";
              description = ''


                Type: Color
              '';
            };
            ShadowSize = mkOption {
              type = nullOr (either str (enum [
                "ShadowNone"
                "ShadowSmall"
                "ShadowMedium"
                "ShadowLarge"
                "ShadowVeryLarge"
              ]));
              default = "ShadowLarge";
              description = ''


                Type: Enum
                Choices: 
                  - ShadowNone
                  - ShadowSmall
                  - ShadowMedium
                  - ShadowLarge
                  - ShadowVeryLarge
              '';
            };
            ShadowStrength = mkOption {
              type = nullOr (either str int);
              default = 255;
              description = ''


                Type: Int
                Min: 25
                Max: 255
              '';
            };
          };
        };
        default = { };
        description = "Common";
      };
    "Windeco" = with types;
      mkOption {
        type = submodule {
          options = {
            BorderSize = mkOption {
              type = nullOr (either str (enum [
                "BorderNone"
                "BorderNoSides"
                "BorderTiny"
                "BorderNormal"
                "BorderLarge"
                "BorderVeryLarge"
                "BorderHuge"
                "BorderVeryHuge"
                "BorderOversized"
              ]));
              default = "BorderNone";
              description = ''


                Type: Enum
                Choices: 
                  - BorderNone
                  - BorderNoSides
                  - BorderTiny
                  - BorderNormal
                  - BorderLarge
                  - BorderVeryLarge
                  - BorderHuge
                  - BorderVeryHuge
                  - BorderOversized
              '';
            };
            ButtonSize = mkOption {
              type = nullOr (either str (enum [
                "ButtonTiny"
                "ButtonSmall"
                "ButtonDefault"
                "ButtonLarge"
                "ButtonVeryLarge"
              ]));
              default = "ButtonDefault";
              description = ''


                Type: Enum
                Choices: 
                  - ButtonTiny
                  - ButtonSmall
                  - ButtonDefault
                  - ButtonLarge
                  - ButtonVeryLarge
              '';
            };
            DrawBackgroundGradient = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''


                Type: Bool
              '';
            };
            DrawBorderOnMaximizedWindows = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''


                Type: Bool
              '';
            };
            Enabled = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''


                Type: Bool
              '';
            };
            ExceptionPattern = mkOption {
              type = nullOr str;
              default = "";
              description = ''


                Type: String
              '';
            };
            ExceptionType = mkOption {
              type = nullOr (either str
                (enum [ "ExceptionWindowClassName" "ExceptionWindowTitle" ]));
              default = "ExceptionWindowClassName";
              description = ''


                Type: Enum
                Choices: 
                  - ExceptionWindowClassName
                  - ExceptionWindowTitle
              '';
            };
            HideTitleBar = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''


                Type: Bool
              '';
            };
            Mask = mkOption {
              type = nullOr (either str int);
              default = 0;
              description = ''


                Type: Int
              '';
            };
            TitleAlignment = mkOption {
              type = nullOr (either str (enum [
                "AlignLeft"
                "AlignCenter"
                "AlignCenterFullWidth"
                "AlignRight"
              ]));
              default = "AlignCenterFullWidth";
              description = ''


                Type: Enum
                Choices: 
                  - AlignLeft
                  - AlignCenter
                  - AlignCenterFullWidth
                  - AlignRight
              '';
            };
          };
        };
        default = { };
        description = "Windeco";
      };
  };
  config = mkIf cfg.enable { programs.plasma.files."breezerc" = cfg.breeze; };
}
