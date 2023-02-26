{ config, lib, pkgs, ... }:
with lib;
let
  cfg = config.programs.plasma;
  moduleCfg = config.programs.plasma.kio_ftp;
in {
  options.programs.plasma.kio_ftp = {
    enable = mkEnableOption ''
      Enable kio_ftp
    '';
    package = mkOption {
      default = if (pkgs ? kio_ftp) then
                        pkgs.kio_ftp
                      else
                        (if pkgs.libsForQt5 ? kio_ftp then pkgs.libsForQt5.kio_ftp else false);
      defaultText = literalExpression "pkgs.kio_ftp";
      type = with types; either bool package;
      description = mdDoc "Package to use.";
    };
    "DesktopIcons" = with types; mkOption {
      type = submodule {
        options = { 
          DisablePassiveMode = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Disable Passive FTP

              Type: Bool
            '';
          };
          MarkPartial = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Mark partially uploaded files

              Type: Bool
            '';
          };
        };
      };
      default = {};
      description = "DesktopIcons";
    };    
  };
  config = mkIf (cfg.enable && moduleCfg.enable) {
    home.packages = mkIf moduleCfg.package [ moduleCfg.package ];
    programs.plasma.files."kio_ftprc" = removeAttrs moduleCfg [ "enable" "package" ];
  };
}
