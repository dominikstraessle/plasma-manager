{ config, lib, ... }:
with lib;
let
  cfg = config.programs.plasma;
  moduleCfg = config.programs.plasma.kded_device_automounter;
in {
  options.programs.plasma.kded_device_automounter = {
    enable = mkEnableOption ''
      Enable kded_device_automounter
    '';
    package = mkOption {
      default = if (pkgs ? kded_device_automounter) then
                        pkgs.kded_device_automounter
                      else
                        (if pkgs.libsForQt5 ? kded_device_automounter then pkgs.libsForQt5.kded_device_automounter else false);
      defaultText = literalExpression "pkgs.kded_device_automounter";
      type = either bool types.package;
      description = mdDoc "Package to use.";
    };
    "General" = with types; mkOption {
      type = submodule {
        options = { 
          AutomountEnabled = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          AutomountOnLogin = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          AutomountOnPlugin = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          AutomountUnknownDevices = mkOption {
            type = nullOr (either str bool);
            default = false;
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
    programs.plasma.files."kded_device_automounterrc" = removeAttrs moduleCfg [ "enable" "package" ];
  };
}
