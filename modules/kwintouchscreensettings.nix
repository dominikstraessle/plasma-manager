{ config, lib, ... }:
with lib;
let cfg = config.programs.plasma;
in {
  options.programs.plasma.kwin = {
    "TouchEdges" = with types;
      mkOption {
        type = submodule {
          options = {
            "Top" = mkOption {
              type = nullOr (either str str);
              default = "None";
              description = ''


                Type: String
              '';
            };
            "Right" = mkOption {
              type = nullOr (either str str);
              default = "None";
              description = ''


                Type: String
              '';
            };
            "Bottom" = mkOption {
              type = nullOr (either str str);
              default = "None";
              description = ''


                Type: String
              '';
            };
            "Left" = mkOption {
              type = nullOr (either str str);
              default = "None";
              description = ''


                Type: String
              '';
            };
          };
        };
        default = { };
        description = "TouchEdges";
      };
    "Effect-windowview" = with types;
      mkOption {
        type = submodule {
          options = {
            "TouchBorderActivateAll" = mkOption {
              type = nullOr (either str (listOf int));
              default = "ElectricNone";
              description = ''


                Type: IntList
              '';
            };
            "TouchBorderActivate" = mkOption {
              type = nullOr (either str (listOf int));
              default = "ElectricNone";
              description = ''


                Type: IntList
              '';
            };
            "TouchBorderActivateClass" = mkOption {
              type = nullOr (either str (listOf int));
              default = "ElectricNone";
              description = ''


                Type: IntList
              '';
            };
          };
        };
        default = { };
        description = "Effect-windowview";
      };
    "TabBox" = with types;
      mkOption {
        type = submodule {
          options = {
            "TouchBorderActivate" = mkOption {
              type = nullOr (either str (listOf int));
              default = "ElectricNone";
              description = ''


                Type: IntList
              '';
            };
            "TouchBorderAlternativeActivate" = mkOption {
              type = nullOr (either str (listOf int));
              default = "ElectricNone";
              description = ''


                Type: IntList
              '';
            };
          };
        };
        default = { };
        description = "TabBox";
      };
  };
  config = mkIf cfg.enable { programs.plasma.files."kwinrc" = cfg.kwin; };
}
