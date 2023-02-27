{ config, lib, pkgs, ... }:
with lib;
let
  cfg = config.programs.plasma;
  moduleCfg = config.programs.plasma.kruler;
in {
  options.programs.plasma.kruler = {
    enable = mkEnableOption ''
      Enable kruler
    '';
    package = mkOption {
      default = if (pkgs ? kruler) then
                        pkgs.kruler
                      else
                        (if pkgs.libsForQt5 ? kruler then pkgs.libsForQt5.kruler else false);
      defaultText = literalExpression "pkgs.kruler";
      type = with types; either bool package;
      description = mdDoc "Package to use.";
    };
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
            default = null;
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
            default = null;
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
  config = mkIf (cfg.enable && moduleCfg.enable) {
    home.packages = mkIf (moduleCfg.package != false) [ moduleCfg.package ];
    programs.plasma.files."krulerrc" = removeAttrs moduleCfg [ "enable" "package" ];
  };
}
