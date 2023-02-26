{ config, lib, ... }:
with lib;
let
  cfg = config.programs.plasma;
  moduleCfg = config.programs.plasma.device_automounter_kcm;
in {
  options.programs.plasma.device_automounter_kcm = {
    enable = mkEnableOption ''
      Enable device_automounter_kcm
    '';
    package = mkOption {
      default = if (pkgs ? device_automounter_kcm) then
                        pkgs.device_automounter_kcm
                      else
                        (if pkgs.libsForQt5 ? device_automounter_kcm then pkgs.libsForQt5.device_automounter_kcm else false);
      defaultText = literalExpression "pkgs.device_automounter_kcm";
      type = either bool types.package;
      description = mdDoc "Package to use.";
    };
    "Layout" = with types; mkOption {
      type = submodule {
        options = { 
          AttachedExpanded = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          DetachedExpanded = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          HeaderWidths = mkOption {
            type = nullOr (either str (listOf int));
            default = "";
            description = ''
              

              Type: IntList
            '';
          };
        };
      };
      default = {};
      description = "Layout";
    };    
  };
  config = mkIf (cfg.enable && moduleCfg.enable) {
    home.packages = mkIf moduleCfg.package [ moduleCfg.package ];
    programs.plasma.files."device_automounter_kcmrc" = removeAttrs moduleCfg [ "enable" "package" ];
  };
}
