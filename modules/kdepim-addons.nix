{ config, lib, pkgs, ... }:
with lib;
let
  cfg = config.programs.plasma;
  moduleCfg = config.programs.plasma.kdepim-addons;
in {
  options.programs.plasma.kdepim-addons = {
    enable = mkEnableOption ''
      Enable kdepim-addons
    '';
    package = mkOption {
      default = if (pkgs ? kdepim-addons) then
                        pkgs.kdepim-addons
                      else
                        (if pkgs.libsForQt5 ? kdepim-addons then pkgs.libsForQt5.kdepim-addons else false);
      defaultText = literalExpression "pkgs.kdepim-addons";
      type = with types; either bool package;
      description = mdDoc "Package to use.";
    };
    "General" = with types; mkOption {
      type = submodule {
        options = { 
          AdBlockEnabled = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Enabled ad block

              Type: Bool
            '';
          };
          AdBlockUpdateInterval = mkOption {
            type = nullOr (either str int);
            default = 7;
            description = ''
              Update interval list of adblock

              Type: Int
            '';
          };
          HideAdsEnabled = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Hide advertisement enabled

              Type: Bool
            '';
          };
        };
      };
      default = {};
      description = "General";
    };    
    "Global" = with types; mkOption {
      type = submodule {
        options = { 
          donottrack = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
        };
      };
      default = {};
      description = "Global";
    };    
  };
  config = mkIf (cfg.enable && moduleCfg.enable) {
    home.packages = mkIf moduleCfg.package [ moduleCfg.package ];
    programs.plasma.files."webengineurlinterceptoradblockrc" = removeAttrs moduleCfg [ "enable" "package" ];
  };
}
