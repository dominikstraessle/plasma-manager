{ config, lib, ... }:
with lib;
let cfg = config.programs.plasma;
in {
  options.programs.plasma.kblackbox = {
    "KBlackBox Setup" = with types;
      mkOption {
        type = submodule {
          options = {
            "balls" = mkOption {
              type = nullOr (either str int);
              default = 4;
              description = ''
                Number of balls for custom difficulty level

                Type: Int
              '';
            };
            "columns" = mkOption {
              type = nullOr (either str int);
              default = 8;
              description = ''
                Number of columns of the board for custom difficulty level

                Type: Int
              '';
            };
            "rows" = mkOption {
              type = nullOr (either str int);
              default = 8;
              description = ''
                Number of rows of the board for custom difficuty level

                Type: Int
              '';
            };
            "theme" = mkOption {
              type = nullOr str;
              default = "";
              description = ''
                File of the current theme of the graphic elements. (SVGZ file with path and file extension)

                Type: String
              '';
            };
          };
        };
        default = { };
        description = "KBlackBox Setup";
      };
  };
  config =
    mkIf cfg.enable { programs.plasma.files."kblackboxrc" = cfg.kblackbox; };
}
