{ config, lib, ... }:
with lib;
let cfg = config.programs.plasma;
in {
  options.programs.plasma.plasma-desktop = { 
    "Bell" = with types; mkOption {
      type = submodule {
        options = { 
          ArtsBell = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Customize system bell

              Type: Bool
            '';
          };
          ArtsBellFile = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              Sound file for the Bell

              Type: String
            '';
          };
          SystemBell = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Use System Bell

              Type: Bool
            '';
          };
          VisibleBell = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Use a visual bell instead of a sound

              Type: Bool
            '';
          };
          VisibleBellColor = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              Color of the Visible Bell

              Type: Color
            '';
          };
          VisibleBellInvert = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Invert the system colors on the bell

              Type: Bool
            '';
          };
          VisibleBellPause = mkOption {
            type = nullOr (either str int);
            default = 500;
            description = ''
              Duration of the Visible Bell

              Type: Int
            '';
          };
        };
      };
      default = {};
      description = "Bell";
    };    
    "Keyboard" = with types; mkOption {
      type = submodule {
        options = { 
          GestureConfirmation = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Ask for Confirmation for a gesture

              Type: Bool
            '';
          };
          Gestures = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Use Gestures

              Type: Bool
            '';
          };
          kNotifyAccess = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Confirm access to the Keyboard

              Type: Bool
            '';
          };
        };
      };
      default = {};
      description = "Keyboard";
    };    
    "Mouse" = with types; mkOption {
      type = submodule {
        options = { 
          MKCurve = mkOption {
            type = nullOr (either str int);
            default = 0;
            description = ''
              Mouse Key Curve

              Type: Int
            '';
          };
          MKDelay = mkOption {
            type = nullOr (either str int);
            default = 160;
            description = ''
              Delay for the mouse movement

              Type: Int
            '';
          };
          MKInterval = mkOption {
            type = nullOr (either str int);
            default = 40;
            description = ''
              Repetition interval for the mouse movement

              Type: Int
            '';
          };
          MKMaxSpeed = mkOption {
            type = nullOr (either str int);
            default = 30;
            description = ''
              Maximum Velocity

              Type: Int
            '';
          };
          MKTimeToMax = mkOption {
            type = nullOr (either str int);
            default = 30;
            description = ''
              Time to hit maximum velocity

              Type: Int
            '';
          };
          MouseKeys = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Use keys to control the mouse

              Type: Bool
            '';
          };
        };
      };
      default = {};
      description = "Mouse";
    };    
    "QtQuickRendererSettings" = with types; mkOption {
      type = submodule {
        options = { 
          ForceGlCoreProfile = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          RenderLoop = mkOption {
            type = nullOr (either str (enum [ 
              "automaticloop"
              "basic"
              "threaded"
            ]));
            default = "automaticloop";
            description = ''
              

              Type: Enum
              Choices: 
                - automaticloop
                - basic
                - threaded
            '';
          };
          SceneGraphBackend = mkOption {
            type = nullOr (either str (enum [ 
              "automaticbackend"
              "opengl"
              "software"
            ]));
            default = "automaticbackend";
            description = ''
              

              Type: Enum
              Choices: 
                - automaticbackend
                - opengl
                - software
            '';
          };
        };
      };
      default = {};
      description = "QtQuickRendererSettings";
    };    
    "ScreenReader" = with types; mkOption {
      type = submodule {
        options = { 
          Enabled = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Enable Screen Reader

              Type: Bool
            '';
          };
        };
      };
      default = {};
      description = "ScreenReader";
    };    
  };
  config = mkIf cfg.enable {
    programs.plasma.files."kaccessrc" = cfg.plasma-desktop;
  };
}
