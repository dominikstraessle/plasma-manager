{ config, lib, ... }:
with lib;
let cfg = config.programs.plasma;
in {
  options.programs.plasma.kdepim-addons = { 
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
  config = mkIf cfg.enable {
    programs.plasma.files."webengineurlinterceptoradblockrc" = cfg.kdepim-addons;
  };
}
