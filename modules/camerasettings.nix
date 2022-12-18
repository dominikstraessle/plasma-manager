{ config, lib, ... }:
with lib;
let cfg = config.programs.plasma;
in {
  options.programs.plasma.plasmacamera = {
    "General" = with types;
      mkOption {
        type = submodule {
          options = {
            "resolution" = mkOption {
              type = nullOr "";
              default = "";
              description = ''


                Type: size
              '';
            };
            "cameraDeviceId" = mkOption {
              type = nullOr "";
              default = "";
              description = ''


                Type: string
              '';
            };
            "cameraPosition" = mkOption {
              type = nullOr "";
              default = "";
              description = ''


                Type: int
              '';
            };
            "whiteBalanceMode" = mkOption {
              type = nullOr "";
              default = "";
              description = ''


                Type: int
              '';
            };
          };
        };
        default = { };
        description = "General";
      };
  };
  config = mkIf cfg.enable {
    programs.plasma.files."plasmacamerarc" = cfg.plasmacamera;
  };
}