{ config, lib, ... }:
with lib;
let cfg = config.programs.plasma;
in {
  options.programs.plasma.ksmserver = { 
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
          shutdownType = mkOption {
            type = nullOr (either str int);
            default = 0;
            description = ''
              Default leave option

              Type: Int
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
          excludeApps = mkOption {
            type = nullOr (either str str);
            default = "";
            description = ''
              Applications to be excluded from session

              Type: String
            '';
          };
        };
      };
      default = {};
      description = "General";
    };    
  };
  config = mkIf cfg.enable {
    programs.plasma.files."ksmserverrc" = cfg.ksmserver;
  };
}
