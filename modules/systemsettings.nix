{ config, lib, pkgs, ... }:
with lib;
let
  cfg = config.programs.plasma;
  moduleCfg = config.programs.plasma.systemsettings;
in {
  options.programs.plasma.systemsettings = {
    enable = mkEnableOption ''
      Enable systemsettings
    '';
    package = mkOption {
      default = if (pkgs ? systemsettings) then
                        pkgs.systemsettings
                      else
                        (if pkgs.libsForQt5 ? systemsettings then pkgs.libsForQt5.systemsettings else false);
      defaultText = literalExpression "pkgs.systemsettings";
      type = with types; either bool package;
      description = mdDoc "Package to use.";
    };
    "Main" = with types; mkOption {
      type = submodule {
        options = { 
          ActiveView = mkOption {
            type = nullOr str;
            default = "systemsettings_sidebar_mode";
            description = ''
              Internal name for the view used

              Type: String
            '';
          };
        };
      };
      default = {};
      description = "Main";
    };    
  };
  config = mkIf (cfg.enable && moduleCfg.enable) {
    home.packages = mkIf (moduleCfg.package != false) [ moduleCfg.package ];
    programs.plasma.files."systemsettingsrc" = removeAttrs moduleCfg [ "enable" "package" ];
  };
}
