{ config, lib, ... }:
with lib;
let cfg = config.programs.plasma;
in {
  options.programs.plasma.skanpage = {
    "General" = with types;
      mkOption {
        type = submodule {
          options = {
            "defaultNameFilter" = mkOption {
              type = nullOr (either str str);
              default = "";
              description = ''


                Type: String
              '';
            };
            "defaultFolder" = mkOption {
              type = nullOr (either str str);
              default = "";
              description = ''


                Type: Url
              '';
            };
            "showAllDevices" = mkOption {
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
  config =
    mkIf cfg.enable { programs.plasma.files."skanpagerc" = cfg.skanpage; };
}
