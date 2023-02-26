{ config, lib, ... }:
with lib;
let
  cfg = config.programs.plasma;
  moduleCfg = config.programs.plasma.kdenlive;
in {
  options.programs.plasma.kdenlive = {
    enable = mkEnableOption ''
      Enable kdenlive
    '';
    package = mkOption {
      default = if (pkgs ? kdenlive) then
                        pkgs.kdenlive
                      else
                        (if pkgs.libsForQt5 ? kdenlive then pkgs.libsForQt5.kdenlive else false);
      defaultText = literalExpression "pkgs.kdenlive";
      type = with types; either bool package;
      description = mdDoc "Package to use.";
    };
    "bezier_spline" = with types; mkOption {
      type = submodule {
        options = { 
          "bezier_gridlines" = mkOption {
            type = nullOr (either str int);
            default = 3;
            description = ''
              Number of lines to use for the grid.

              Type: Int
            '';
          };
          "bezier_showallhandles" = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Show handles for all points or only for the selected one.

              Type: Bool
            '';
          };
          "bezier_showpixmap" = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Should a background indicating the changes caused by curve manipulation be shown.

              Type: Bool
            '';
          };
        };
      };
      default = {};
      description = "bezier_spline";
    };    
    "bin" = with types; mkOption {
      type = submodule {
        options = { 
          addedExtensions = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              User added clip file extensions.

              Type: String
            '';
          };
          binMode = mkOption {
            type = nullOr (either str int);
            default = 0;
            description = ''
              Bin view mode.

              Type: Int
            '';
          };
          binSorting = mkOption {
            type = nullOr (either str int);
            default = 0;
            description = ''
              Bin sorting column.

              Type: Int
            '';
          };
          "bin_zoom" = mkOption {
            type = nullOr (either str int);
            default = 4;
            description = ''
              Bin default zoom.

              Type: Int
            '';
          };
          hoverPreview = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Generate and show video preview when moving mouse over clip thumbnail.

              Type: Bool
            '';
          };
          treeviewheaders = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              Bin treeview headers state.

              Type: String
            '';
          };
        };
      };
      default = {};
      description = "bin";
    };    
    "capture" = with types; mkOption {
      type = submodule {
        options = { 
          alsachannels = mkOption {
            type = nullOr (either str int);
            default = 2;
            description = ''
              Number of audio channels.

              Type: UInt
            '';
          };
          audiocapturechannels = mkOption {
            type = nullOr (either str int);
            default = 2;
            description = ''
              Audio capture channels

              Type: Int
            '';
          };
          audiocapturesamplerate = mkOption {
            type = nullOr (either str int);
            default = 48000;
            description = ''
              Audio capture sample rate

              Type: Int
            '';
          };
          audiocapturevolume = mkOption {
            type = nullOr (either str int);
            default = 100;
            description = ''
              Audio capture volume

              Type: Int
            '';
          };
          "decklink_capturedevice" = mkOption {
            type = nullOr (either str int);
            default = 0;
            description = ''
              default HDMI capture device.

              Type: UInt
            '';
          };
          "decklink_device_found" = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Enable Blackmagic decklink support.

              Type: Bool
            '';
          };
          "decklink_extension" = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              Default Decklink capture file extension.

              Type: String
            '';
          };
          "decklink_filename" = mkOption {
            type = nullOr str;
            default = "capture";
            description = ''
              default HDMI capture filename.

              Type: String
            '';
          };
          "decklink_parameters" = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              Default Decklink encoding parameters.

              Type: String
            '';
          };
          "decklink_profile" = mkOption {
            type = nullOr (either str int);
            default = 0;
            description = ''
              default HDMI encoding profile.

              Type: Int
            '';
          };
          defaultaudiocapture = mkOption {
            type = nullOr str;
            default = "default:";
            description = ''
              Default audio capture system.

              Type: String
            '';
          };
          defaultcapture = mkOption {
            type = nullOr (either str int);
            default = 0;
            description = ''
              Default video capture system.

              Type: Int
            '';
          };
          "detectedv4ldevices" = mkOption {
            type = nullOr (either str int);
            default = 0;
            description = ''
              Detected v4l devices.

              Type: UInt
            '';
          };
          "grab_capture_type" = mkOption {
            type = nullOr (either str int);
            default = 0;
            description = ''
              capture type.

              Type: Int
            '';
          };
          "grab_extension" = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              Default screen grab file extension.

              Type: String
            '';
          };
          "grab_follow_mouse" = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              follow mouse in region capture.

              Type: Bool
            '';
          };
          "grab_fps" = mkOption {
            type = nullOr (either str float);
            default = 15.0;
            description = ''
              fps for video rec.

              Type: Double
            '';
          };
          "grab_height" = mkOption {
            type = nullOr (either str int);
            default = 720;
            description = ''
              default height for video capture.

              Type: Int
            '';
          };
          "grab_hide_frame" = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Hide frame around capture zone.

              Type: Bool
            '';
          };
          "grab_hide_mouse" = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Hide mouse cursor.

              Type: Bool
            '';
          };
          "grab_offsetx" = mkOption {
            type = nullOr (either str int);
            default = 0;
            description = ''
              x offset for video capture.

              Type: Int
            '';
          };
          "grab_offsety" = mkOption {
            type = nullOr (either str int);
            default = 0;
            description = ''
              y offset for video capture.

              Type: Int
            '';
          };
          "grab_parameters" = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              Default video4linux format.

              Type: String
            '';
          };
          "grab_profile" = mkOption {
            type = nullOr (either str int);
            default = 0;
            description = ''
              default screen grab encoding profile.

              Type: Int
            '';
          };
          "grab_width" = mkOption {
            type = nullOr (either str int);
            default = 1280;
            description = ''
              default width for video capture.

              Type: Int
            '';
          };
          "v4l_alsadevice" = mkOption {
            type = nullOr (either str int);
            default = "";
            description = ''
              Audio device for v4l capture.

              Type: Int
            '';
          };
          "v4l_alsadevicename" = mkOption {
            type = nullOr str;
            default = "default";
            description = ''
              Audio device for v4l capture.

              Type: String
            '';
          };
          "v4l_captureaudio" = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Should we also capture audio.

              Type: Bool
            '';
          };
          "v4l_capturevideo" = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Should we capture video.

              Type: Bool
            '';
          };
          "v4l_extension" = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              Default video4linux file extension.

              Type: String
            '';
          };
          "v4l_format" = mkOption {
            type = nullOr (either str int);
            default = 0;
            description = ''
              Selected capture format.

              Type: UInt
            '';
          };
          "v4l_parameters" = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              Default video4linux format.

              Type: String
            '';
          };
          "v4l_profile" = mkOption {
            type = nullOr (either str int);
            default = 0;
            description = ''
              default v4l encoding profile.

              Type: Int
            '';
          };
          "video4vdevice" = mkOption {
            type = nullOr str;
            default = "/dev/video0";
            description = ''
              Default video4linux capture format.

              Type: String
            '';
          };
        };
      };
      default = {};
      description = "capture";
    };    
    "drag_value" = with types; mkOption {
      type = submodule {
        options = { 
          "dragvalue_directupdate" = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              ...

              Type: Bool
            '';
          };
          "dragvalue_mode" = mkOption {
            type = nullOr (either str int);
            default = 0;
            description = ''
              ...

              Type: Int
            '';
          };
        };
      };
      default = {};
      description = "drag_value";
    };    
    "effects" = with types; mkOption {
      type = submodule {
        options = { 
          "lock_ratio" = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Lock size ratio in effects.

              Type: Bool
            '';
          };
        };
      };
      default = {};
      description = "effects";
    };    
    "env" = with types; mkOption {
      type = submodule {
        options = { 
          capturefolder = mkOption {
            type = nullOr str;
            default = "$HOME";
            description = ''
              Default folder for captured files.

              Type: Path
            '';
          };
          capturetoprojectfolder = mkOption {
            type = nullOr (either str int);
            default = 1;
            description = ''
              Save captured files to project folder by default.

              Type: Int
            '';
          };
          currenttmpfolder = mkOption {
            type = nullOr str;
            default = "/tmp/";
            description = ''
              Default folder for tmp files.

              Type: Path
            '';
          };
          customprojectfolder = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Don't use default XDG folders to store project files.

              Type: Bool
            '';
          };
          defaultaudioapp = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              Default audio editing application name.

              Type: String
            '';
          };
          defaultimageapp = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              Default image editing application.

              Type: String
            '';
          };
          defaultprojectfolder = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              Default folder for project files.

              Type: Path
            '';
          };
          encodethreads = mkOption {
            type = nullOr (either str int);
            default = 0;
            description = ''
              FFmpeg encoding thread count.

              Type: Int
            '';
          };
          exportGuidesFormat = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              Default format for guides export

              Type: String
            '';
          };
          ffmpegpath = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              FFmpeg / Libav binary path.

              Type: Path
            '';
          };
          ffplaypath = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              FFplay / avplay binary path.

              Type: Path
            '';
          };
          ffprobepath = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              FFprobe / avprobe binary path.

              Type: Path
            '';
          };
          glaxnimatePath = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              Path to the Glaxnimate application.

              Type: String
            '';
          };
          lastCacheCheck = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              Kdenlive will check every 2 weeks on startup if the cached data exceeds the defined maxcachesize. This is the last checked date

              Type: DateTime
            '';
          };
          libraryfolder = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              Default folder for library.

              Type: Path
            '';
          };
          librarytodefaultfolder = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Open Library in default system folder.

              Type: Bool
            '';
          };
          maxcachesize = mkOption {
            type = nullOr (either str int);
            default = 1024;
            description = ''
              Kdenlive will periodically check if the cached data exceeds this limit. Data is in Mb

              Type: Int
            '';
          };
          mediainfopath = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              mediaInfo binary path.

              Type: Path
            '';
          };
          mltpath = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              Mlt framework install path.

              Type: Path
            '';
          };
          multipleguidesinterval = mkOption {
            type = nullOr (either str float);
            default = 30.0;
            description = ''
              Default interval to insert multiple guides

              Type: Double
            '';
          };
          "nice_tasks" = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Use lower CPU priority for proxy and transcode tasks

              Type: Bool
            '';
          };
          processingthreads = mkOption {
            type = nullOr (either str int);
            default = 4;
            description = ''
              Processing thread count.

              Type: Int
            '';
          };
          proxythreads = mkOption {
            type = nullOr (either str int);
            default = 2;
            description = ''
              Proxy creation processing thread count.

              Type: Int
            '';
          };
          rendererpath = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              Mlt melt renderer install path.

              Type: Path
            '';
          };
          sameprojectfolder = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Use the parent folder of the *.kdenlive file to store project files.

              Type: Bool
            '';
          };
          videofolder = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              Default folder for various stored files, like titles, scripted rendering.

              Type: Path
            '';
          };
          videotodefaultfolder = mkOption {
            type = nullOr (either str int);
            default = 0;
            description = ''
              Save titles, scripted renderings in default system folder.

              Type: Int
            '';
          };
        };
      };
      default = {};
      description = "env";
    };    
    "jobs" = with types; mkOption {
      type = submodule {
        options = { 
          scenesplitmarkers = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Add markers on Scene split.

              Type: Bool
            '';
          };
          scenesplitsubclips = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Add subclips on Scene split.

              Type: Bool
            '';
          };
          scenesplitthreshold = mkOption {
            type = nullOr (either str int);
            default = 30;
            description = ''
              Scene split detection threshold.

              Type: Int
            '';
          };
        };
      };
      default = {};
      description = "jobs";
    };    
    "misc" = with types; mkOption {
      type = submodule {
        options = { 
          autoimagesequence = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Automatically import image sequences.

              Type: Bool
            '';
          };
          automultistreams = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Automatically import all streams in multi streams clips.

              Type: Bool
            '';
          };
          checkfirstprojectclip = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Check if document profile is same as first imported clip.

              Type: Bool
            '';
          };
          cleanCacheMonths = mkOption {
            type = nullOr (either str int);
            default = 6;
            description = ''
              Number of months to discard cache data.

              Type: Int
            '';
          };
          "color_duration" = mkOption {
            type = nullOr str;
            default = "00:00:05:00";
            description = ''
              Default color clip duration.

              Type: String
            '';
          };
          crashrecovery = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Enable autosave.

              Type: Bool
            '';
          };
          "disable_effect_parameters" = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Disable parameters when the effect is disabled.

              Type: Bool
            '';
          };
          disableimagescaling = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Add a filter to disable default image scaling.

              Type: Bool
            '';
          };
          "exportframe_usingsourceres" = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Export image using source resolution.

              Type: Bool
            '';
          };
          "fade_duration" = mkOption {
            type = nullOr str;
            default = "00:00:03:00";
            description = ''
              Default image sequence frame duration.

              Type: String
            '';
          };
          ignoresubdirstructure = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Ignore the subfolder structure (all clips in subfolders are added to the toplevel folder)

              Type: Bool
            '';
          };
          "image_duration" = mkOption {
            type = nullOr str;
            default = "00:00:05:00";
            description = ''
              Default image clip duration.

              Type: String
            '';
          };
          "mix_duration" = mkOption {
            type = nullOr str;
            default = "00:00:01:00";
            description = ''
              Default mix transition duration.

              Type: String
            '';
          };
          "opengl_backend" = mkOption {
            type = nullOr (either str int);
            default = 16;
            description = ''
              Default OpenGL backend (Qt::AAUseOpenGLES).

              Type: Int
            '';
          };
          openlastproject = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Open last project on startup.

              Type: Bool
            '';
          };
          "profile_fps_filter" = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              Default fps filter for project profile.

              Type: String
            '';
          };
          "profile_scanning_filter" = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              Default scanning filter for project profile.

              Type: String
            '';
          };
          "sequence_duration" = mkOption {
            type = nullOr str;
            default = "00:00:00:01";
            description = ''
              Default image sequence frame duration.

              Type: String
            '';
          };
          "subtitle_duration" = mkOption {
            type = nullOr str;
            default = "00:00:05:00";
            description = ''
              Default subtitle duration.

              Type: String
            '';
          };
          tabposition = mkOption {
            type = nullOr (either str int);
            default = 1;
            description = ''
              Select tab position in dockwidgets.

              Type: Int
            '';
          };
          "title_duration" = mkOption {
            type = nullOr str;
            default = "00:00:05:00";
            description = ''
              Default title clip duration.

              Type: String
            '';
          };
          "transition_duration" = mkOption {
            type = nullOr str;
            default = "00:00:03:00";
            description = ''
              Default transition duration.

              Type: String
            '';
          };
          "use_exiftool" = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Get h264 metadata using exiftool.

              Type: Bool
            '';
          };
          "use_magicLantern" = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Get h264 metadata using exiftool.

              Type: Bool
            '';
          };
        };
      };
      default = {};
      description = "misc";
    };    
    "project" = with types; mkOption {
      type = submodule {
        options = { 
          "audio_channels" = mkOption {
            type = nullOr (either str int);
            default = 0;
            description = ''
              Default number of audio channels per track.

              Type: Int
            '';
          };
          audiotracks = mkOption {
            type = nullOr (either str int);
            default = 2;
            description = ''
              Default number of audio tracks.

              Type: Int
            '';
          };
          enableproxy = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Enable proxy clips.

              Type: Bool
            '';
          };
          enforceLowerTrackCompositing = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Should the lower video track also be composited.

              Type: Bool
            '';
          };
          externalProxyProfile = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              Pattern to find external proxy clips.

              Type: String
            '';
          };
          "external_proxy_profile" = mkOption {
            type = nullOr (either str int);
            default = "";
            description = ''
              index for the external proxy clips combo.

              Type: Int
            '';
          };
          externalproxy = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Enable proxy clips.

              Type: Bool
            '';
          };
          generateimageproxy = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Auto generate proxy for new image clips.

              Type: Bool
            '';
          };
          generateproxy = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Auto generate proxy for new clips.

              Type: Bool
            '';
          };
          nvScalingEnabled = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Enables nvenc hw accel scaling.

              Type: Bool
            '';
          };
          nvencEnabled = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Enables nvenc hw accel in encoders.

              Type: Bool
            '';
          };
          parallelrender = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Enable parallel processing for rendering.

              Type: Bool
            '';
          };
          "preview_profile" = mkOption {
            type = nullOr (either str int);
            default = 0;
            description = ''
              default preview encoding profile.

              Type: Int
            '';
          };
          previewextension = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              File extension for timeline preview.

              Type: String
            '';
          };
          previewparams = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              Timeline preview encoding parameters.

              Type: String
            '';
          };
          "proxy_profile" = mkOption {
            type = nullOr (either str int);
            default = 0;
            description = ''
              default proxy encoding profile.

              Type: Int
            '';
          };
          proxyextension = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              File extension for proxy clips.

              Type: String
            '';
          };
          proxyimageminsize = mkOption {
            type = nullOr (either str int);
            default = 2000;
            description = ''
              Minimum source size for proxy creation.

              Type: Int
            '';
          };
          proxyimagesize = mkOption {
            type = nullOr (either str int);
            default = 800;
            description = ''
              Rescale size for image proxy creation.

              Type: Int
            '';
          };
          proxyminsize = mkOption {
            type = nullOr (either str int);
            default = 1000;
            description = ''
              Minimum source size for proxy creation.

              Type: Int
            '';
          };
          proxyparams = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              Proxy clips transcoding parameters.

              Type: String
            '';
          };
          proxyscale = mkOption {
            type = nullOr (either str int);
            default = 640;
            description = ''
              Default frame width for proxy clips.

              Type: Int
            '';
          };
          showRenderTextParameters = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Show render preset parameters as editable text.

              Type: Bool
            '';
          };
          transcodeFriendly = mkOption {
            type = nullOr str;
            default = "Lossy x264 I frame only";
            description = ''
              Name of the default transcoding profile for edit friendly convert.

              Type: String
            '';
          };
          vaapiEnabled = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Enables vaapi hw accel in encoders.

              Type: Bool
            '';
          };
          vaapiScalingEnabled = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Enables scale_vaapi hw accel in encoders.

              Type: Bool
            '';
          };
          videotracks = mkOption {
            type = nullOr (either str int);
            default = 2;
            description = ''
              Default number of video tracks.

              Type: Int
            '';
          };
        };
      };
      default = {};
      description = "project";
    };    
    "sdl" = with types; mkOption {
      type = submodule {
        options = { 
          "audio_backend" = mkOption {
            type = nullOr (either str int);
            default = 0;
            description = ''
              Audio backend index used for sound output.

              Type: Int
            '';
          };
          "audio_device" = mkOption {
            type = nullOr (either str int);
            default = "";
            description = ''
              Audio device for SDL output.

              Type: Int
            '';
          };
          "audio_driver" = mkOption {
            type = nullOr (either str int);
            default = 0;
            description = ''
              SDL Audio driver used for sound output.

              Type: UInt
            '';
          };
          "audio_scrub" = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Enable Audio Scrubbing

              Type: Bool
            '';
          };
          audiobackend = mkOption {
            type = nullOr str;
            default = "sdl2_audio";
            description = ''
              Audio backend used for sound output.

              Type: String
            '';
          };
          audiodevicename = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              SDL Audio device used for sound output.

              Type: String
            '';
          };
          audiodrivername = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              Audio driver used for sound output.

              Type: String
            '';
          };
          "blackmagic_output_device" = mkOption {
            type = nullOr (either str int);
            default = 0;
            description = ''
              Blackmagic video output device.

              Type: Int
            '';
          };
          compositingList = mkOption {
            type = nullOr (either str (listOf str));
            default = "frei0r.cairoblend,qtblend";
            description = ''
              The allowed compositions for track compositing (sorted by preference).

              Type: StringList
            '';
          };
          disablereccountdown = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Disable countdown before starting audio record.

              Type: Bool
            '';
          };
          "external_display" = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Use Blackmagic device for video out.

              Type: Bool
            '';
          };
          "fullscreen_monitor" = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              Monitor used for fullscreen output.

              Type: String
            '';
          };
          "gpu_accel" = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Use Movit for GPU accelerated display and effects.

              Type: Bool
            '';
          };
          "monitor_background" = mkOption {
            type = nullOr str;
            default = "black";
            description = ''
              Background color for clip monitor (only visible with transparent clips).

              Type: String
            '';
          };
          "monitor_dropframes" = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Allow framedropping in monitor playback.

              Type: Bool
            '';
          };
          "monitor_gamma" = mkOption {
            type = nullOr (either str int);
            default = 1;
            description = ''
              Monitor gamma (rbg / rec 709).

              Type: Int
            '';
          };
          "monitor_progressive" = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Should we deinterlace monitor preview.

              Type: Bool
            '';
          };
          preferredcomposite = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              The preferred composition for track compositing.

              Type: String
            '';
          };
          sdlAudioBackend = mkOption {
            type = nullOr str;
            default = "sdl2_audio";
            description = ''
              Detected audio backed.

              Type: String
            '';
          };
          videodrivername = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              Video driver used for output.

              Type: String
            '';
          };
          volume = mkOption {
            type = nullOr (either str int);
            default = 100;
            description = ''
              Volume used for SDL output.

              Type: Int
            '';
          };
          "window_background" = mkOption {
            type = nullOr str;
            default = "#535353";
            description = ''
              Background color for OpenGL monitor.

              Type: Color
            '';
          };
        };
      };
      default = {};
      description = "sdl";
    };    
    "shuttle" = with types; mkOption {
      type = submodule {
        options = { 
          enableshuttle = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Enable jog shuttle device.

              Type: Bool
            '';
          };
          shuttlebuttons = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              JogShuttle button to actions mappings.

              Type: String
            '';
          };
          shuttledevice = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              Path to shuttle device.

              Type: String
            '';
          };
          shuttledevicenames = mkOption {
            type = nullOr (either str (listOf str));
            default = "";
            description = ''
              Available shuttle device names.

              Type: StringList
            '';
          };
          shuttledevicepaths = mkOption {
            type = nullOr (either str (listOf str));
            default = "";
            description = ''
              Available shuttle device paths.

              Type: StringList
            '';
          };
        };
      };
      default = {};
      description = "shuttle";
    };    
    "speech" = with types; mkOption {
      type = submodule {
        options = { 
          "speech_zone" = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Last selected model for automatic subtitling

              Type: Bool
            '';
          };
          "vosk_folder_path" = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              Custom path for the folder containins the vosk speech models. Uses default XDG location if empty

              Type: String
            '';
          };
          "vosk_srt_model" = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              Last selected model for automatic subtitling

              Type: String
            '';
          };
          "vosk_text_model" = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              Last selected model for speech recognition

              Type: String
            '';
          };
        };
      };
      default = {};
      description = "speech";
    };    
    "timeline" = with types; mkOption {
      type = submodule {
        options = { 
          audiothumbnails = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Display audio thumbnails in timeline.

              Type: Bool
            '';
          };
          audiotracksbelow = mkOption {
            type = nullOr (either str int);
            default = 1;
            description = ''
              Display audio tracks grouped below video tracks.

              Type: Int
            '';
          };
          autopreview = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Automatically regenerate dirty zones of timeline preview.

              Type: Bool
            '';
          };
          autoscroll = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Auto scroll timeline while playing.

              Type: Bool
            '';
          };
          defaultkeyframeinterp = mkOption {
            type = nullOr (either str int);
            default = 1;
            description = ''
              Default interpolation for keyframes.

              Type: Int
            '';
          };
          displayallchannels = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Display all channels in audio thumbnails.

              Type: Bool
            '';
          };
          headerwidth = mkOption {
            type = nullOr (either str int);
            default = 0;
            description = ''
              Default width for timeline track headers.

              Type: Int
            '';
          };
          jumptostart = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Jump to timeline start if playback is started on last frame in timeline.

              Type: Bool
            '';
          };
          multistream = mkOption {
            type = nullOr (either str int);
            default = 0;
            description = ''
              Should we enable all audio streams by default.

              Type: Int
            '';
          };
          "multistream_checktrack" = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Check if project has enough tracks on multi stream clips, and propose to add new tracks.

              Type: Bool
            '';
          };
          normalizechannels = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Normalize audio channels in thumbnails.

              Type: Bool
            '';
          };
          pauseonseek = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Pause playback when seeking.

              Type: Bool
            '';
          };
          proxypreview = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Use proxy clips for preview rendering.

              Type: Bool
            '';
          };
          raisepropsclips = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Raise property pane when selecting timeline clips.

              Type: Bool
            '';
          };
          raisepropstracks = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Raise property pane when selecting timeline tracks.

              Type: Bool
            '';
          };
          raisepropstransitions = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Raise property pane when selecting timeline transitions.

              Type: Bool
            '';
          };
          scrollvertically = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Scroll vertically with scroll wheel, horizontally with Shift + scroll wheel

              Type: Bool
            '';
          };
          seekonaddeffect = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Seek to clip when adding an effect.

              Type: Bool
            '';
          };
          showmarkers = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Display clip markers comments in timeline.

              Type: Bool
            '';
          };
          timelinechunks = mkOption {
            type = nullOr (either str int);
            default = 25;
            description = ''
              Default size of video chunks for timeline preview.

              Type: Int
            '';
          };
          trackheight = mkOption {
            type = nullOr (either str int);
            default = 0;
            description = ''
              Tracks height in pixel.

              Type: Int
            '';
          };
          videothumbnails = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Display video thumbnails in timeline.

              Type: Bool
            '';
          };
        };
      };
      default = {};
      description = "timeline";
    };    
    "titles" = with types; mkOption {
      type = submodule {
        options = { 
          "selected_template" = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              Name of last selected title template

              Type: String
            '';
          };
          titleGuideColor = mkOption {
            type = nullOr str;
            default = "#ff0000";
            description = ''
              color titler guides.

              Type: Color
            '';
          };
          titlerAlign = mkOption {
            type = nullOr (either str int);
            default = 0;
            description = ''
              Default text align for titler.

              Type: Int
            '';
          };
          titlerHGuides = mkOption {
            type = nullOr (either str int);
            default = 2;
            description = ''
              Number of horizontal guides in titler.

              Type: Int
            '';
          };
          titlerShowGuides = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Show guides in titler.

              Type: Bool
            '';
          };
          titlerShowbg = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Show titler background.

              Type: Bool
            '';
          };
          titlerVGuides = mkOption {
            type = nullOr (either str int);
            default = 3;
            description = ''
              Number of vertical guides in titler.

              Type: Int
            '';
          };
          titlerbg = mkOption {
            type = nullOr (either str int);
            default = 0;
            description = ''
              Default background for titler.

              Type: Int
            '';
          };
        };
      };
      default = {};
      description = "titles";
    };    
    "unmanaged" = with types; mkOption {
      type = submodule {
        options = { 
          "add_new_clip" = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Add task clips to project after processing.

              Type: Bool
            '';
          };
          "add_new_clip_to_folder" = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Add task clips in a specific folder after processing.

              Type: Bool
            '';
          };
          alwaysShowMonitorAudio = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Always display audio thumbs in clip monitor.

              Type: Bool
            '';
          };
          "analyse_stopmotion" = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Send stopmotion frames to scopes for live analysis.

              Type: Bool
            '';
          };
          autoKeyframe = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Automatically create a new keyframe on keyframe move.

              Type: Bool
            '';
          };
          autoaudiodrivername = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              Audio driver selected automatically.

              Type: String
            '';
          };
          captureinterval = mkOption {
            type = nullOr (either str int);
            default = 5;
            description = ''
              Interval between each capture (in seconds).

              Type: Int
            '';
          };
          clipMonitorOverlayGuides = mkOption {
            type = nullOr (either str int);
            default = 0;
            description = ''
              index of current guides overlay for clip monitor.

              Type: Int
            '';
          };
          colorclipcolor = mkOption {
            type = nullOr str;
            default = "#000000";
            description = ''
              Color to preselect in the color clip dialog.

              Type: Color
            '';
          };
          consumerslist = mkOption {
            type = nullOr (either str (listOf str));
            default = "";
            description = ''
              Detected MLT consumers.

              Type: StringList
            '';
          };
          "default_marker_type" = mkOption {
            type = nullOr (either str int);
            default = 0;
            description = ''
              Default category for newly created clip markers.

              Type: Int
            '';
          };
          "default_profile" = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              Default project format.

              Type: String
            '';
          };
          defaultrescaleheight = mkOption {
            type = nullOr (either str int);
            default = 240;
            description = ''
              default width for rendering rescale.

              Type: Int
            '';
          };
          defaultrescalewidth = mkOption {
            type = nullOr (either str int);
            default = 320;
            description = ''
              default width for rendering rescale.

              Type: Int
            '';
          };
          displayAudioOverlay = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Show audio overlay info on monitor.

              Type: Bool
            '';
          };
          displayClipMonitorInfo = mkOption {
            type = nullOr (either str int);
            default = "0x15";
            description = ''
              Show overlay info on monitor (in / out points, markers,...).

              Type: Int
            '';
          };
          displayProjectMonitorInfo = mkOption {
            type = nullOr (either str int);
            default = "0x05";
            description = ''
              Show overlay info on monitor (in / out points, markers,...).

              Type: Int
            '';
          };
          "enable_recording_preview" = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Should we display video frames while capturing.

              Type: Bool
            '';
          };
          enableaudiospectrum = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Send frames to audiospectrum scope for live analysis.

              Type: Bool
            '';
          };
          "favorite_effects" = mkOption {
            type = nullOr (either str (listOf str));
            default = "volume,lift_gamma_gain,qtblend";
            description = ''
              List of favorite effects ids.

              Type: StringList
            '';
          };
          "favorite_transitions" = mkOption {
            type = nullOr (either str (listOf str));
            default = "wipe,qtblend";
            description = ''
              List of favorite transitions ids.

              Type: StringList
            '';
          };
          "force_breeze" = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Force breeze icon theme for consistent look.

              Type: Bool
            '';
          };
          frametimecode = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Show timecodes as frame number instead of hh:mm:ss:ff.

              Type: Bool
            '';
          };
          guidesCategories = mkOption {
            type = nullOr (either str (listOf str));
            default = "";
            description = ''
              The default guide categories.

              Type: StringList
            '';
          };
          keyframeseek = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              When editing an effect with position, seek to the keyframe pos.

              Type: Bool
            '';
          };
          lockedGuides = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Lock guides on spacer movements (insert/remove space).

              Type: Bool
            '';
          };
          mixerCollapse = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Collapse audio mixer (only show master channel).

              Type: Bool
            '';
          };
          mltdeinterlacer = mkOption {
            type = nullOr str;
            default = "onefield";
            description = ''
              Name of the chosen deinterlacer.

              Type: String
            '';
          };
          mltinterpolation = mkOption {
            type = nullOr str;
            default = "nearest";
            description = ''
              Name of the chosen interpol method.

              Type: String
            '';
          };
          "monitor_audio" = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Display audio levels.

              Type: Bool
            '';
          };
          monitoraudio = mkOption {
            type = nullOr (either str int);
            default = "0x07";
            description = ''
              Show monitor's audio level widget.

              Type: Int
            '';
          };
          "monitorscene_directupdate" = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Update parameters while monitor scene changes.

              Type: Bool
            '';
          };
          "onmonitoreffects_cornersshowcontrols" = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Show additional controls in the c0rners on-monitor widget.

              Type: Bool
            '';
          };
          "onmonitoreffects_cornersshowlines" = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Connect the corners in the widget for the c0rners effect with lines.

              Type: Bool
            '';
          };
          "onmonitoreffects_geometryshowpath" = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Show keyframe path in monitor.

              Type: Bool
            '';
          };
          "onmonitoreffects_geometryshowprevious" = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Show previous keyframe in monitor.

              Type: Bool
            '';
          };
          overlayColor = mkOption {
            type = nullOr str;
            default = "#00ffff";
            description = ''
              Color to draw the monitor overlay guides.

              Type: Color
            '';
          };
          previewScaling = mkOption {
            type = nullOr (either str int);
            default = 1;
            description = ''
              Divide monitor resolution by this factor to speedup preview.

              Type: Int
            '';
          };
          producerslist = mkOption {
            type = nullOr (either str (listOf str));
            default = "";
            description = ''
              List of available MLT producers.

              Type: StringList
            '';
          };
          projectMonitorOverlayGuides = mkOption {
            type = nullOr (either str int);
            default = 0;
            description = ''
              index of current guides overlay for project monitor.

              Type: Int
            '';
          };
          "project_fps" = mkOption {
            type = nullOr (either str float);
            default = 25.0;
            description = ''
              Current project fps.

              Type: Double
            '';
          };
          "projectloading_avformatnovalidate" = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Do not validate the video files when loading a project for the sake of speed.

              Type: Bool
            '';
          };
          "properties_panel_page" = mkOption {
            type = nullOr (either str int);
            default = 0;
            description = ''
              Currently displayed page in properties panel

              Type: Int
            '';
          };
          rectimecode = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Show recorded timecode in clip monitor, in format hh:mm:ss:ff.

              Type: Bool
            '';
          };
          renderProfile = mkOption {
            type = nullOr str;
            default = "MP4-H264/AAC";
            description = ''
              Default render profile.

              Type: String
            '';
          };
          rescalekeepratio = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Keep aspect ratio in render dialog rescale widget.

              Type: Bool
            '';
          };
          "selected_effecttab" = mkOption {
            type = nullOr (either str int);
            default = 0;
            description = ''
              Last opened tab in effects list.

              Type: Int
            '';
          };
          showOnMonitorScene = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Show on monitor adjustable effect parameter (geometry, ..).

              Type: Bool
            '';
          };
          showSubtitles = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Show subtitle track.

              Type: Bool
            '';
          };
          showbuiltstack = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Show builtin effect stack.

              Type: Bool
            '';
          };
          showdatecolumn = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Show dates in project tree view.

              Type: Bool
            '';
          };
          showdescriptioncolumn = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Show descriptions in project tree view.

              Type: Bool
            '';
          };
          showeffectinfo = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Show small effect description in effects list.

              Type: Bool
            '';
          };
          showratingcolumn = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Show ratings in project tree view.

              Type: Bool
            '';
          };
          showslideshowthumbs = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Show thumbnails in slideshow dialog.

              Type: Bool
            '';
          };
          showstopmotionthumbs = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Show sequence thumbnails in stopmotion widget.

              Type: Bool
            '';
          };
          showtitlebars = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Show dock widget titlebars to allow un/docking.

              Type: Bool
            '';
          };
          slideshowbymime = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              True if slideshow default method is MIME type.

              Type: Bool
            '';
          };
          slideshowmimeextension = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              The default image extension for slideshows.

              Type: String
            '';
          };
          "sm_framesplayback" = mkOption {
            type = nullOr (either str int);
            default = 10;
            description = ''
              Number of frames to play back in stop motion playback.

              Type: Int
            '';
          };
          "sm_loop" = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Should we loop in stop motion playback.

              Type: Bool
            '';
          };
          "sm_notifytime" = mkOption {
            type = nullOr (either str int);
            default = 3;
            description = ''
              Seconds before triggering a capture notification.

              Type: Int
            '';
          };
          "sm_playsound" = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Should we play a sound to notify of captured frame in stop motion.

              Type: Bool
            '';
          };
          "sm_prenotify" = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Send a notification a few seconds before capture.

              Type: Bool
            '';
          };
          snaptopoints = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Snap movements to clips, guides and markers.

              Type: Bool
            '';
          };
          stopmotioneffect = mkOption {
            type = nullOr (either str int);
            default = 0;
            description = ''
              Effect applied to stopmotion frame overlay.

              Type: Int
            '';
          };
          tagsintimeline = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Show color tags in timeline.

              Type: Bool
            '';
          };
          "thumbColor1" = mkOption {
            type = nullOr str;
            default = "#2ac1a0";
            description = ''
              Color to draw even audio channels.

              Type: Color
            '';
          };
          "thumbColor2" = mkOption {
            type = nullOr str;
            default = "#2ed172";
            description = ''
              Color to draw odd audio channels.

              Type: Color
            '';
          };
          transitionfollowcursor = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              When editing a composite transition, move timeline cursor for better preview.

              Type: Bool
            '';
          };
          "use_dark_breeze" = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Force breeze icon color theme for consistent look.

              Type: Bool
            '';
          };
          "validated_luts" = mkOption {
            type = nullOr (either str (listOf str));
            default = "";
            description = ''
              The paths of lut files that have been validated.

              Type: StringList
            '';
          };
          widgetstyle = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              Name of the chosen widget style.

              Type: String
            '';
          };
        };
      };
      default = {};
      description = "unmanaged";
    };    
  };
  config = mkIf (cfg.enable && moduleCfg.enable) {
    home.packages = mkIf moduleCfg.package [ moduleCfg.package ];
    programs.plasma.files."kdenliverc" = removeAttrs moduleCfg [ "enable" "package" ];
  };
}
