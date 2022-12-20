{ config, lib, ... }:
with lib;
let cfg = config.programs.plasma;
in {
  options.programs.plasma.kio_ftp = {
    "DesktopIcons" = with types;
      mkOption {
        type = submodule {
          options = {
            "DisablePassiveMode" = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''
                Disable Passive FTP

                Type: Bool
              '';
            };
            "MarkPartial" = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''
                Mark partially uploaded files

                Type: Bool
              '';
            };
          };
        };
        default = { };
        description = "DesktopIcons";
      };
  };
  config = mkIf cfg.enable { programs.plasma.files."kio_ftprc" = cfg.kio_ftp; };
}
