{ config, lib, pkgs, ... }:
with lib;
let
  cfg = config.programs.plasma;
  moduleCfg = config.programs.plasma.touchpad;
in {
  options.programs.plasma.touchpad = {
    enable = mkEnableOption ''
      Enable touchpad
    '';
    package = mkOption {
      default = if (pkgs ? touchpad) then
                        pkgs.touchpad
                      else
                        (if pkgs.libsForQt5 ? touchpad then pkgs.libsForQt5.touchpad else false);
      defaultText = literalExpression "pkgs.touchpad";
      type = with types; either bool package;
      description = mdDoc "Package to use.";
    };
    "autodisable" = with types; mkOption {
      type = submodule {
        options = { 
          DisableOnKeyboardActivity = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          DisableWhenMousePluggedIn = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          KeyboardActivityTimeoutMs = mkOption {
            type = nullOr (either str int);
            default = 250;
            description = ''
              

              Type: Int
              Min: 0
              Max: 10000
            '';
          };
          MouseBlacklist = mkOption {
            type = nullOr (either str (listOf str));
            default = "TPPS/2 IBM TrackPoint,USB Trackpoint pointing device,DualPoint Stick,ThinkPad USB Keyboard with TrackPoint";
            description = ''
              

              Type: StringList
            '';
          };
          OnlyDisableTapAndScrollOnKeyboardActivity = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
        };
      };
      default = {};
      description = "autodisable";
    };    
    "parameters" = with types; mkOption {
      type = submodule {
        options = { 
          "$(TapAction)Button" = mkOption {
            type = nullOr (either str (enum [ 
              "NoButton"
              "LeftButton"
              "MiddleButton"
              "RightButton"
            ]));
            default = null;
            defaultText = ''
                systemDefaultEnum("RBCornerButton", NoButton)
            '';
            description = ''
              

              Type: Enum
              Choices: 
                - NoButton: No action
                - LeftButton: Left button
                - MiddleButton: Middle button
                - RightButton: Right button
            '';
          };
          AccelFactor = mkOption {
            type = nullOr (either str float);
            default = null;
            defaultText = ''
                systemDefault("AccelFactor", 0.0)
            '';
            description = ''
              

              Type: Double
              Min: 0
              Max: 1
            '';
          };
          CircScrollDelta = mkOption {
            type = nullOr (either str float);
            default = null;
            defaultText = ''
                systemDefault("CircScrollDelta", 10.0)
            '';
            description = ''
              

              Type: Double
              Min: 0
              Max: 45
            '';
          };
          CircScrollTrigger = mkOption {
            type = nullOr (either str (enum [ 
              "AllEdges"
              "TopEdge"
              "TopRightCorner"
              "RightEdge"
              "BottomRightCorner"
              "BottomEdge"
              "BottomLeftCorner"
              "LeftEdge"
              "TopLeftCorner"
            ]));
            default = null;
            defaultText = ''
                systemDefaultEnum("CircScrollTrigger", AllEdges)
            '';
            description = ''
              

              Type: Enum
              Choices: 
                - AllEdges: All edges
                - TopEdge: Top edge
                - TopRightCorner: Top right corner
                - RightEdge: Right edge
                - BottomRightCorner: Bottom right corner
                - BottomEdge: Bottom edge
                - BottomLeftCorner: Bottom left corner
                - LeftEdge: Left edge
                - TopLeftCorner: Top left corner
            '';
          };
          CircularScrolling = mkOption {
            type = nullOr (either str bool);
            default = null;
            defaultText = ''
                systemDefault("CircularScrolling", false)
            '';
            description = ''
              

              Type: Bool
            '';
          };
          Coasting = mkOption {
            type = nullOr (either str bool);
            default = null;
            defaultText = ''
                systemDefault("Coasting", true)
            '';
            description = ''
              

              Type: Bool
            '';
          };
          CoastingFriction = mkOption {
            type = nullOr (either str float);
            default = null;
            defaultText = ''
                systemDefault("CoastingFriction", 50.0)
            '';
            description = ''
              

              Type: Double
              Min: 0
              Max: 255
            '';
          };
          CoastingSpeed = mkOption {
            type = nullOr (either str float);
            default = null;
            defaultText = ''
                systemDefault("CoastingSpeed", 20.0)
            '';
            description = ''
              

              Type: Double
              Min: 0.1
              Max: 255
            '';
          };
          CornerCoasting = mkOption {
            type = nullOr (either str bool);
            default = null;
            defaultText = ''
                systemDefault("CornerCoasting", false)
            '';
            description = ''
              

              Type: Bool
            '';
          };
          FingerHigh = mkOption {
            type = nullOr (either str int);
            default = null;
            defaultText = ''
                systemDefault("FingerHigh", 30)
            '';
            description = ''
              

              Type: Int
              Min: 0
              Max: 255
            '';
          };
          FingerLow = mkOption {
            type = nullOr (either str int);
            default = null;
            defaultText = ''
                systemDefault("FingerLow", 25)
            '';
            description = ''
              

              Type: Int
              Min: 0
              Max: 255
            '';
          };
          HorizEdgeScroll = mkOption {
            type = nullOr (either str bool);
            default = null;
            defaultText = ''
                systemDefault("HorizEdgeScroll", true)
            '';
            description = ''
              

              Type: Bool
            '';
          };
          HorizHysteresis = mkOption {
            type = nullOr (either str int);
            default = null;
            defaultText = ''
                systemDefault("HorizHysteresis", 0)
            '';
            description = ''
              

              Type: Int
              Min: 0
              Max: 100
            '';
          };
          HorizScrollDelta = mkOption {
            type = nullOr (either str float);
            default = null;
            defaultText = ''
                systemDefault("HorizScrollDelta", 1.0)
            '';
            description = ''
              

              Type: Double
              Min: 0
              Max: 1000
            '';
          };
          HorizTwoFingerScroll = mkOption {
            type = nullOr (either str bool);
            default = null;
            defaultText = ''
                systemDefault("HorizTwoFingerScroll", true)
            '';
            description = ''
              

              Type: Bool
            '';
          };
          InvertHorizScroll = mkOption {
            type = nullOr (either str bool);
            default = null;
            defaultText = ''
                systemDefault("InvertHorizScroll", false)
            '';
            description = ''
              

              Type: Bool
            '';
          };
          InvertVertScroll = mkOption {
            type = nullOr (either str bool);
            default = null;
            defaultText = ''
                systemDefault("InvertVertScroll", false)
            '';
            description = ''
              

              Type: Bool
            '';
          };
          LockedDragTimeout = mkOption {
            type = nullOr (either str int);
            default = null;
            defaultText = ''
                systemDefault("LockedDragTimeout", 5000)
            '';
            description = ''
              

              Type: Int
              Min: 0
              Max: 30000
            '';
          };
          LockedDrags = mkOption {
            type = nullOr (either str bool);
            default = null;
            defaultText = ''
                systemDefault("LockedDrags", false)
            '';
            description = ''
              

              Type: Bool
            '';
          };
          MaxDoubleTapTime = mkOption {
            type = nullOr (either str int);
            default = null;
            defaultText = ''
                systemDefault("MaxDoubleTapTime", 180)
            '';
            description = ''
              

              Type: Int
              Min: 0
              Max: 1000
            '';
          };
          MaxSpeed = mkOption {
            type = nullOr (either str float);
            default = null;
            defaultText = ''
                systemDefault("MaxSpeed", 255.0)
            '';
            description = ''
              

              Type: Double
              Min: 0
              Max: 255
            '';
          };
          MaxTapMove = mkOption {
            type = nullOr (either str float);
            default = null;
            defaultText = ''
                systemDefault("MaxTapMove", 2.0)
            '';
            description = ''
              

              Type: Double
              Min: 0
              Max: 1000
            '';
          };
          MaxTapTime = mkOption {
            type = nullOr (either str int);
            default = null;
            defaultText = ''
                systemDefault("MaxTapTime", 180)
            '';
            description = ''
              

              Type: Int
              Min: 0
              Max: 1000
            '';
          };
          MinSpeed = mkOption {
            type = nullOr (either str float);
            default = null;
            defaultText = ''
                systemDefault("MinSpeed", 0.0)
            '';
            description = ''
              

              Type: Double
              Min: 0
              Max: 255
            '';
          };
          PalmDetect = mkOption {
            type = nullOr (either str bool);
            default = null;
            defaultText = ''
                systemDefault("PalmDetect", false)
            '';
            description = ''
              

              Type: Bool
            '';
          };
          PalmMinWidth = mkOption {
            type = nullOr (either str int);
            default = null;
            defaultText = ''
                systemDefault("PalmMinWidth", 10)
            '';
            description = ''
              

              Type: Int
              Min: 0
              Max: 15
            '';
          };
          PalmMinZ = mkOption {
            type = nullOr (either str int);
            default = null;
            defaultText = ''
                systemDefault("PalmMinZ", 200)
            '';
            description = ''
              

              Type: Int
              Min: 0
              Max: 255
            '';
          };
          PressureMotionMaxFactor = mkOption {
            type = nullOr (either str float);
            default = null;
            defaultText = ''
                systemDefault("PressureMotionMaxFactor", 1.0)
            '';
            description = ''
              

              Type: Double
              Min: 0
              Max: 10
            '';
          };
          PressureMotionMaxZ = mkOption {
            type = nullOr (either str int);
            default = null;
            defaultText = ''
                systemDefault("PressureMotionMaxZ", 160)
            '';
            description = ''
              

              Type: Int
              Min: 1
              Max: 255
            '';
          };
          PressureMotionMinFactor = mkOption {
            type = nullOr (either str float);
            default = null;
            defaultText = ''
                systemDefault("PressureMotionMinFactor", 1.0)
            '';
            description = ''
              

              Type: Double
              Min: 0
              Max: 10
            '';
          };
          PressureMotionMinZ = mkOption {
            type = nullOr (either str int);
            default = null;
            defaultText = ''
                systemDefault("PressureMotionMinZ", 30)
            '';
            description = ''
              

              Type: Int
              Min: 1
              Max: 255
            '';
          };
          SingleTapTimeout = mkOption {
            type = nullOr (either str int);
            default = null;
            defaultText = ''
                systemDefault("SingleTapTimeout", 180)
            '';
            description = ''
              

              Type: Int
              Min: 0
              Max: 1000
            '';
          };
          TapAndDragGesture = mkOption {
            type = nullOr (either str bool);
            default = null;
            defaultText = ''
                systemDefault("TapAndDragGesture", true)
            '';
            description = ''
              

              Type: Bool
            '';
          };
          Tapping = mkOption {
            type = nullOr (either str bool);
            default = null;
            defaultText = ''
                systemDefault("Tapping", true)
            '';
            description = ''
              

              Type: Bool
            '';
          };
          VertEdgeScroll = mkOption {
            type = nullOr (either str bool);
            default = null;
            defaultText = ''
                systemDefault("VertEdgeScroll", true)
            '';
            description = ''
              

              Type: Bool
            '';
          };
          VertHysteresis = mkOption {
            type = nullOr (either str int);
            default = null;
            defaultText = ''
                systemDefault("VertHysteresis", 0)
            '';
            description = ''
              

              Type: Int
              Min: 0
              Max: 100
            '';
          };
          VertScrollDelta = mkOption {
            type = nullOr (either str float);
            default = null;
            defaultText = ''
                systemDefault("VertScrollDelta", 1.0)
            '';
            description = ''
              

              Type: Double
              Min: 0
              Max: 1000
            '';
          };
          VertTwoFingerScroll = mkOption {
            type = nullOr (either str bool);
            default = null;
            defaultText = ''
                systemDefault("VertTwoFingerScroll", true)
            '';
            description = ''
              

              Type: Bool
            '';
          };
        };
      };
      default = {};
      description = "parameters";
    };    
  };
  config = mkIf (cfg.enable && moduleCfg.enable) {
    home.packages = mkIf (moduleCfg.package != false) [ moduleCfg.package ];
    programs.plasma.files."touchpadrc" = removeAttrs moduleCfg [ "enable" "package" ];
  };
}
