{ config, lib, ... }:
with lib;
let cfg = config.programs.plasma;
in {
  options.programs.plasma.breeze = {
    "Common" = with types;
      mkOption {
        type = submodule {
          options = {
            ShadowStrength = mkOption {
              type = nullOr (either str int);
              default = 255;
              description = ''


                Type: Int
                Min: 25
                Max: 255
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
            ShadowColor = mkOption {
              type = nullOr (either str str);
              default = "0, 0, 0";
              description = ''


                Type: Color
              '';
            };
            OutlineCloseButton = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''


                Type: Bool
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
            DrawBorderOnMaximizedWindows = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''


                Type: Bool
              '';
            };
            DrawBackgroundGradient = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''


                Type: Bool
              '';
            };
            HideTitleBar = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''


                Type: Bool
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
            ExceptionPattern = mkOption {
              type = nullOr (either str str);
              default = "";
              description = ''


                Type: String
              '';
            };
            Enabled = mkOption {
              type = nullOr (either str bool);
              default = true;
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
          };
        };
        default = { };
        description = "Windeco";
      };
  };
  config = mkIf cfg.enable { programs.plasma.files."breezerc" = cfg.breeze; };
}
