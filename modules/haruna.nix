{ config, lib, ... }:
with lib;
let cfg = config.programs.plasma;
in {
  options.programs.plasma.haruna = {
    "Audio" = with types;
      mkOption {
        type = submodule {
          options = {
            "PreferredLanguage" = mkOption {
              type = nullOr str;
              default = "";
              description = ''


                Type: String
              '';
            };
            "PreferredTrack" = mkOption {
              type = nullOr (either str int);
              default = "";
              description = ''


                Type: Int
              '';
            };
          };
        };
        default = { };
        description = "Audio";
      };
    "General" = with types;
      mkOption {
        type = submodule {
          options = {
            "ColorScheme" = mkOption {
              type = nullOr str;
              default = "";
              description = ''


                Type: String
              '';
            };
            "FileDialogLastLocation" = mkOption {
              type = nullOr str;
              default = "videoFolder";
              defaultText = "Code: true";
              description = ''


                Type: String
              '';
            };
            "FileDialogLocation" = mkOption {
              type = nullOr str;
              default = "";
              description = ''


                Type: String
              '';
            };
            "GuiStyle" = mkOption {
              type = nullOr str;
              default = "Default";
              description = ''


                Type: String
              '';
            };
            "LastPlayedFile" = mkOption {
              type = nullOr str;
              default = "";
              description = ''


                Type: String
              '';
            };
            "LastPlaylist" = mkOption {
              type = nullOr str;
              default = "";
              description = ''


                Type: String
              '';
            };
            "LastUrl" = mkOption {
              type = nullOr str;
              default = "";
              description = ''


                Type: String
              '';
            };
            "MaxRecentFiles" = mkOption {
              type = nullOr (either str int);
              default = 10;
              description = ''


                Type: Int
              '';
            };
            "OsdFontSize" = mkOption {
              type = nullOr (either str int);
              default = 25;
              description = ''


                Type: Int
              '';
            };
            "RememberWindowGeometry" = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''


                Type: bool
              '';
            };
            "SeekBigStep" = mkOption {
              type = nullOr (either str int);
              default = 30;
              description = ''


                Type: Int
              '';
            };
            "SeekMediumStep" = mkOption {
              type = nullOr (either str int);
              default = 15;
              description = ''


                Type: Int
              '';
            };
            "SeekSmallStep" = mkOption {
              type = nullOr (either str int);
              default = 5;
              description = ''


                Type: Int
              '';
            };
            "ShowChapterMarkers" = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''


                Type: bool
              '';
            };
            "ShowHeader" = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''


                Type: bool
              '';
            };
            "ShowMenuBar" = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''


                Type: bool
              '';
            };
            "UseBreezeIconTheme" = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''


                Type: bool
              '';
            };
            "Volume" = mkOption {
              type = nullOr (either str int);
              default = 80;
              description = ''


                Type: Int
              '';
            };
            "VolumeStep" = mkOption {
              type = nullOr (either str int);
              default = 5;
              description = ''


                Type: Int
              '';
            };
          };
        };
        default = { };
        description = "General";
      };
    "Mouse" = with types;
      mkOption {
        type = submodule {
          options = {
            "Left" = mkOption {
              type = nullOr str;
              default = "";
              description = ''


                Type: String
              '';
            };
            "Leftx2" = mkOption {
              type = nullOr str;
              default = "toggleFullscreenAction";
              description = ''


                Type: String
              '';
            };
            "Middle" = mkOption {
              type = nullOr str;
              default = "muteAction";
              description = ''


                Type: String
              '';
            };
            "Middlex2" = mkOption {
              type = nullOr str;
              default = "configureAction";
              description = ''


                Type: String
              '';
            };
            "Right" = mkOption {
              type = nullOr str;
              default = "playPauseAction";
              description = ''


                Type: String
              '';
            };
            "Rightx2" = mkOption {
              type = nullOr str;
              default = "";
              description = ''


                Type: String
              '';
            };
            "ScrollDown" = mkOption {
              type = nullOr str;
              default = "volumeDownAction";
              description = ''


                Type: String
              '';
            };
            "ScrollUp" = mkOption {
              type = nullOr str;
              default = "volumeUpAction";
              description = ''


                Type: String
              '';
            };
          };
        };
        default = { };
        description = "Mouse";
      };
    "Playback" = with types;
      mkOption {
        type = submodule {
          options = {
            "ChaptersToSkip" = mkOption {
              type = nullOr str;
              default = "";
              description = ''


                Type: String
              '';
            };
            "HWDecoding" = mkOption {
              type = nullOr str;
              default = "auto";
              description = ''


                Type: String
              '';
            };
            "MinDurationToSavePosition" = mkOption {
              type = nullOr (either str int);
              default = 1;
              description = ''


                Type: int
              '';
            };
            "OpenLastPlayedFile" = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''


                Type: bool
              '';
            };
            "PauseWhileMinimized" = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''


                Type: bool
              '';
            };
            "PlayOnResume" = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''


                Type: bool
              '';
            };
            "SavePositionInterval" = mkOption {
              type = nullOr (either str int);
              default = 1;
              description = ''


                Type: int
              '';
            };
            "SeekToLastPosition" = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''


                Type: bool
              '';
            };
            "ShowOsdOnSkipChapters" = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''


                Type: bool
              '';
            };
            "SkipChapters" = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''


                Type: bool
              '';
            };
            "UseHWDecoding" = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''


                Type: bool
              '';
            };
            "YtdlFormat" = mkOption {
              type = nullOr str;
              default = "";
              description = ''


                Type: String
              '';
            };
          };
        };
        default = { };
        description = "Playback";
      };
    "Playlist" = with types;
      mkOption {
        type = submodule {
          options = {
            "BigFontFullscreen" = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''


                Type: bool
              '';
            };
            "CanToggleWithMouse" = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''


                Type: bool
              '';
            };
            "LoadSiblings" = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''


                Type: bool
              '';
            };
            "OverlayVideo" = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''


                Type: bool
              '';
            };
            "Position" = mkOption {
              type = nullOr str;
              default = "right";
              description = ''


                Type: String
              '';
            };
            "RememberState" = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''


                Type: bool
              '';
            };
            "Repeat" = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''


                Type: bool
              '';
            };
            "ShowMediaTitle" = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''


                Type: bool
              '';
            };
            "ShowRowNumber" = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''


                Type: bool
              '';
            };
            "ShowThumbnails" = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''


                Type: bool
              '';
            };
            "Style" = mkOption {
              type = nullOr str;
              default = "default";
              description = ''


                Type: String
              '';
            };
            "Visible" = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''


                Type: bool
              '';
            };
          };
        };
        default = { };
        description = "Playlist";
      };
    "Subtitles" = with types;
      mkOption {
        type = submodule {
          options = {
            "AllowOnBlackBorders" = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''


                Type: Bool
              '';
            };
            "BorderColor" = mkOption {
              type = nullOr str;
              default = "#FF000000";
              description = ''


                Type: String
              '';
            };
            "BorderSize" = mkOption {
              type = nullOr (either str int);
              default = 3;
              description = ''


                Type: Int
              '';
            };
            "FontColor" = mkOption {
              type = nullOr str;
              default = "#FFFFFFFF";
              description = ''


                Type: String
              '';
            };
            "FontFamily" = mkOption {
              type = nullOr str;
              default = "Sans Serif";
              description = ''


                Type: String
              '';
            };
            "FontSize" = mkOption {
              type = nullOr (either str int);
              default = "";
              description = ''


                Type: Int
              '';
            };
            "IsBold" = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''


                Type: Bool
              '';
            };
            "IsItalic" = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''


                Type: Bool
              '';
            };
            "PreferredLanguage" = mkOption {
              type = nullOr str;
              default = "";
              description = ''


                Type: String
              '';
            };
            "PreferredTrack" = mkOption {
              type = nullOr (either str int);
              default = "";
              description = ''


                Type: Int
              '';
            };
            "ShadowColor" = mkOption {
              type = nullOr str;
              default = "#80F0F0F0";
              description = ''


                Type: String
              '';
            };
            "ShadowOffset" = mkOption {
              type = nullOr (either str int);
              default = 0;
              description = ''


                Type: Int
              '';
            };
            "SubtitlesFolders" = mkOption {
              type = nullOr (either str (listOf str));
              default = "subs";
              description = ''


                Type: StringList
              '';
            };
          };
        };
        default = { };
        description = "Subtitles";
      };
    "Video" = with types;
      mkOption {
        type = submodule {
          options = {
            "DefaultCover" = mkOption {
              type = nullOr str;
              default = "";
              description = ''


                Type: String
              '';
            };
            "ScreenshotFormat" = mkOption {
              type = nullOr str;
              default = "jpg";
              description = ''


                Type: String
              '';
            };
            "ScreenshotTemplate" = mkOption {
              type = nullOr str;
              default = "screenshotsFolder";
              defaultText = "Code: true";
              description = ''


                Type: String
              '';
            };
          };
        };
        default = { };
        description = "Video";
      };
  };
  config = mkIf cfg.enable {
    programs.plasma.files."haruna/haruna.conf" = cfg.haruna;
  };
}
