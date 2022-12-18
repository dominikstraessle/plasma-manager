{ config, lib, ... }:
with lib;
let cfg = config.programs.plasma;
in {
  options.programs.plasma.kwin = {
    "org.kde.kdecoration2" = with types;
      mkOption {
        type = submodule {
          options = {
            "library" = mkOption {
              type = nullOr (either str str);
              default = "s_defaultPlugin";
              defaultText = "Code: true";
              description = ''
                Plugin name

                Type: String
              '';
            };
            "theme" = mkOption {
              type = nullOr (either str str);
              default = "s_defaultTheme";
              defaultText = "Code: true";
              description = ''
                Theme name

                Type: String
              '';
            };
            "BorderSize" = mkOption {
              type = nullOr (either str str);
              default = "Normal";
              description = ''
                Window border size

                Type: String
              '';
            };
            "BorderSizeAuto" = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''
                Use theme's default window border size

                Type: Bool
              '';
            };
            "CloseOnDoubleClickOnMenu" = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''
                Close windows by double clicking the menu button

                Type: Bool
              '';
            };
            "ShowToolTips" = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''
                Show titlebar button tooltips

                Type: Bool
              '';
            };
            "ButtonsOnLeft" = mkOption {
              type = nullOr (either str str);
              default = "MS";
              description = ''
                Titlebar left buttons

                Type: String
              '';
            };
            "ButtonsOnRight" = mkOption {
              type = nullOr (either str str);
              default = "HIAX";
              description = ''
                Titlebar right buttons

                Type: String
              '';
            };
          };
        };
        default = { };
        description = "org.kde.kdecoration2";
      };
  };
  config = mkIf cfg.enable { programs.plasma.files."kwinrc" = cfg.kwin; };
}
