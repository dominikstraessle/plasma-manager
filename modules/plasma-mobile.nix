{ config, lib, pkgs, ... }:
with lib;
let
  cfg = config.programs.plasma;
  moduleCfg = config.programs.plasma.plasma-mobile;
in {
  options.programs.plasma.plasma-mobile = {
    enable = mkEnableOption ''
      Enable plasma-mobile
    '';
    package = mkOption {
      default = if (pkgs ? plasma-mobile) then
                        pkgs.plasma-mobile
                      else
                        (if pkgs.libsForQt5 ? plasma-mobile then pkgs.libsForQt5.plasma-mobile else false);
      defaultText = literalExpression "pkgs.plasma-mobile";
      type = with types; either bool package;
      description = mdDoc "Package to use.";
    };
    "General" = with types; mkOption {
      type = submodule {
        options = { 
          AppOrder = mkOption {
            type = nullOr (either str (listOf str));
            default = "org.kde.phone.dialer.desktop";
            description = ''
              order of apps

              Type: StringList
            '';
          };
        };
      };
      default = {};
      description = "General";
    };    
  };
  config = mkIf (cfg.enable && moduleCfg.enable) {
    home.packages = mkIf (moduleCfg.package != false) [ moduleCfg.package ];
    programs.plasma.files."plasma-mobilerc" = removeAttrs moduleCfg [ "enable" "package" ];
  };
}
