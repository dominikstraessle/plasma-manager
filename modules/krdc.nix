{ config, lib, pkgs, ... }:
with lib;
let
  cfg = config.programs.plasma;
  moduleCfg = config.programs.plasma.krdc;
in {
  options.programs.plasma.krdc = {
    enable = mkEnableOption ''
      Enable krdc
    '';
    package = mkOption {
      default = if (pkgs ? krdc) then
                        pkgs.krdc
                      else
                        (if pkgs.libsForQt5 ? krdc then pkgs.libsForQt5.krdc else false);
      defaultText = literalExpression "pkgs.krdc";
      type = with types; either bool package;
      description = mdDoc "Package to use.";
    };
    "General" = with types; mkOption {
      type = submodule {
        options = { 
          BackgroundColor = mkOption {
            type = nullOr str;
            default = "#00417F";
            description = ''
              

              Type: Color
            '';
          };
          ConnectionListSortColumn = mkOption {
            type = nullOr (either str int);
            default = 2;
            description = ''
              

              Type: Int
            '';
          };
          ConnectionListSortOrder = mkOption {
            type = nullOr (either str int);
            default = 1;
            description = ''
              

              Type: Int
            '';
          };
          DefaultProtocol = mkOption {
            type = nullOr str;
            default = "vnc";
            description = ''
              

              Type: String
            '';
          };
          FullscreenOnConnect = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          Items = mkOption {
            type = nullOr (either str (listOf str));
            default = "";
            description = ''
              Sessions

              Type: StringList
            '';
          };
          KeepAspectRatio = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          NormalUrlInputLine = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          RememberHistory = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          RememberSessions = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          ResizeOnConnect = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          ShowPreferencesForNewConnections = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          ShowStatusBar = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          ShowTabBar = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          SystemTrayIcon = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          TabCloseButton = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          TabMiddleClick = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          TabPosition = mkOption {
            type = nullOr (either str int);
            default = 0;
            description = ''
              

              Type: Int
            '';
          };
          WalletSupport = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
        };
      };
      default = {};
      description = "General";
    };    
    "NX" = with types; mkOption {
      type = submodule {
        options = { 
          NxDesktopType = mkOption {
            type = nullOr (either str int);
            default = 0;
            description = ''
              

              Type: Int
            '';
          };
          NxHeight = mkOption {
            type = nullOr (either str int);
            default = 600;
            description = ''
              

              Type: Int
            '';
          };
          NxKeyboardLayout = mkOption {
            type = nullOr (either str int);
            default = 7;
            description = ''
              

              Type: Int
            '';
          };
          NxPrivateKey = mkOption {
            type = nullOr str;
            default = "default";
            description = ''
              

              Type: String
            '';
          };
          NxWidth = mkOption {
            type = nullOr (either str int);
            default = 800;
            description = ''
              

              Type: Int
            '';
          };
        };
      };
      default = {};
      description = "NX";
    };    
    "RDP" = with types; mkOption {
      type = submodule {
        options = { 
          ColorDepth = mkOption {
            type = nullOr (either str int);
            default = 2;
            description = ''
              

              Type: Int
            '';
          };
          Console = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          DefaultRdpUserName = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              

              Type: String
            '';
          };
          ExtraOptions = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              

              Type: String
            '';
          };
          Height = mkOption {
            type = nullOr (either str int);
            default = 600;
            description = ''
              

              Type: Int
            '';
          };
          KeyboardLayout = mkOption {
            type = nullOr (either str int);
            default = 7;
            description = ''
              

              Type: Int
            '';
          };
          Performance = mkOption {
            type = nullOr (either str int);
            default = 2;
            description = ''
              

              Type: Int
            '';
          };
          RecognizeLdapLogins = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          RemoteFX = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          Resolution = mkOption {
            type = nullOr (either str int);
            default = 6;
            description = ''
              

              Type: Int
            '';
          };
          ShareMedia = mkOption {
            type = nullOr str;
            default = "/media";
            description = ''
              

              Type: String
            '';
          };
          Sound = mkOption {
            type = nullOr (either str int);
            default = 0;
            description = ''
              

              Type: Int
            '';
          };
          SoundSystem = mkOption {
            type = nullOr (either str int);
            default = 0;
            description = ''
              

              Type: Int
            '';
          };
          Width = mkOption {
            type = nullOr (either str int);
            default = 800;
            description = ''
              

              Type: Int
            '';
          };
        };
      };
      default = {};
      description = "RDP";
    };    
    "VNC" = with types; mkOption {
      type = submodule {
        options = { 
          Quality = mkOption {
            type = nullOr (either str int);
            default = 1;
            description = ''
              

              Type: Int
            '';
          };
          Scaling = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          ScalingHeight = mkOption {
            type = nullOr (either str int);
            default = 600;
            description = ''
              

              Type: Int
            '';
          };
          ScalingWidth = mkOption {
            type = nullOr (either str int);
            default = 800;
            description = ''
              

              Type: Int
            '';
          };
        };
      };
      default = {};
      description = "VNC";
    };    
  };
  config = mkIf (cfg.enable && moduleCfg.enable) {
    home.packages = mkIf moduleCfg.package [ moduleCfg.package ];
    programs.plasma.files."krdcrc" = removeAttrs moduleCfg [ "enable" "package" ];
  };
}
