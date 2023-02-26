{ config, lib, ... }:
with lib;
let
  cfg = config.programs.plasma;
  moduleCfg = config.programs.plasma.krunner;
in {
  options.programs.plasma.krunner = {
    enable = mkEnableOption ''
      Enable krunner
    '';
    package = mkOption {
      default = if (pkgs ? krunner) then
                        pkgs.krunner
                      else
                        (if pkgs.libsForQt5 ? krunner then pkgs.libsForQt5.krunner else false);
      defaultText = literalExpression "pkgs.krunner";
      type = either bool types.package;
      description = mdDoc "Package to use.";
    };
    "General" = with types; mkOption {
      type = submodule {
        options = { 
          ActivateWhenTypingOnDesktop = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          ActivityAware = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          FreeFloating = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          HistoryEnabled = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          RetainPriorSearch = mkOption {
            type = nullOr (either str bool);
            default = true;
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
    programs.plasma.files."krunnerrc" = removeAttrs moduleCfg [ "enable" "package" ];
  };
}
