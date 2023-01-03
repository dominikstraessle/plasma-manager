{ config, lib, ... }:
with lib;
let cfg = config.programs.plasma;
in {
  options.programs.plasma.kaddressbook = { 
    "Printing" = with types; mkOption {
      type = submodule {
        options = { 
          DefaultFileName = mkOption {
            type = nullOr str;
            default = "addressbook.pdf";
            description = ''
              

              Type: String
            '';
          };
          PrintingStyle = mkOption {
            type = nullOr (either str int);
            default = 0;
            description = ''
              Printing style

              Type: Int
            '';
          };
          SortOrder = mkOption {
            type = nullOr (either str (enum [ 
              "Ascending"
              "Descending"
            ]));
            default = "Ascending";
            description = ''
              Default sort order

              Type: Enum
              Choices: 
                - Ascending
                - Descending
            '';
          };
        };
      };
      default = {};
      description = "Printing";
    };    
    "Views" = with types; mkOption {
      type = submodule {
        options = { 
          ContactModelColumns = mkOption {
            type = nullOr (either str (listOf int));
            default = "0";
            description = ''
              

              Type: IntList
            '';
          };
          ShowMenuBar = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          ViewMode = mkOption {
            type = nullOr (either str (enum [ 
              "Dummy"
              "Simple"
              "TwoColumn"
              "ThreeColumn"
            ]));
            default = "3";
            description = ''
              Viewing mode

              Type: Enum
              Choices: 
                - Dummy
                - Simple
                - TwoColumn
                - ThreeColumn
            '';
          };
        };
      };
      default = {};
      description = "Views";
    };    
  };
  config = mkIf cfg.enable {
    programs.plasma.files."kaddressbookrc" = cfg.kaddressbook;
  };
}
