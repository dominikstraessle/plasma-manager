{ config, lib, ... }:
with lib;
let
  cfg = config.programs.plasma;
  moduleCfg = config.programs.plasma.ksmserver;
in {
  options.programs.plasma.ksmserver = {
    enable = mkEnableOption ''
      Enable ksmserver
    '';
    package = mkOption {
      default = if (pkgs ? ksmserver) then
                        pkgs.ksmserver
                      else
                        (if pkgs.libsForQt5 ? ksmserver then pkgs.libsForQt5.ksmserver else false);
      defaultText = literalExpression "pkgs.ksmserver";
      type = either bool types.package;
      description = mdDoc "Package to use.";
    };
    "General" = with types; mkOption {
      type = submodule {
        options = { 
          confirmLogout = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Confirm logout

              Type: Bool
            '';
          };
          excludeApps = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              Applications to be excluded from session

              Type: String
            '';
          };
          loginMode = mkOption {
            type = nullOr (either str (enum [ 
              "restorePreviousLogout"
              "restoreSavedSession"
              "emptySession"
            ]));
            default = "restorePreviousLogout";
            description = ''
              On login

              Type: Enum
              Choices: 
                - restorePreviousLogout
                - restoreSavedSession
                - emptySession
            '';
          };
          shutdownType = mkOption {
            type = nullOr (either str int);
            default = 0;
            description = ''
              Default leave option

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
    programs.plasma.files."ksmserverrc" = removeAttrs moduleCfg [ "enable" "package" ];
  };
}
