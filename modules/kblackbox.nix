{ config, lib, pkgs, ... }:
with lib;
let
  cfg = config.programs.plasma;
  moduleCfg = config.programs.plasma.kblackbox;
in {
  options.programs.plasma.kblackbox = {
    enable = mkEnableOption ''
      Enable kblackbox
    '';
    package = mkOption {
      default = if (pkgs ? kblackbox) then
                        pkgs.kblackbox
                      else
                        (if pkgs.libsForQt5 ? kblackbox then pkgs.libsForQt5.kblackbox else false);
      defaultText = literalExpression "pkgs.kblackbox";
      type = with types; either bool package;
      description = mdDoc "Package to use.";
    };
    "KBlackBox Setup" = with types; mkOption {
      type = submodule {
        options = { 
          balls = mkOption {
            type = nullOr (either str int);
            default = 4;
            description = ''
              Number of balls for custom difficulty level

              Type: Int
            '';
          };
          columns = mkOption {
            type = nullOr (either str int);
            default = 8;
            description = ''
              Number of columns of the board for custom difficulty level

              Type: Int
            '';
          };
          rows = mkOption {
            type = nullOr (either str int);
            default = 8;
            description = ''
              Number of rows of the board for custom difficuty level

              Type: Int
            '';
          };
          theme = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              File of the current theme of the graphic elements. (SVGZ file with path and file extension)

              Type: String
            '';
          };
        };
      };
      default = {};
      description = "KBlackBox Setup";
    };    
  };
  config = mkIf (cfg.enable && moduleCfg.enable) {
    home.packages = mkIf (moduleCfg.package != false) [ moduleCfg.package ];
    programs.plasma.files."kblackboxrc" = removeAttrs moduleCfg [ "enable" "package" ];
  };
}
