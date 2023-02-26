{ config, lib, pkgs, ... }:
with lib;
let
  cfg = config.programs.plasma;
  moduleCfg = config.programs.plasma.kscreenlocker;
in {
  options.programs.plasma.kscreenlocker = {
    enable = mkEnableOption ''
      Enable kscreenlocker
    '';
    package = mkOption {
      default = if (pkgs ? kscreenlocker) then
                        pkgs.kscreenlocker
                      else
                        (if pkgs.libsForQt5 ? kscreenlocker then pkgs.libsForQt5.kscreenlocker else false);
      defaultText = literalExpression "pkgs.kscreenlocker";
      type = with types; either bool package;
      description = mdDoc "Package to use.";
    };
    "Daemon" = with types; mkOption {
      type = submodule {
        options = { 
          Autolock = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Screen lock enabled

              Type: Bool
            '';
          };
          Lock = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          LockGrace = mkOption {
            type = nullOr (either str int);
            default = 5;
            description = ''
              

              Type: Int
              Min: 0
              Max: 300
            '';
          };
          LockOnResume = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          LockOnStart = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Defines if the session is locked on startup

              Type: Bool
            '';
          };
          Timeout = mkOption {
            type = nullOr (either str int);
            default = 5;
            description = ''
              Screen saver timeout

              Type: Int
              Min: 1
            '';
          };
        };
      };
      default = {};
      description = "Daemon";
    };    
    "Greeter" = with types; mkOption {
      type = submodule {
        options = { 
          Theme = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              

              Type: String
            '';
          };
          ThemeBackground = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              

              Type: String
            '';
          };
          WallpaperPlugin = mkOption {
            type = nullOr str;
            default = "org.kde.image";
            description = ''
              

              Type: String
            '';
          };
        };
      };
      default = {};
      description = "Greeter";
    };    
  };
  config = mkIf (cfg.enable && moduleCfg.enable) {
    home.packages = mkIf (moduleCfg.package != false) [ moduleCfg.package ];
    programs.plasma.files."kscreenlockerrc" = removeAttrs moduleCfg [ "enable" "package" ];
  };
}
