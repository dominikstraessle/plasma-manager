{ config, lib, ... }:
with lib;
let
  cfg = config.programs.plasma;
  moduleCfg = config.programs.plasma.ktrip;
in {
  options.programs.plasma.ktrip = {
    enable = mkEnableOption ''
      Enable ktrip
    '';
    package = mkOption {
      default = if (pkgs ? ktrip) then
                        pkgs.ktrip
                      else
                        (if pkgs.libsForQt5 ? ktrip then pkgs.libsForQt5.ktrip else false);
      defaultText = literalExpression "pkgs.ktrip";
      type = with types; either bool package;
      description = mdDoc "Package to use.";
    };
    "Backends" = with types; mkOption {
      type = submodule {
        options = { 
          EnabledBackends = mkOption {
            type = nullOr (either str (listOf str));
            default = "";
            description = ''
              Enabled backends

              Type: StringList
            '';
          };
        };
      };
      default = {};
      description = "Backends";
    };    
    "General" = with types; mkOption {
      type = submodule {
        options = { 
          firstRun = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              First run

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
    programs.plasma.files."ktriprc" = removeAttrs moduleCfg [ "enable" "package" ];
  };
}
