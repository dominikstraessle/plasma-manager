{ config, lib, ... }:
with lib;
let
  cfg = config.programs.plasma;
  moduleCfg = config.programs.plasma.knetwalk;
in {
  options.programs.plasma.knetwalk = {
    enable = mkEnableOption ''
      Enable knetwalk
    '';
    package = mkOption {
      default = if (pkgs ? knetwalk) then
                        pkgs.knetwalk
                      else
                        (if pkgs.libsForQt5 ? knetwalk then pkgs.libsForQt5.knetwalk else false);
      defaultText = literalExpression "pkgs.knetwalk";
      type = with types; either bool package;
      description = mdDoc "Package to use.";
    };
    "Custom" = with types; mkOption {
      type = submodule {
        options = { 
          Wrapping = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Whether wrap from left to right and from top to bottom is enabled.

              Type: Bool
            '';
          };
          height = mkOption {
            type = nullOr (either str int);
            default = 6;
            description = ''
              The height of the board.

              Type: Int
              Min: 3
              Max: 11
            '';
          };
          width = mkOption {
            type = nullOr (either str int);
            default = 6;
            description = ''
              The width of the board.

              Type: Int
              Min: 3
              Max: 11
            '';
          };
        };
      };
      default = {};
      description = "Custom";
    };    
    "General" = with types; mkOption {
      type = submodule {
        options = { 
          Autolock = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Whether lock cell after rotation.

              Type: Bool
            '';
          };
          PlaySounds = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Whether game sounds are played.

              Type: Bool
            '';
          };
          ReverseButtons = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Use left click for clockwise and right click for counter-clockwise.

              Type: Bool
            '';
          };
          RotateDuration = mkOption {
            type = nullOr (either str int);
            default = 300;
            description = ''
              Duration for cell to complete one rotation.

              Type: Int
              Min: 100
              Max: 500
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
          username = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              Default user name

              Type: String
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
    programs.plasma.files."knetwalkrc" = removeAttrs moduleCfg [ "enable" "package" ];
  };
}
