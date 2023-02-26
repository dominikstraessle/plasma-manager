{ config, lib, pkgs, ... }:
with lib;
let
  cfg = config.programs.plasma;
  moduleCfg = config.programs.plasma.kdiamond;
in {
  options.programs.plasma.kdiamond = {
    enable = mkEnableOption ''
      Enable kdiamond
    '';
    package = mkOption {
      default = if (pkgs ? kdiamond) then
                        pkgs.kdiamond
                      else
                        (if pkgs.libsForQt5 ? kdiamond then pkgs.libsForQt5.kdiamond else false);
      defaultText = literalExpression "pkgs.kdiamond";
      type = with types; either bool package;
      description = mdDoc "Package to use.";
    };
    "Preferences" = with types; mkOption {
      type = submodule {
        options = { 
          Untimed = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Play an untimed game.

              Type: Bool
            '';
          };
        };
      };
      default = {};
      description = "Preferences";
    };    
  };
  config = mkIf (cfg.enable && moduleCfg.enable) {
    home.packages = mkIf (moduleCfg.package != false) [ moduleCfg.package ];
    programs.plasma.files."kdiamondrc" = removeAttrs moduleCfg [ "enable" "package" ];
  };
}
