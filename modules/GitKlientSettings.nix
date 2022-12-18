{ config, lib, ... }:
with lib;
let cfg = config.programs.plasma;
in {
  options.programs.plasma.GitKlientSettings = {
    "Preferences" = with types;
      mkOption {
        type = submodule {
          options = {
            diffAddedColor = mkOption {
              type = nullOr (either str str);
              default = "green";
              description = ''
                Added color

                Type: Color
              '';
            };
            diffRemovedColor = mkOption {
              type = nullOr (either str str);
              default = "red";
              description = ''
                Removed color

                Type: Color
              '';
            };
            diffModifiedColor = mkOption {
              type = nullOr (either str str);
              default = "blue";
              description = ''
                Modified color

                Type: Color
              '';
            };
            colorForeground = mkOption {
              type = nullOr (either str str);
              default = "yellow";
              description = ''
                color of the foreground

                Type: Color
              '';
            };
            gitBinPath = mkOption {
              type = nullOr (either str str);
              default = "";
              description = ''
                age of the project

                Type: String
              '';
            };
            calendarType = mkOption {
              type = nullOr (either str str);
              default = "";
              description = ''


                Type: String
              '';
            };
            calendarTypeIndex = mkOption {
              type = nullOr "";
              default = "";
              description = ''


                Type: int
              '';
            };
            openLastRepo = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''
                Open last repo at startup

                Type: Bool
              '';
            };
            registerDiffTool = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''


                Type: Bool
              '';
            };
            registerMergeTool = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''


                Type: Bool
              '';
            };
          };
        };
        default = { };
        description = "Preferences";
      };
  };
  config = mkIf cfg.enable {
    programs.plasma.files."GitKlientSettings" = cfg.GitKlientSettings;
  };
}
