{ config, lib, ... }:
with lib;
let cfg = config.programs.plasma;
in {
  options.programs.plasma.kruler = { 
    "StoredSettings" = with types; mkOption {
      type = submodule {
        options = { 
          AlwaysOnTop = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Is always on top

              Type: Bool
            '';
          };
          BgColor = mkOption {
            type = nullOr str;
            default = "QColor(255, 200, 80)";
            defaultText = "Code: true";
            description = ''
              Background color of the ruler.

              Type: Color
            '';
          };
          Horizontal = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Horizontal ruler

              Type: Bool
            '';
          };
          LeftToRight = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Direction of the ruler

              Type: Bool
            '';
          };
          Length = mkOption {
            type = nullOr (either str int);
            default = 600;
            description = ''
              Length of the ruler.

              Type: Int
            '';
          };
          Offset = mkOption {
            type = nullOr (either str int);
            default = 0;
            description = ''
              Offset of the origin

              Type: Int
            '';
          };
          Opacity = mkOption {
            type = nullOr (either str int);
            default = 255;
            description = ''
              Opacity of the window

              Type: Int
            '';
          };
          RelativeScale = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Is the scale of the ruler relative (percentage)

              Type: Bool
            '';
          };
          ScaleFont = mkOption {
            type = nullOr str;
            default = "QFontDatabase::systemFont(QFontDatabase::SmallestReadableFont)";
            defaultText = "Code: true";
            description = ''
              Font of the text on the ruler scale.

              Type: Font
            '';
          };
          TrayIcon = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Is a tray icon used

              Type: Bool
            '';
          };
        };
      };
      default = {};
      description = "StoredSettings";
    };    
  };
  config = mkIf cfg.enable {
    programs.plasma.files."krulerrc" = cfg.kruler;
  };
}
