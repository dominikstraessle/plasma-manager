{ config, lib, ... }:
with lib;
let
  cfg = config.programs.plasma;
  moduleCfg = config.programs.plasma.kio;
in {
  options.programs.plasma.kio = {
    enable = mkEnableOption ''
      Enable kio
    '';
    package = mkOption {
      default = if (pkgs ? kio) then
                        pkgs.kio
                      else
                        (if pkgs.libsForQt5 ? kio then pkgs.libsForQt5.kio else false);
      defaultText = literalExpression "pkgs.kio";
      type = with types; either bool package;
      description = mdDoc "Package to use.";
    };
    "General" = with types; mkOption {
      type = submodule {
        options = { 
          rotate = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Rotate JPEG automatically

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
    programs.plasma.files."jpegcreatorrc" = removeAttrs moduleCfg [ "enable" "package" ];
  };
}
