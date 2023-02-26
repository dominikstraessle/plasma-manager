{ config, lib, ... }:
with lib;
let
  cfg = config.programs.plasma;
  moduleCfg = config.programs.plasma.akonadi_maildispatcher;
in {
  options.programs.plasma.akonadi_maildispatcher = {
    enable = mkEnableOption ''
      Enable akonadi_maildispatcher
    '';
    package = mkOption {
      default = if (pkgs ? akonadi_maildispatcher) then
                        pkgs.akonadi_maildispatcher
                      else
                        (if pkgs.libsForQt5 ? akonadi_maildispatcher then pkgs.libsForQt5.akonadi_maildispatcher else false);
      defaultText = literalExpression "pkgs.akonadi_maildispatcher";
      type = either bool types.package;
      description = mdDoc "Package to use.";
    };
    "General" = with types; mkOption {
      type = submodule {
        options = { 
          Outbox = mkOption {
            type = nullOr (either str int);
            default = -1;
            description = ''
              Outbox collection id

              Type: Int
            '';
          };
          SentMail = mkOption {
            type = nullOr (either str int);
            default = -1;
            description = ''
              Sent Mail collection id

              Type: Int
            '';
          };
        };
      };
      default = {};
      description = "General";
    };    
  };
  config = mkIf (cfg.enable && moduleCfg.enable) {
    home.packages = mkIf moduleCfg.package [ moduleCfg.package ];
    programs.plasma.files."maildispatcheragentrc" = removeAttrs moduleCfg [ "enable" "package" ];
  };
}
