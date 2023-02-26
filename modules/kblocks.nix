{ config, lib, pkgs, ... }:
with lib;
let
  cfg = config.programs.plasma;
  moduleCfg = config.programs.plasma.kblocks;
in {
  options.programs.plasma.kblocks = {
    enable = mkEnableOption ''
      Enable kblocks
    '';
    package = mkOption {
      default = if (pkgs ? kblocks) then
                        pkgs.kblocks
                      else
                        (if pkgs.libsForQt5 ? kblocks then pkgs.libsForQt5.kblocks else false);
      defaultText = literalExpression "pkgs.kblocks";
      type = with types; either bool package;
      description = mdDoc "Package to use.";
    };
    "General" = with types; mkOption {
      type = submodule {
        options = { 
          Theme = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              The graphical theme to be used.

              Type: String
            '';
          };
        };
      };
      default = {};
      description = "General";
    };    
    "Preferences" = with types; mkOption {
      type = submodule {
        options = { 
          Sounds = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Whether sound effects should be played.

              Type: Bool
            '';
          };
        };
      };
      default = {};
      description = "Preferences";
    };    
  };
  config = mkIf (cfg.enable && moduleCfg.enable) {
    home.packages = mkIf moduleCfg.package [ moduleCfg.package ];
    programs.plasma.files."kblocksrc" = removeAttrs moduleCfg [ "enable" "package" ];
  };
}
