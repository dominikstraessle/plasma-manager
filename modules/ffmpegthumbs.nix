{ config, lib, pkgs, ... }:
with lib;
let
  cfg = config.programs.plasma;
  moduleCfg = config.programs.plasma.ffmpegthumbs;
in {
  options.programs.plasma.ffmpegthumbs = {
    enable = mkEnableOption ''
      Enable ffmpegthumbs
    '';
    package = mkOption {
      default = if (pkgs ? ffmpegthumbs) then
                        pkgs.ffmpegthumbs
                      else
                        (if pkgs.libsForQt5 ? ffmpegthumbs then pkgs.libsForQt5.ffmpegthumbs else false);
      defaultText = literalExpression "pkgs.ffmpegthumbs";
      type = with types; either bool package;
      description = mdDoc "Package to use.";
    };
    "General" = with types; mkOption {
      type = submodule {
        options = { 
          cacheSize = mkOption {
            type = nullOr (either str int);
            default = 51200;
            description = ''
              Cache size (KiB)

              Type: UInt
            '';
          };
          filmstrip = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Embed filmstrip effect

              Type: Bool
            '';
          };
          sequenceSeekPercentages = mkOption {
            type = nullOr (either str (listOf int));
            default = "20,35,50,65,80";
            description = ''
              Sequence seek percentages

              Type: IntList
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
    programs.plasma.files."ffmpegthumbsrc" = removeAttrs moduleCfg [ "enable" "package" ];
  };
}
