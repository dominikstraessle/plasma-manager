{ config, lib, ... }:
with lib;
let cfg = config.programs.plasma;
in {
  options.programs.plasma.neochat = { 
    "General" = with types; mkOption {
      type = submodule {
        options = { 
          CollapsedSections = mkOption {
            type = nullOr (either str (listOf int));
            default = "";
            description = ''
              Collapsed sections in the room list

              Type: IntList
            '';
          };
          OpenRoom = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              Latest opened room

              Type: String
            '';
          };
          ActiveConnection = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              Latest active connection

              Type: String
            '';
          };
          ColorScheme = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              Color scheme

              Type: String
            '';
          };
          Blur = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Make NeoChat blurry

              Type: bool
            '';
          };
          Transparency = mkOption {
            type = nullOr (either str float);
            default = 0.3;
            description = ''
              Background transparency value

              Type: Double
            '';
          };
          ShowNotifications = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Show notifications

              Type: bool
            '';
          };
          MergeRoomList = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Merge Room Lists

              Type: bool
            '';
          };
          ShowLeaveJoinEvent = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Show leave and join events in the timeline

              Type: bool
            '';
          };
          AllowQuickEdit = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Use s/text/replacement syntax to edit your last message.

              Type: bool
            '';
          };
          ShowLocalMessagesOnRight = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              "Show your messages on the right

              Type: bool
            '';
          };
          RoomListPageWidth = mkOption {
            type = nullOr (either str int);
            default = -1;
            description = ''
              

              Type: int
            '';
          };
          RoomDrawerWidth = mkOption {
            type = nullOr (either str int);
            default = -1;
            description = ''
              

              Type: int
            '';
          };
          TypingNotifications = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: bool
            '';
          };
          AutoRoomInfoDrawer = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Automatic Hide/Unhide Room Information

              Type: bool
            '';
          };
          DeveloperTools = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Enable developer tools

              Type: bool
            '';
          };
          LastSaveDirectory = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              Directory last used for saving a file

              Type: String
            '';
          };
        };
      };
      default = {};
      description = "General";
    };    
    "NetworkProxy" = with types; mkOption {
      type = submodule {
        options = { 
          ProxyType = mkOption {
            type = nullOr (either str (enum [ 
              "System"
              "HTTP"
              "Socks5"
            ]));
            default = "";
            description = ''
              The type of proxy used by the application.

              Type: Enum
              Choices: 
                - System: System Default
                - HTTP: HTTP
                - Socks5: Socks5
            '';
          };
          ProxyHost = mkOption {
            type = nullOr str;
            default = "127.0.0.1";
            description = ''
              IP or hostname of the proxy

              Type: String
            '';
          };
          ProxyPort = mkOption {
            type = nullOr (either str int);
            default = 1080;
            description = ''
              The port number of the proxy

              Type: int
            '';
          };
          ProxyUser = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              The user of the proxy

              Type: String
            '';
          };
          ProxyPassword = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              The password of the proxy

              Type: Password
            '';
          };
        };
      };
      default = {};
      description = "NetworkProxy";
    };    
    "RoomDrawer" = with types; mkOption {
      type = submodule {
        options = { 
          ShowAvatarInRoomDrawer = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Show avatar in the room drawer

              Type: bool
            '';
          };
        };
      };
      default = {};
      description = "RoomDrawer";
    };    
    "Timeline" = with types; mkOption {
      type = submodule {
        options = { 
          ShowAvatarInTimeline = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Show avatar in the timeline

              Type: bool
            '';
          };
          CompactLayout = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Use a compact layout

              Type: bool
            '';
          };
          ShowRename = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Show rename events in the timeline

              Type: bool
            '';
          };
          ShowAvatarUpdate = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Show avatar update events in the timeline

              Type: bool
            '';
          };
          ShowDeletedMessages = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Show deleted messages in the timeline

              Type: bool
            '';
          };
          ShowLinkPreview = mkOption {
            type = nullOr (either str bool);
            default = "";
            description = ''
              Show preview of the links in the chat messages

              Type: bool
            '';
          };
          SystemTray = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Close NeoChat to system tray

              Type: bool
            '';
          };
          MinimizeToSystemTrayOnStartup = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Minimize to system tray on startup

              Type: bool
            '';
          };
          ShowFancyEffects = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Show Fancy Effects

              Type: bool
            '';
          };
        };
      };
      default = {};
      description = "Timeline";
    };    
  };
  config = mkIf cfg.enable {
    programs.plasma.files."neochatrc" = cfg.neochat;
  };
}
