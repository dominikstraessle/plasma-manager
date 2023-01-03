{ config, lib, ... }:
with lib;
let cfg = config.programs.plasma;
in {
  options.programs.plasma.kapptemplate = { 
    "Project" = with types; mkOption {
      type = submodule {
        options = { 
          appName = mkOption {
            type = nullOr str;
            default = "KApp4";
            description = ''
              Name of the project

              Type: String
            '';
          };
          appVersion = mkOption {
            type = nullOr str;
            default = "0.1";
            description = ''
              Project version

              Type: String
            '';
          };
          url = mkOption {
            type = nullOr str;
            default = "defaultDir";
            defaultText = "Code: true";
            description = ''
              Home dir of the user

              Type: String
            '';
          };
        };
      };
      default = {};
      description = "Project";
    };    
    "User" = with types; mkOption {
      type = submodule {
        options = { 
          email = mkOption {
            type = nullOr str;
            default = "address";
            defaultText = "Code: true";
            description = ''
              Email of the user

              Type: String
            '';
          };
          name = mkOption {
            type = nullOr str;
            default = "name";
            defaultText = "Code: true";
            description = ''
              Name of the user

              Type: String
            '';
          };
        };
      };
      default = {};
      description = "User";
    };    
  };
  config = mkIf cfg.enable {
    programs.plasma.files."kapptemplaterc" = cfg.kapptemplate;
  };
}
