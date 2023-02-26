{ config, lib, pkgs, ... }:
with lib;
let
  cfg = config.programs.plasma;
  moduleCfg = config.programs.plasma.kbreakout;
in {
  options.programs.plasma.kbreakout = {
    enable = mkEnableOption ''
      Enable kbreakout
    '';
    package = mkOption {
      default = if (pkgs ? kbreakout) then
                        pkgs.kbreakout
                      else
                        (if pkgs.libsForQt5 ? kbreakout then pkgs.libsForQt5.kbreakout else false);
      defaultText = literalExpression "pkgs.kbreakout";
      type = with types; either bool package;
      description = mdDoc "Package to use.";
    };
    "General" = with types; mkOption {
      type = submodule {
        options = { 
          FireOnClick = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Fire on mouse click

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
    programs.plasma.files."kbreakoutrc" = removeAttrs moduleCfg [ "enable" "package" ];
  };
}
