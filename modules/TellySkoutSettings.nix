{ config, lib, ... }:
with lib;
let cfg = config.programs.plasma;
in {
  options.programs.plasma.tellyskout = { 
    "General" = with types; mkOption {
      type = submodule {
        options = { 
          deleteProgramAfter = mkOption {
            type = nullOr (either str int);
            default = 1;
            description = ''
              Delete program after

              Type: UInt
            '';
          };
          fetcher = mkOption {
            type = nullOr (either str (enum [ 
              "TVSpielfilm"
              "XMLTV"
            ]));
            default = "";
            description = ''
              

              Type: Enum
              Choices: 
                - TVSpielfilm
                - XMLTV
            '';
          };
        };
      };
      default = {};
      description = "General";
    };    
    "XMLTV" = with types; mkOption {
      type = submodule {
        options = { 
          xmltvFile = mkOption {
            type = nullOr (either str str);
            default = "";
            description = ''
              XMLTV file

              Type: String
            '';
          };
        };
      };
      default = {};
      description = "XMLTV";
    };    
  };
  config = mkIf cfg.enable {
    programs.plasma.files."tellyskoutrc" = cfg.tellyskout;
  };
}
