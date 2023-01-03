{ config, lib, ... }:
with lib;
let cfg = config.programs.plasma;
in {
  options.programs.plasma.keditbookmarks = { 
    "Columns" = with types; mkOption {
      type = submodule {
        options = { 
          Address = mkOption {
            type = nullOr (either str int);
            default = 300;
            description = ''
              

              Type: Int
            '';
          };
          Comment = mkOption {
            type = nullOr (either str int);
            default = 300;
            description = ''
              

              Type: Int
            '';
          };
          Name = mkOption {
            type = nullOr (either str int);
            default = 300;
            description = ''
              

              Type: Int
            '';
          };
          Status = mkOption {
            type = nullOr (either str int);
            default = 300;
            description = ''
              

              Type: Int
            '';
          };
          URL = mkOption {
            type = nullOr (either str int);
            default = 300;
            description = ''
              

              Type: Int
            '';
          };
        };
      };
      default = {};
      description = "Columns";
    };    
    "General" = with types; mkOption {
      type = submodule {
        options = { 
          "Save On Close" = mkOption {
            type = nullOr (either str bool);
            default = "";
            description = ''
              

              Type: Bool
            '';
          };
        };
      };
      default = {};
      description = "General";
    };    
  };
  config = mkIf cfg.enable {
    programs.plasma.files."keditbookmarksrc" = cfg.keditbookmarks;
  };
}
