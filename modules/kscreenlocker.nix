{ config, lib, ... }:
with lib;
let cfg = config.programs.plasma;
in {
  options.programs.plasma.kscreenlocker = { 
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
  config = mkIf cfg.enable {
    programs.plasma.files."kscreenlockerrc" = cfg.kscreenlocker;
  };
}
