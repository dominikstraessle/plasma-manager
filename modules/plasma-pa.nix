{ config, lib, ... }:
with lib;
let
  cfg = config.programs.plasma;
  moduleCfg = config.programs.plasma.plasma-pa;
in {
  options.programs.plasma.plasma-pa = {
    enable = mkEnableOption ''
      Enable plasma-pa
    '';
    package = mkOption {
      default = if (pkgs ? plasma-pa) then
                        pkgs.plasma-pa
                      else
                        (if pkgs.libsForQt5 ? plasma-pa then pkgs.libsForQt5.plasma-pa else false);
      defaultText = literalExpression "pkgs.plasma-pa";
      type = either bool types.package;
      description = mdDoc "Package to use.";
    };
    "General" = with types; mkOption {
      type = submodule {
        options = { 
          AudioFeedback = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Play audio feedback when changing volume.

              Type: Bool
            '';
          };
          DefaultOutputDeviceOsd = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Show OSD when changing default output device.

              Type: Bool
            '';
          };
          GlobalMute = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Mute all audio.

              Type: Bool
            '';
          };
          GlobalMuteDevices = mkOption {
            type = nullOr (either str (listOf str));
            default = "";
            description = ''
              Devices that were not muted with global mute, and will remain muted afterwards.

              Type: StringList
            '';
          };
          MicrophoneSensitivityOsd = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Show OSD when changing microphone sensitivity.

              Type: Bool
            '';
          };
          MuteOsd = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Show OSD when muting/unmuting.

              Type: Bool
            '';
          };
          RaiseMaximumVolume = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Allow raising volume over 100%.

              Type: Bool
            '';
          };
          VolumeOsd = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Show OSD when changing volume.

              Type: Bool
            '';
          };
          VolumeStep = mkOption {
            type = nullOr (either str int);
            default = 5;
            description = ''
              Percent step for changing volume.

              Type: Int
            '';
          };
          currentTab = mkOption {
            type = nullOr str;
            default = "devices";
            description = ''
              Currently shown tab (devices, streams)

              Type: String
            '';
          };
          globalMute = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          globalMuteDevices = mkOption {
            type = nullOr (either str (listOf str));
            default = "";
            description = ''
              Devices that were not muted with global mute, and will remain muted afterwards.

              Type: StringList
            '';
          };
          micOsd = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Whether to show a popup when microphone volume changes

              Type: Bool
            '';
          };
          migrated = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          muteOsd = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Whether to show a popup when mute state changes

              Type: Bool
            '';
          };
          outputChangeOsd = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Whether to show a popup when the default output device changes (e.g. plugging in a headset)

              Type: Bool
            '';
          };
          raiseMaximumVolume = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          showVirtualDevices = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          volumeFeedback = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          volumeOsd = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Whether to show a popup when the volume changes

              Type: Bool
            '';
          };
          volumeStep = mkOption {
            type = nullOr (either str int);
            default = 5;
            description = ''
              

              Type: Int
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
    programs.plasma.files."plasma-parc" = removeAttrs moduleCfg [ "enable" "package" ];
  };
}
