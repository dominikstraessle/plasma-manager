{ config, lib, ... }:
with lib;
let cfg = config.programs.plasma;
in {
  options.programs.plasma.kwin = {
    "NightColor" = with types;
      mkOption {
        type = submodule {
          options = {
            Active = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''


                Type: Bool
              '';
            };
            Mode = mkOption {
              type = nullOr (either str
                (enum [ "Automatic" "Location" "Times" "Constant" ]));
              default = "Automatic";
              description = ''


                Type: Enum
                Choices: 
                  - Automatic
                  - Location
                  - Times
                  - Constant
              '';
            };
            DayTemperature = mkOption {
              type = nullOr (either str int);
              default = 6500;
              description = ''


                Type: Int
              '';
            };
            NightTemperature = mkOption {
              type = nullOr (either str int);
              default = 4500;
              description = ''


                Type: Int
              '';
            };
            LatitudeAuto = mkOption {
              type = nullOr (either str float);
              default = 0.0;
              description = ''


                Type: Double
              '';
            };
            LongitudeAuto = mkOption {
              type = nullOr (either str float);
              default = 0.0;
              description = ''


                Type: Double
              '';
            };
            LatitudeFixed = mkOption {
              type = nullOr (either str float);
              default = 0.0;
              description = ''


                Type: Double
              '';
            };
            LongitudeFixed = mkOption {
              type = nullOr (either str float);
              default = 0.0;
              description = ''


                Type: Double
              '';
            };
            MorningBeginFixed = mkOption {
              type = nullOr (either str str);
              default = "0600";
              description = ''


                Type: String
              '';
            };
            EveningBeginFixed = mkOption {
              type = nullOr (either str str);
              default = "1800";
              description = ''


                Type: String
              '';
            };
            TransitionTime = mkOption {
              type = nullOr (either str int);
              default = 30;
              description = ''


                Type: Int
              '';
            };
          };
        };
        default = { };
        description = "NightColor";
      };
  };
  config = mkIf cfg.enable { programs.plasma.files."kwinrc" = cfg.kwin; };
}
