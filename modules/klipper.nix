{ config, lib, ... }:
with lib;
let
  cfg = config.programs.plasma;
  moduleCfg = config.programs.plasma.klipper;
in {
  options.programs.plasma.klipper = {
    enable = mkEnableOption ''
      Enable klipper
    '';
    package = mkOption {
      default = if (pkgs ? klipper) then
                        pkgs.klipper
                      else
                        (if pkgs.libsForQt5 ? klipper then pkgs.libsForQt5.klipper else false);
      defaultText = literalExpression "pkgs.klipper";
      type = with types; either bool package;
      description = mdDoc "Package to use.";
    };
    "Actions" = with types; mkOption {
      type = submodule {
        options = { 
          EnableMagicMimeActions = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Include MIME actions

              Type: Bool
            '';
          };
          ReplayActionInHistory = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              For an item chosen from history

              Type: Bool
            '';
          };
          StripWhiteSpace = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Trim whitespace from selection

              Type: Bool
            '';
          };
        };
      };
      default = {};
      description = "Actions";
    };    
    "General" = with types; mkOption {
      type = submodule {
        options = { 
          ActionListChanged = mkOption {
            type = nullOr (either str int);
            default = -1;
            description = ''
              Dummy entry for indicating changes in an action's tree widget

              Type: Int
            '';
          };
          ActionsInfoMessageShown = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          IgnoreImages = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Always ignore images

              Type: Bool
            '';
          };
          IgnoreSelection = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Ignore the selection

              Type: Bool
            '';
          };
          KeepClipboardContents = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Save history across desktop sessions

              Type: Bool
            '';
          };
          MaxClipItems = mkOption {
            type = nullOr (either str int);
            default = 20;
            description = ''
              History size:

              Type: Int
              Min: 1
              Max: 2048
            '';
          };
          "NoActionsForWM_CLASS" = mkOption {
            type = nullOr (either str (listOf str));
            default = "Navigator,navigator:browser,konqueror,keditbookmarks,mozilla-bin,Mozilla,Opera main window,opera,gnumeric,Gnumeric,Galeon,kcontrol,ksirc,MozillaFirebird-bin,firefox-bin,Firefox-bin,klipper,Gecko,gecko";
            description = ''
              No actions for WM_CLASS

              Type: StringList
            '';
          };
          NoEmptyClipboard = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Prevent the clipboard from being cleared

              Type: Bool
            '';
          };
          SelectionTextOnly = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Text selection only

              Type: Bool
            '';
          };
          SyncClipboards = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Keep the selection and clipboard the same

              Type: Bool
            '';
          };
          Synchronize = mkOption {
            type = nullOr (either str int);
            default = 3;
            description = ''
              Backwards compatibility, don't touch.

              Type: Int
            '';
          };
          TimeoutForActionPopups = mkOption {
            type = nullOr (either str int);
            default = 8;
            description = ''
              Automatic action menu time:

              Type: Int
              Min: 0
              Max: 200
            '';
          };
          URLGrabberEnabled = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Immediately on selection

              Type: Bool
            '';
          };
          UseGUIRegExpEditor = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Use graphical regexp editor

              Type: Bool
            '';
          };
          Version = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              Klipper version

              Type: String
            '';
          };
        };
      };
      default = {};
      description = "General";
    };    
  };
  config = mkIf (cfg.enable && moduleCfg.enable) {
    home.packages = mkIf moduleCfg.package [ moduleCfg.package ];
    programs.plasma.files."klipperrc" = removeAttrs moduleCfg [ "enable" "package" ];
  };
}
