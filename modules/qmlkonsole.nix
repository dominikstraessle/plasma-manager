{ config, lib, ... }:
with lib;
let cfg = config.programs.plasma;
in {
  options.programs.plasma.qmlkonsole = {
    "General" = with types;
      mkOption {
        type = submodule {
          options = {
            "actions" = mkOption {
              type = nullOr (either str (listOf str));
              default = "";
              description = ''


                Type: StringList
              '';
            };
            "blurWindow" = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''


                Type: bool
              '';
            };
            "colorScheme" = mkOption {
              type = nullOr str;
              default = ''"cool-retro-term"'';
              description = ''


                Type: string
              '';
            };
            "fontFamily" = mkOption {
              type = nullOr str;
              default = ''"Monospace"'';
              description = ''


                Type: string
              '';
            };
            "fontSize" = mkOption {
              type = nullOr (either str int);
              default = 12;
              description = ''


                Type: int
              '';
            };
            "windowOpacity" = mkOption {
              type = nullOr (either str float);
              default = 1.0;
              description = ''


                Type: double
              '';
            };
          };
        };
        default = { };
        description = "General";
      };
  };
  config =
    mkIf cfg.enable { programs.plasma.files."qmlkonsolerc" = cfg.qmlkonsole; };
}
