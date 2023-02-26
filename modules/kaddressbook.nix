{ config, lib, ... }:
with lib;
let
  cfg = config.programs.plasma;
  moduleCfg = config.programs.plasma.kaddressbook;
in {
  options.programs.plasma.kaddressbook = {
    enable = mkEnableOption ''
      Enable kaddressbook
    '';
    package = mkOption {
      default = if (pkgs ? kaddressbook) then
                        pkgs.kaddressbook
                      else
                        (if pkgs.libsForQt5 ? kaddressbook then pkgs.libsForQt5.kaddressbook else false);
      defaultText = literalExpression "pkgs.kaddressbook";
      type = with types; either bool package;
      description = mdDoc "Package to use.";
    };
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
  config = mkIf (cfg.enable && moduleCfg.enable) {
    home.packages = mkIf moduleCfg.package [ moduleCfg.package ];
    programs.plasma.files."kaddressbookrc" = removeAttrs moduleCfg [ "enable" "package" ];
  };
}
