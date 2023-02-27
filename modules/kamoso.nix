{ config, lib, pkgs, ... }:
with lib;
let
  cfg = config.programs.plasma;
  moduleCfg = config.programs.plasma.kamoso;
in {
  options.programs.plasma.kamoso = {
    enable = mkEnableOption ''
      Enable kamoso
    '';
    package = mkOption {
      default = if (pkgs ? kamoso) then
                        pkgs.kamoso
                      else
                        (if pkgs.libsForQt5 ? kamoso then pkgs.libsForQt5.kamoso else false);
      defaultText = literalExpression "pkgs.kamoso";
      type = with types; either bool package;
      description = mdDoc "Package to use.";
    };
    "General" = with types; mkOption {
      type = submodule {
        options = { 
          saveUrl = mkOption {
            type = nullOr str;
            default = null;
            defaultText = "Code: true";
            description = ''
              Where the photos are saved.

              Type: Url
            '';
          };
          saveVideos = mkOption {
            type = nullOr str;
            default = null;
            defaultText = "Code: true";
            description = ''
              Where the photos are saved.

              Type: Url
            '';
          };
        };
      };
      default = {};
      description = "General";
    };    
    "WebcamSettings" = with types; mkOption {
      type = submodule {
        options = { 
          deviceObjectId = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              Points to the last used webcam.

              Type: String
            '';
          };
          mirrored = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Vertically mirror the camera view.

              Type: bool
            '';
          };
        };
      };
      default = {};
      description = "WebcamSettings";
    };    
  };
  config = mkIf (cfg.enable && moduleCfg.enable) {
    home.packages = mkIf (moduleCfg.package != false) [ moduleCfg.package ];
    programs.plasma.files."kamosorc" = removeAttrs moduleCfg [ "enable" "package" ];
  };
}
