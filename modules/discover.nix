{ config, lib, ... }:
with lib;
let cfg = config.programs.plasma;
in {
  options.programs.plasma.discover = {
    "Software" = with types;
      mkOption {
        type = submodule {
          options = {
            UseOfflineUpdates = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''


                Type: Bool
              '';
            };
          };
        };
        default = { };
        description = "Software";
      };
  };
  config =
    mkIf cfg.enable { programs.plasma.files."discoverrc" = cfg.discover; };
}
