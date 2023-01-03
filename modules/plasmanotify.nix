{ config, lib, ... }:
with lib;
let cfg = config.programs.plasma;
in {
  options.programs.plasma.plasmanotify = { 
    "$(DesktopEntry)" = with types; mkOption {
      type = submodule {
        options = { 
          ShowBadges = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          ShowInHistory = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          ShowPopups = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          ShowPopupsInDndMode = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
        };
      };
      default = {};
      description = "$(DesktopEntry)";
    };    
    "Badges" = with types; mkOption {
      type = submodule {
        options = { 
          InTaskManager = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
        };
      };
      default = {};
      description = "Badges";
    };    
    "DoNotDisturb" = with types; mkOption {
      type = submodule {
        options = { 
          NotificationSoundsMuted = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          Until = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              

              Type: DateTime
            '';
          };
          WhenScreenSharing = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          WhenScreensMirrored = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
        };
      };
      default = {};
      description = "DoNotDisturb";
    };    
    "Jobs" = with types; mkOption {
      type = submodule {
        options = { 
          InNotifications = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          InTaskManager = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          PermanentPopups = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
        };
      };
      default = {};
      description = "Jobs";
    };    
    "Notifications" = with types; mkOption {
      type = submodule {
        options = { 
          CriticalInDndMode = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          LowPriorityHistory = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          LowPriorityPopups = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          NormalAlwaysOnTop = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          PopupPosition = mkOption {
            type = nullOr (either str (enum [ 
              "CloseToWidget"
              "TopLeft"
              "TopCenter"
              "TopRight"
              "BottomLeft"
              "BottomCenter"
              "BottomRight"
            ]));
            default = "CloseToWidget";
            description = ''
              

              Type: Enum
              Choices: 
                - CloseToWidget
                - TopLeft
                - TopCenter
                - TopRight
                - BottomLeft
                - BottomCenter
                - BottomRight
            '';
          };
          PopupTimeout = mkOption {
            type = nullOr (either str int);
            default = 5000;
            description = ''
              

              Type: Int
            '';
          };
        };
      };
      default = {};
      description = "Notifications";
    };    
  };
  config = mkIf cfg.enable {
    programs.plasma.files."plasmanotifyrc" = cfg.plasmanotify;
  };
}
