{ config, lib, pkgs, ... }:
with lib;
let
  cfg = config.programs.plasma;
  moduleCfg = config.programs.plasma.kmix;
in {
  options.programs.plasma.kmix = {
    enable = mkEnableOption ''
      Enable kmix
    '';
    package = mkOption {
      default = if (pkgs ? kmix) then
                        pkgs.kmix
                      else
                        (if pkgs.libsForQt5 ? kmix then pkgs.libsForQt5.kmix else false);
      defaultText = literalExpression "pkgs.kmix";
      type = with types; either bool package;
      description = mdDoc "Package to use.";
    };
    "Debug" = with types; mkOption {
      type = submodule {
        options = { 
          DebugConfig = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          DebugControlManager = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          DebugGui = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          DebugVolume = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
        };
      };
      default = {};
      description = "Debug";
    };    
    "Global" = with types; mkOption {
      type = submodule {
        options = { 
          AllowDocking = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          AutoStart = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          AutoUseMultimediaKeys = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          Backends = mkOption {
            type = nullOr (either str (listOf str));
            default = "";
            description = ''
              

              Type: StringList
            '';
          };
          ConfigVersion = mkOption {
            type = nullOr (either str int);
            default = "";
            description = ''
              

              Type: Int
            '';
          };
          DefaultCardOnStart = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              

              Type: String
            '';
          };
          Labels = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          MasterMixer = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              

              Type: String
            '';
          };
          MasterMixerDevice = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              

              Type: String
            '';
          };
          Menubar = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          MixerIgnoreExpression = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              

              Type: String
            '';
          };
          MultiDriver = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          Orientation = mkOption {
            type = nullOr (either str int);
            default = "Qt::Vertical";
            description = ''
              

              Type: Int
            '';
          };
          OrientationTrayPopup = mkOption {
            type = nullOr (either str int);
            default = "Qt::Vertical";
            description = ''
              

              Type: Int
            '';
          };
          Position = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              

              Type: Point
            '';
          };
          Size = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              

              Type: Size
            '';
          };
          "Soundmenu.Mixers" = mkOption {
            type = nullOr (either str (listOf str));
            default = "";
            description = ''
              

              Type: StringList
            '';
          };
          Tickmarks = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          Visible = mkOption {
            type = nullOr (either str bool);
            default = "";
            description = ''
              

              Type: Bool
            '';
          };
          VolumeFeedback = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          VolumeOverdrive = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          VolumePercentageStep = mkOption {
            type = nullOr (either str int);
            default = 5;
            description = ''
              

              Type: Int
            '';
          };
          showOSD = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          startkdeRestore = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
        };
      };
      default = {};
      description = "Global";
    };    
    "Profiles" = with types; mkOption {
      type = submodule {
        options = { 
        };
      };
      default = {};
      description = "Profiles";
    };    
  };
  config = mkIf (cfg.enable && moduleCfg.enable) {
    home.packages = mkIf (moduleCfg.package != false) [ moduleCfg.package ];
    programs.plasma.files."kmixrc" = removeAttrs moduleCfg [ "enable" "package" ];
  };
}
