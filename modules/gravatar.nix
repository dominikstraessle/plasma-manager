{ config, lib, pkgs, ... }:
with lib;
let
  cfg = config.programs.plasma;
  moduleCfg = config.programs.plasma.gravatar;
in {
  options.programs.plasma.gravatar = {
    enable = mkEnableOption ''
      Enable gravatar
    '';
    package = mkOption {
      default = if (pkgs ? gravatar) then
                        pkgs.gravatar
                      else
                        (if pkgs.libsForQt5 ? gravatar then pkgs.libsForQt5.gravatar else false);
      defaultText = literalExpression "pkgs.gravatar";
      type = with types; either bool package;
      description = mdDoc "Package to use.";
    };
    "Gravatar" = with types; mkOption {
      type = submodule {
        options = { 
          FallbackToGravatar = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          GravatarCacheSize = mkOption {
            type = nullOr (either str int);
            default = 20;
            description = ''
              

              Type: Int
            '';
          };
          GravatarSupportEnabled = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          GravatarUseDefaultImage = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          LibravatarSupportEnabled = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
        };
      };
      default = {};
      description = "Gravatar";
    };    
  };
  config = mkIf (cfg.enable && moduleCfg.enable) {
    home.packages = mkIf moduleCfg.package [ moduleCfg.package ];
    programs.plasma.files."gravatarrc" = removeAttrs moduleCfg [ "enable" "package" ];
  };
}
