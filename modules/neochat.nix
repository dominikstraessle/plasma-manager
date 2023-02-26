{ config, lib, ... }:
with lib;
let
  cfg = config.programs.plasma;
  moduleCfg = config.programs.plasma.neochat;
in {
  options.programs.plasma.neochat = {
    enable = mkEnableOption ''
      Enable neochat
    '';
    package = mkOption {
      default = if (pkgs ? neochat) then
                        pkgs.neochat
                      else
                        (if pkgs.libsForQt5 ? neochat then pkgs.libsForQt5.neochat else false);
      defaultText = literalExpression "pkgs.neochat";
      type = with types; either bool package;
      description = mdDoc "Package to use.";
    };
    "General" = with types; mkOption {
      type = submodule {
        options = { 
          ActiveConnection = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              Latest active connection

              Type: String
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
          AutoRoomInfoDrawer = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Automatic Hide/Unhide Room Information

              Type: bool
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
          CollapsedSections = mkOption {
            type = nullOr (either str (listOf int));
            default = "";
            description = ''
              Collapsed sections in the room list

              Type: IntList
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
          MergeRoomList = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Merge Room Lists

              Type: bool
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
          RoomDrawerWidth = mkOption {
            type = nullOr (either str int);
            default = -1;
            description = ''
              

              Type: int
            '';
          };
          RoomListPageWidth = mkOption {
            type = nullOr (either str int);
            default = -1;
            description = ''
              

              Type: int
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
          ShowLocalMessagesOnRight = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              "Show your messages on the right

              Type: bool
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
          Transparency = mkOption {
            type = nullOr (either str float);
            default = 0.3;
            description = ''
              Background transparency value

              Type: Double
            '';
          };
          TypingNotifications = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: bool
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
          ProxyHost = mkOption {
            type = nullOr str;
            default = "127.0.0.1";
            description = ''
              IP or hostname of the proxy

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
          ProxyPort = mkOption {
            type = nullOr (either str int);
            default = 1080;
            description = ''
              The port number of the proxy

              Type: int
            '';
          };
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
          ProxyUser = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              The user of the proxy

              Type: String
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
          CompactLayout = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Use a compact layout

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
          ShowAvatarInTimeline = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Show avatar in the timeline

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
          ShowFancyEffects = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Show Fancy Effects

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
          ShowRename = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Show rename events in the timeline

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
        };
      };
      default = {};
      description = "Timeline";
    };    
  };
  config = mkIf (cfg.enable && moduleCfg.enable) {
    home.packages = mkIf moduleCfg.package [ moduleCfg.package ];
    programs.plasma.files."neochatrc" = removeAttrs moduleCfg [ "enable" "package" ];
  };
}
