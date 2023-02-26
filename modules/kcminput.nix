{ config, lib, pkgs, ... }:
with lib;
let
  cfg = config.programs.plasma;
  moduleCfg = config.programs.plasma.kcminput;
in {
  options.programs.plasma.kcminput = {
    enable = mkEnableOption ''
      Enable kcminput
    '';
    package = mkOption {
      default = if (pkgs ? kcminput) then
                        pkgs.kcminput
                      else
                        (if pkgs.libsForQt5 ? kcminput then pkgs.libsForQt5.kcminput else false);
      defaultText = literalExpression "pkgs.kcminput";
      type = with types; either bool package;
      description = mdDoc "Package to use.";
    };
    "Keyboard" = with types; mkOption {
      type = submodule {
        options = { 
          KeyRepeat = mkOption {
            type = nullOr str;
            default = ''qgetenv("QT_IM_MODULE") == "plasmaim" ? QStringLiteral("accent") : QStringLiteral("repeat")'';
            defaultText = "Code: true";
            description = ''
              

              Type: String
            '';
          };
          NumLock = mkOption {
            type = nullOr (either str int);
            default = 2;
            description = ''
              

              Type: Int
            '';
          };
          RepeatDelay = mkOption {
            type = nullOr (either str int);
            default = 600;
            description = ''
              

              Type: Int
              Min: 100
              Max: 5000
            '';
          };
          RepeatRate = mkOption {
            type = nullOr (either str float);
            default = 25.0;
            description = ''
              

              Type: Double
              Min: 0.2
              Max: 100
            '';
          };
        };
      };
      default = {};
      description = "Keyboard";
    };    
    "Mouse" = with types; mkOption {
      type = submodule {
        options = { 
          cursorSize = mkOption {
            type = nullOr (either str int);
            default = 24;
            description = ''
              Current cursor size

              Type: Int
            '';
          };
          cursorTheme = mkOption {
            type = nullOr str;
            default = "breeze_cursors";
            description = ''
              Name of the current cursor theme

              Type: String
            '';
          };
        };
      };
      default = {};
      description = "Mouse";
    };    
  };
  config = mkIf (cfg.enable && moduleCfg.enable) {
    home.packages = mkIf (moduleCfg.package != false) [ moduleCfg.package ];
    programs.plasma.files."kcminputrc" = removeAttrs moduleCfg [ "enable" "package" ];
  };
}
