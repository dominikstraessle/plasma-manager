{ config, lib, ... }:
with lib;
let cfg = config.programs.plasma;
in {
  options.programs.plasma.bytetableviewsettings = { 
    "ByteTableView" = with types; mkOption {
      type = submodule {
        options = { 
          ColumnsWidth = mkOption {
            type = nullOr (either str (listOf int));
            default = "";
            description = ''
              

              Type: IntList
            '';
          };
          Style = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              

              Type: String
            '';
          };
          FixedFont = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              

              Type: String
            '';
          };
          Font = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              

              Type: String
            '';
          };
        };
      };
      default = {};
      description = "ByteTableView";
    };    
  };
  config = mkIf cfg.enable {
    programs.plasma.files."bytetableviewsettingsrc" = cfg.bytetableviewsettings;
  };
}
