{ config, lib, ... }:
with lib;
let
  cfg = config.programs.plasma;
  moduleCfg = config.programs.plasma.krfb;
in {
  options.programs.plasma.krfb = {
    enable = mkEnableOption ''
      Enable krfb
    '';
    package = mkOption {
      default = if (pkgs ? krfb) then
                        pkgs.krfb
                      else
                        (if pkgs.libsForQt5 ? krfb then pkgs.libsForQt5.krfb else false);
      defaultText = literalExpression "pkgs.krfb";
      type = with types; either bool package;
      description = mdDoc "Package to use.";
    };
    "FrameBuffer" = with types; mkOption {
      type = submodule {
        options = { 
          preferredFrameBufferPlugin = mkOption {
            type = nullOr str;
            default = "xcb";
            description = ''
              Preferred Frame Buffer Plugin

              Type: String
            '';
          };
        };
      };
      default = {};
      description = "FrameBuffer";
    };    
    "MainWindow" = with types; mkOption {
      type = submodule {
        options = { 
          startMinimized = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Start minimized

              Type: Bool
            '';
          };
        };
      };
      default = {};
      description = "MainWindow";
    };    
    "Security" = with types; mkOption {
      type = submodule {
        options = { 
          allowDesktopControl = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Allow remote connections to manage the desktop.

              Type: Bool
            '';
          };
          allowUnattendedAccess = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Allow connections without an invitation.

              Type: Bool
            '';
          };
          desktopSharingPassword = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              Password for uninvited connections.

              Type: String
            '';
          };
          noWallet = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Do not store passwords in KWallet

              Type: Bool
            '';
          };
          unattendedAccessPassword = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              Password for uninvited connections.

              Type: String
            '';
          };
        };
      };
      default = {};
      description = "Security";
    };    
    "TCP" = with types; mkOption {
      type = submodule {
        options = { 
          port = mkOption {
            type = nullOr (either str int);
            default = 5900;
            description = ''
              This is the port on which krfb will listen.

              Type: Int
            '';
          };
          publishService = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Announce the service on the local network

              Type: Bool
            '';
          };
          useDefaultPort = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Use the default port for VNC (5900)

              Type: Bool
            '';
          };
        };
      };
      default = {};
      description = "TCP";
    };    
  };
  config = mkIf (cfg.enable && moduleCfg.enable) {
    home.packages = mkIf moduleCfg.package [ moduleCfg.package ];
    programs.plasma.files."krfbrc" = removeAttrs moduleCfg [ "enable" "package" ];
  };
}
