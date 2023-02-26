{ config, lib, ... }:
with lib;
let
  cfg = config.programs.plasma;
  moduleCfg = config.programs.plasma.keditbookmarks;
in {
  options.programs.plasma.keditbookmarks = {
    enable = mkEnableOption ''
      Enable keditbookmarks
    '';
    package = mkOption {
      default = if (pkgs ? keditbookmarks) then
                        pkgs.keditbookmarks
                      else
                        (if pkgs.libsForQt5 ? keditbookmarks then pkgs.libsForQt5.keditbookmarks else false);
      defaultText = literalExpression "pkgs.keditbookmarks";
      type = with types; either bool package;
      description = mdDoc "Package to use.";
    };
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
  config = mkIf (cfg.enable && moduleCfg.enable) {
    home.packages = mkIf moduleCfg.package [ moduleCfg.package ];
    programs.plasma.files."keditbookmarksrc" = removeAttrs moduleCfg [ "enable" "package" ];
  };
}
