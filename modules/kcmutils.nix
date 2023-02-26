{ config, lib, pkgs, ... }:
with lib;
let
  cfg = config.programs.plasma;
  moduleCfg = config.programs.plasma.kcmutils;
in {
  options.programs.plasma.kcmutils = {
    enable = mkEnableOption ''
      Enable kcmutils
    '';
    package = mkOption {
      default = if (pkgs ? kcmutils) then
                        pkgs.kcmutils
                      else
                        (if pkgs.libsForQt5 ? kcmutils then pkgs.libsForQt5.kcmutils else false);
      defaultText = literalExpression "pkgs.kcmutils";
      type = with types; either bool package;
      description = mdDoc "Package to use.";
    };
    "Mouse" = with types; mkOption {
      type = submodule {
        options = { 
          cursorSize = mkOption {
            type = nullOr (either str int);
            default = 24;
            description = ''
              Current cursor size

              Type: Int
            '';
          };
          cursorTheme = mkOption {
            type = nullOr str;
            default = "breeze_cursors";
            description = ''
              Name of the current cursor theme

              Type: String
            '';
          };
        };
      };
      default = {};
      description = "Mouse";
    };    
  };
  config = mkIf (cfg.enable && moduleCfg.enable) {
    home.packages = mkIf moduleCfg.package [ moduleCfg.package ];
    programs.plasma.files."sometestfilerc" = removeAttrs moduleCfg [ "enable" "package" ];
  };
}
