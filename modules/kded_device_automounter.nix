{ config, lib, ... }:
with lib;
let cfg = config.programs.plasma;
in {
  options.programs.plasma.kded_device_automounter = {
    "General" = with types;
      mkOption {
        type = submodule {
          options = {
            AutomountEnabled = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''


                Type: Bool
              '';
            };
            AutomountOnLogin = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''


                Type: Bool
              '';
            };
            AutomountOnPlugin = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''


                Type: Bool
              '';
            };
            AutomountUnknownDevices = mkOption {
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
  config = mkIf cfg.enable {
    programs.plasma.files."kded_device_automounterrc" =
      cfg.kded_device_automounter;
  };
}
