{ config, lib, ... }:
with lib;
let cfg = config.programs.plasma;
in {
  options.programs.plasma.marble = {
    "General" = with types;
      mkOption {
        type = submodule {
          options = {
            "centerMode" = mkOption {
              type = nullOr
                (either str (enum [ "Daylight" "Longitude" "Position" ]));
              default = "Daylight";
              description = ''


                Type: Enum
                Choices: 
                  - Daylight
                  - Longitude
                  - Position
              '';
            };
            "fixedLongitude" = mkOption {
              type = nullOr (either str float);
              default = 0.0;
              description = ''


                Type: double
              '';
            };
            "projection" = mkOption {
              type =
                nullOr (either str (enum [ "Equirectangular" "Mercator" ]));
              default = "Equirectangular";
              description = ''


                Type: Enum
                Choices: 
                  - Equirectangular
                  - Mercator
              '';
            };
            "showDate" = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''


                Type: Bool
              '';
            };
          };
        };
        default = { };
        description = "General";
      };
  };
  config = mkIf cfg.enable { programs.plasma.files."marblerc" = cfg.marble; };
}
