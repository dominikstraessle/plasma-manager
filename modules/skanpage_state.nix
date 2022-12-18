{ config, lib, ... }:
with lib;
let cfg = config.programs.plasma;
in {
  options.programs.plasma.skanpage = {
    "General" = with types;
      mkOption {
        type = submodule {
          options = {
            "deviceName" = mkOption {
              type = nullOr (either str str);
              default = "";
              description = ''


                Type: String
              '';
            };
            "deviceModel" = mkOption {
              type = nullOr (either str str);
              default = "";
              description = ''


                Type: String
              '';
            };
            "deviceVendor" = mkOption {
              type = nullOr (either str str);
              default = "";
              description = ''


                Type: String
              '';
            };
          };
        };
        default = { };
        description = "General";
      };
    "UiSettings" = with types;
      mkOption {
        type = submodule {
          options = {
            "x" = mkOption {
              type = nullOr (either str int);
              default = "\n        0\n    ";
              description = ''


                Type: UInt
              '';
            };
            "y" = mkOption {
              type = nullOr (either str int);
              default = "\n        0\n    ";
              description = ''


                Type: UInt
              '';
            };
            "width" = mkOption {
              type = nullOr (either str int);
              default = "\n        950\n    ";
              description = ''


                Type: UInt
              '';
            };
            "height" = mkOption {
              type = nullOr (either str int);
              default = "\n        550\n    ";
              description = ''


                Type: UInt
              '';
            };
            "shareWidth" = mkOption {
              type = nullOr (either str int);
              default = "\n        600\n    ";
              description = ''


                Type: UInt
              '';
            };
            "shareHeight" = mkOption {
              type = nullOr (either str int);
              default = "\n        400\n    ";
              description = ''


                Type: UInt
              '';
            };
            "exportWidth" = mkOption {
              type = nullOr (either str int);
              default = "\n        600\n    ";
              description = ''


                Type: UInt
              '';
            };
            "exportHeight" = mkOption {
              type = nullOr (either str int);
              default = "\n      400\n    ";
              description = ''


                Type: UInt
              '';
            };
            "settingsWidth" = mkOption {
              type = nullOr (either str int);
              default = "\n        500\n    ";
              description = ''


                Type: UInt
              '';
            };
            "settingsHeight" = mkOption {
              type = nullOr (either str int);
              default = "\n        300\n    ";
              description = ''


                Type: UInt
              '';
            };
            "showOptions" = mkOption {
              type = nullOr (either str bool);
              default = "\n      true\n    ";
              description = ''


                Type: Bool
              '';
            };
            "showAllOptions" = mkOption {
              type = nullOr (either str bool);
              default = "\n      false\n    ";
              description = ''


                Type: Bool
              '';
            };
            "splitViewItemWidth" = mkOption {
              type = nullOr (either str int);
              default = "\n        300\n    ";
              description = ''


                Type: UInt
              '';
            };
          };
        };
        default = { };
        description = "UiSettings";
      };
  };
  config =
    mkIf cfg.enable { programs.plasma.files."skanpagerc" = cfg.skanpage; };
}
