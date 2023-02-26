{ config, lib, ... }:
with lib;
let
  cfg = config.programs.plasma;
  moduleCfg = config.programs.plasma.kconfigwidgets;
in {
  options.programs.plasma.kconfigwidgets = {
    enable = mkEnableOption ''
      Enable kconfigwidgets
    '';
    package = mkOption {
      default = if (pkgs ? kconfigwidgets) then
                        pkgs.kconfigwidgets
                      else
                        (if pkgs.libsForQt5 ? kconfigwidgets then pkgs.libsForQt5.kconfigwidgets else false);
      defaultText = literalExpression "pkgs.kconfigwidgets";
      type = with types; either bool package;
      description = mdDoc "Package to use.";
    };
    "Group1" = with types; mkOption {
      type = submodule {
        options = { 
          foo = mkOption {
            type = nullOr str;
            default = "default value";
            description = ''
              

              Type: String
            '';
          };
        };
      };
      default = {};
      description = "Group1";
    };    
  };
  config = mkIf (cfg.enable && moduleCfg.enable) {
    home.packages = mkIf moduleCfg.package [ moduleCfg.package ];
    programs.plasma.files."kconfigdialog_unittestrc" = removeAttrs moduleCfg [ "enable" "package" ];
  };
}
