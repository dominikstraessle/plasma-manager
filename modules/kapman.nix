{ config, lib, pkgs, ... }:
with lib;
let
  cfg = config.programs.plasma;
  moduleCfg = config.programs.plasma.kapman;
in {
  options.programs.plasma.kapman = {
    enable = mkEnableOption ''
      Enable kapman
    '';
    package = mkOption {
      default = if (pkgs ? kapman) then
                        pkgs.kapman
                      else
                        (if pkgs.libsForQt5 ? kapman then pkgs.libsForQt5.kapman else false);
      defaultText = literalExpression "pkgs.kapman";
      type = with types; either bool package;
      description = mdDoc "Package to use.";
    };
    "General" = with types; mkOption {
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
          Theme = mkOption {
            type = nullOr str;
            default = "themes/mummies_crypt.desktop";
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
  };
  config = mkIf (cfg.enable && moduleCfg.enable) {
    home.packages = mkIf moduleCfg.package [ moduleCfg.package ];
    programs.plasma.files."kapmanrc" = removeAttrs moduleCfg [ "enable" "package" ];
  };
}
