{ config, lib, ... }:
with lib;
let cfg = config.programs.plasma;
in {
  options.programs.plasma.akonadi_maildispatcher = { 
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
  config = mkIf cfg.enable {
    programs.plasma.files."maildispatcheragentrc" = cfg.akonadi_maildispatcher;
  };
}
