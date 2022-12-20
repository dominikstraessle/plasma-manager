{ config, lib, ... }:
with lib;
let cfg = config.programs.plasma;
in {
  options.programs.plasma.device_automounter_kcm = {
    "Layout" = with types;
      mkOption {
        type = submodule {
          options = {
            "AttachedExpanded" = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''


                Type: Bool
              '';
            };
            "DetachedExpanded" = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''


                Type: Bool
              '';
            };
            "HeaderWidths" = mkOption {
              type = nullOr (either str (listOf int));
              default = "";
              description = ''


                Type: IntList
              '';
            };
          };
        };
        default = { };
        description = "Layout";
      };
  };
  config = mkIf cfg.enable {
    programs.plasma.files."device_automounter_kcmrc" =
      cfg.device_automounter_kcm;
  };
}
