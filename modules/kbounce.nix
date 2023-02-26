{ config, lib, ... }:
with lib;
let
  cfg = config.programs.plasma;
  moduleCfg = config.programs.plasma.kbounce;
in {
  options.programs.plasma.kbounce = {
    enable = mkEnableOption ''
      Enable kbounce
    '';
    package = mkOption {
      default = if (pkgs ? kbounce) then
                        pkgs.kbounce
                      else
                        (if pkgs.libsForQt5 ? kbounce then pkgs.libsForQt5.kbounce else false);
      defaultText = literalExpression "pkgs.kbounce";
      type = with types; either bool package;
      description = mdDoc "Package to use.";
    };
    "General" = with types; mkOption {
      type = submodule {
        options = { 
          BackgroundPicturePath = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              

              Type: String
            '';
          };
          UseRandomBackgroundPictures = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
        };
      };
      default = {};
      description = "General";
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
    programs.plasma.files."kbouncerc" = removeAttrs moduleCfg [ "enable" "package" ];
  };
}
