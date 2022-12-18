{ config, lib, ... }:
with lib;
let cfg = config.programs.plasma;
in {
  options.programs.plasma.infoviewsettings = {
    "InfoView" = with types;
      mkOption {
        type = submodule {
          options = {
            ColumnsWidth = mkOption {
              type = nullOr (either str (listOf int));
              default = "";
              description = ''


                Type: IntList
              '';
            };
            Style = mkOption {
              type = nullOr (either str str);
              default = "";
              description = ''


                Type: String
              '';
            };
            FixedFont = mkOption {
              type = nullOr (either str str);
              default = "";
              description = ''


                Type: String
              '';
            };
            Font = mkOption {
              type = nullOr (either str str);
              default = "";
              description = ''


                Type: String
              '';
            };
          };
        };
        default = { };
        description = "InfoView";
      };
  };
  config = mkIf cfg.enable {
    programs.plasma.files."infoviewsettingsrc" = cfg.infoviewsettings;
  };
}
