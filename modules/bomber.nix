{ config, lib, ... }:
with lib;
let
  cfg = config.programs.plasma;
  moduleCfg = config.programs.plasma.bomber;
in {
  options.programs.plasma.bomber = {
    enable = mkEnableOption ''
      Enable bomber
    '';
    package = mkOption {
      default = if (pkgs ? bomber) then
                        pkgs.bomber
                      else
                        (if pkgs.libsForQt5 ? bomber then pkgs.libsForQt5.bomber else false);
      defaultText = literalExpression "pkgs.bomber";
      type = with types; either bool package;
      description = mdDoc "Package to use.";
    };
    "Sound" = with types; mkOption {
      type = submodule {
        options = { 
          PlaySounds = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Whether game sounds are played.

              Type: Bool
            '';
          };
        };
      };
      default = {};
      description = "Sound";
    };    
  };
  config = mkIf (cfg.enable && moduleCfg.enable) {
    home.packages = mkIf moduleCfg.package [ moduleCfg.package ];
    programs.plasma.files."bomberrc" = removeAttrs moduleCfg [ "enable" "package" ];
  };
}
