{ config, lib, ... }:
with lib;
let cfg = config.programs.plasma;
in {
  options.programs.plasma.klipper = {
    "General" = with types;
      mkOption {
        type = submodule {
          options = {
            Version = mkOption {
              type = nullOr (either str str);
              default = "";
              description = ''
                Klipper version

                Type: String
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
            "NoEmptyClipboard" = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''
                Prevent the clipboard from being cleared

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
            SyncClipboards = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''
                Keep the selection and clipboard the same

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
            SelectionTextOnly = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''
                Text selection only

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
            UseGUIRegExpEditor = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''
                Use graphical regexp editor

                Type: Bool
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
            NoActionsForWM_CLASS = mkOption {
              type = nullOr (either str (listOf str));
              default =
                "Navigator,navigator:browser,konqueror,keditbookmarks,mozilla-bin,Mozilla,Opera main window,opera,gnumeric,Gnumeric,Galeon,kcontrol,ksirc,MozillaFirebird-bin,firefox-bin,Firefox-bin,klipper,Gecko,gecko";
              description = ''
                No actions for WM_CLASS

                Type: StringList
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
            "ActionListChanged" = mkOption {
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
          };
        };
        default = { };
        description = "General";
      };
    "Actions" = with types;
      mkOption {
        type = submodule {
          options = {
            StripWhiteSpace = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''
                Trim whitespace from selection

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
            EnableMagicMimeActions = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''
                Include MIME actions

                Type: Bool
              '';
            };
          };
        };
        default = { };
        description = "Actions";
      };
  };
  config = mkIf cfg.enable { programs.plasma.files."klipperrc" = cfg.klipper; };
}