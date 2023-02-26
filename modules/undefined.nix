{ config, lib, pkgs, ... }:
with lib;
let
  cfg = config.programs.plasma;
  moduleCfg = config.programs.plasma.undefined;
in {
  options.programs.plasma.undefined = {
    enable = mkEnableOption ''
      Enable undefined
    '';
    package = mkOption {
      default = if (pkgs ? undefined) then
                        pkgs.undefined
                      else
                        (if pkgs.libsForQt5 ? undefined then pkgs.libsForQt5.undefined else false);
      defaultText = literalExpression "pkgs.undefined";
      type = with types; either bool package;
      description = mdDoc "Package to use.";
    };
    "General" = with types; mkOption {
      type = submodule {
        options = { 
          AlwaysMergeConfigFile = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          AlwaysOverrideDirectory = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          AlwaysOverrideFile = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          activeJobs = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          allJobs = mkOption {
            type = nullOr (either str bool);
            default = "";
            description = ''
              

              Type: Bool
            '';
          };
          completedJobs = mkOption {
            type = nullOr (either str bool);
            default = "";
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
    programs.plasma.files."undefinedrc" = removeAttrs moduleCfg [ "enable" "package" ];
  };
}
