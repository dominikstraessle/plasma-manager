{ config, lib, ... }:
with lib;
let cfg = config.programs.plasma;
in {
  options.programs.plasma.kdeglobals = {
    "General" = with types;
      mkOption {
        type = submodule {
          options = {
            "AllowKDEAppsToRememberWindowPositions" = mkOption {
              type = nullOr (either str bool);
              default = true;
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
    mkIf cfg.enable { programs.plasma.files."kdeglobals" = cfg.kdeglobals; };
}
