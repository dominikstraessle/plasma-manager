{ config, lib, ... }:
with lib;
let cfg = config.programs.plasma;
in {
  options.programs.plasma.kwin = { 
    "Compositing" = with types; mkOption {
      type = submodule {
        options = { 
          Backend = mkOption {
            type = nullOr str;
            default = "OpenGL";
            description = ''
              

              Type: String
            '';
          };
          Enabled = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          LastFailureTimestamp = mkOption {
            type = nullOr (either str int);
            default = 0;
            description = ''
              

              Type: Int
            '';
          };
          GLTextureFilter = mkOption {
            type = nullOr (either str int);
            default = 2;
            description = ''
              

              Type: Int
              Min: -1
              Max: 2
            '';
          };
          GLStrictBinding = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          GLLegacy = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          HiddenPreviews = mkOption {
            type = nullOr (either str int);
            default = 5;
            description = ''
              

              Type: Int
              Min: 4
              Max: 6
            '';
          };
          GLPlatformInterface = mkOption {
            type = nullOr str;
            default = "glx";
            description = ''
              

              Type: String
            '';
          };
          WindowsBlockCompositing = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          LatencyPolicy = mkOption {
            type = nullOr (either str (enum [ 
              "LatencyExtremelyLow"
              "LatencyLow"
              "LatencyMedium"
              "LatencyHigh"
              "LatencyExtremelyHigh"
            ]));
            default = "LatencyMedium";
            description = ''
              

              Type: Enum
              Choices: 
                - LatencyExtremelyLow
                - LatencyLow
                - LatencyMedium
                - LatencyHigh
                - LatencyExtremelyHigh
            '';
          };
          RenderTimeEstimator = mkOption {
            type = nullOr (either str (enum [ 
              "RenderTimeEstimatorMinimum"
              "RenderTimeEstimatorMaximum"
              "RenderTimeEstimatorAverage"
            ]));
            default = "RenderTimeEstimatorMaximum";
            description = ''
              

              Type: Enum
              Choices: 
                - RenderTimeEstimatorMinimum
                - RenderTimeEstimatorMaximum
                - RenderTimeEstimatorAverage
            '';
          };
          AllowTearing = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
        };
      };
      default = {};
      description = "Compositing";
    };    
    "ElectricBorders" = with types; mkOption {
      type = submodule {
        options = { 
          Top = mkOption {
            type = nullOr str;
            default = "None";
            description = ''
              

              Type: String
            '';
          };
          TopRight = mkOption {
            type = nullOr str;
            default = "None";
            description = ''
              

              Type: String
            '';
          };
          Right = mkOption {
            type = nullOr str;
            default = "None";
            description = ''
              

              Type: String
            '';
          };
          BottomRight = mkOption {
            type = nullOr str;
            default = "None";
            description = ''
              

              Type: String
            '';
          };
          Bottom = mkOption {
            type = nullOr str;
            default = "None";
            description = ''
              

              Type: String
            '';
          };
          BottomLeft = mkOption {
            type = nullOr str;
            default = "None";
            description = ''
              

              Type: String
            '';
          };
          Left = mkOption {
            type = nullOr str;
            default = "None";
            description = ''
              

              Type: String
            '';
          };
          TopLeft = mkOption {
            type = nullOr str;
            default = "None";
            description = ''
              

              Type: String
            '';
          };
        };
      };
      default = {};
      description = "ElectricBorders";
    };    
    "KDE" = with types; mkOption {
      type = submodule {
        options = { 
          AnimationDurationFactor = mkOption {
            type = nullOr (either str float);
            default = 1.0;
            description = ''
              

              Type: Double
              Min: 0
            '';
          };
        };
      };
      default = {};
      description = "KDE";
    };    
    "MouseBindings" = with types; mkOption {
      type = submodule {
        options = { 
          CommandTitlebarWheel = mkOption {
            type = nullOr str;
            default = "Nothing";
            description = ''
              

              Type: String
            '';
          };
          CommandAllKey = mkOption {
            type = nullOr str;
            default = "Meta";
            description = ''
              

              Type: String
            '';
          };
          CommandAllWheel = mkOption {
            type = nullOr str;
            default = "Nothing";
            description = ''
              

              Type: String
            '';
          };
          CommandActiveTitlebar1 = mkOption {
            type = nullOr str;
            default = "Raise";
            description = ''
              

              Type: String
            '';
          };
          CommandActiveTitlebar2 = mkOption {
            type = nullOr str;
            default = "Nothing";
            description = ''
              

              Type: String
            '';
          };
          CommandActiveTitlebar3 = mkOption {
            type = nullOr str;
            default = "Operations menu";
            description = ''
              

              Type: String
            '';
          };
          CommandInactiveTitlebar1 = mkOption {
            type = nullOr str;
            default = "Activate and raise";
            description = ''
              

              Type: String
            '';
          };
          CommandInactiveTitlebar2 = mkOption {
            type = nullOr str;
            default = "Nothing";
            description = ''
              

              Type: String
            '';
          };
          CommandInactiveTitlebar3 = mkOption {
            type = nullOr str;
            default = "Operations menu";
            description = ''
              

              Type: String
            '';
          };
          CommandWindow1 = mkOption {
            type = nullOr str;
            default = "Activate, raise and pass click";
            description = ''
              

              Type: String
            '';
          };
          CommandWindow2 = mkOption {
            type = nullOr str;
            default = "Activate and pass click";
            description = ''
              

              Type: String
            '';
          };
          CommandWindow3 = mkOption {
            type = nullOr str;
            default = "Activate and pass click";
            description = ''
              

              Type: String
            '';
          };
          CommandWindowWheel = mkOption {
            type = nullOr str;
            default = "Scroll";
            description = ''
              

              Type: String
            '';
          };
          CommandAll1 = mkOption {
            type = nullOr str;
            default = "Move";
            description = ''
              

              Type: String
            '';
          };
          CommandAll2 = mkOption {
            type = nullOr str;
            default = "Toggle raise and lower";
            description = ''
              

              Type: String
            '';
          };
          CommandAll3 = mkOption {
            type = nullOr str;
            default = "Resize";
            description = ''
              

              Type: String
            '';
          };
        };
      };
      default = {};
      description = "MouseBindings";
    };    
    "ScreenEdges" = with types; mkOption {
      type = submodule {
        options = { 
          RemainActiveOnFullscreen = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
        };
      };
      default = {};
      description = "ScreenEdges";
    };    
    "TabBox" = with types; mkOption {
      type = submodule {
        options = { 
          ShowDelay = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          DelayTime = mkOption {
            type = nullOr (either str int);
            default = 90;
            description = ''
              

              Type: Int
            '';
          };
          DesktopMode = mkOption {
            type = nullOr (either str int);
            default = 1;
            description = ''
              

              Type: UInt
            '';
          };
          ActivitiesMode = mkOption {
            type = nullOr (either str int);
            default = 1;
            description = ''
              

              Type: UInt
            '';
          };
          ApplicationsMode = mkOption {
            type = nullOr (either str int);
            default = 0;
            description = ''
              

              Type: UInt
            '';
          };
          MinimizedMode = mkOption {
            type = nullOr (either str int);
            default = 0;
            description = ''
              

              Type: UInt
            '';
          };
          ShowDesktopMode = mkOption {
            type = nullOr (either str int);
            default = 0;
            description = ''
              

              Type: UInt
            '';
          };
          MultiScreenMode = mkOption {
            type = nullOr (either str int);
            default = 0;
            description = ''
              

              Type: UInt
            '';
          };
          SwitchingMode = mkOption {
            type = nullOr (either str int);
            default = 0;
            description = ''
              

              Type: UInt
            '';
          };
          ShowOutline = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          ShowTabBox = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          HighlightWindows = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          LayoutName = mkOption {
            type = nullOr str;
            default = "thumbnails";
            description = ''
              

              Type: String
            '';
          };
          MoveMinimizedWindowsToEndOfTabBoxFocusChain = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
        };
      };
      default = {};
      description = "TabBox";
    };    
    "Wayland" = with types; mkOption {
      type = submodule {
        options = { 
          InputMethod = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              

              Type: Path
            '';
          };
          DoubleTapWakeup = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          EnablePrimarySelection = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
        };
      };
      default = {};
      description = "Wayland";
    };    
    "Windows" = with types; mkOption {
      type = submodule {
        options = { 
          CondensedTitle = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          FocusPolicy = mkOption {
            type = nullOr (either str (enum [ 
              "ClickToFocus"
              "FocusFollowsMouse"
              "FocusUnderMouse"
              "FocusStrictlyUnderMouse"
            ]));
            default = "Options::ClickToFocus";
            description = ''
              

              Type: Enum
              Choices: 
                - ClickToFocus
                - FocusFollowsMouse
                - FocusUnderMouse
                - FocusStrictlyUnderMouse
            '';
          };
          NextFocusPrefersMouse = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          SeparateScreenFocus = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          ActiveMouseScreen = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          RollOverDesktops = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          FocusStealingPreventionLevel = mkOption {
            type = nullOr (either str int);
            default = 1;
            description = ''
              

              Type: Int
              Min: 0
              Max: 4
            '';
          };
          Placement = mkOption {
            type = nullOr (either str (enum [ 
              "PlacementNone"
              "PlacementDefault"
              "PlacementUnknown"
              "PlacementRandom"
              "PlacementSmart"
              "PlacementCentered"
              "PlacementZeroCornered"
              "PlacementUnderMouse"
              "PlacementOnMainWindow"
              "PlacementMaximizing"
            ]));
            default = "[] {
                #if KWIN_BUILD_DECORATIONS
                    return PlacementCentered;
                #else
                    return PlacementMaximizing;
                #endif
            }()";
            description = ''
              

              Type: Enum
              Choices: 
                - PlacementNone
                - PlacementDefault
                - PlacementUnknown
                - PlacementRandom
                - PlacementSmart
                - PlacementCentered
                - PlacementZeroCornered
                - PlacementUnderMouse
                - PlacementOnMainWindow
                - PlacementMaximizing
            '';
          };
          ActivationDesktopPolicy = mkOption {
            type = nullOr (either str (enum [ 
              "SwitchToOtherDesktop"
              "BringToCurrentDesktop"
            ]));
            default = "KWin::Options::ActivationDesktopPolicy::SwitchToOtherDesktop";
            description = ''
              

              Type: Enum
              Choices: 
                - SwitchToOtherDesktop
                - BringToCurrentDesktop
            '';
          };
          AutoRaise = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          AutoRaiseInterval = mkOption {
            type = nullOr (either str int);
            default = 750;
            description = ''
              

              Type: Int
            '';
          };
          DelayFocusInterval = mkOption {
            type = nullOr (either str int);
            default = 300;
            description = ''
              

              Type: Int
            '';
          };
          ShadeHover = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          ShadeHoverInterval = mkOption {
            type = nullOr (either str int);
            default = 250;
            description = ''
              

              Type: Int
            '';
          };
          ClickRaise = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          BorderSnapZone = mkOption {
            type = nullOr (either str int);
            default = 10;
            description = ''
              

              Type: Int
            '';
          };
          WindowSnapZone = mkOption {
            type = nullOr (either str int);
            default = 10;
            description = ''
              

              Type: Int
            '';
          };
          CenterSnapZone = mkOption {
            type = nullOr (either str int);
            default = 0;
            description = ''
              

              Type: Int
            '';
          };
          SnapOnlyWhenOverlapping = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          ElectricBorders = mkOption {
            type = nullOr (either str int);
            default = 0;
            description = ''
              

              Type: Int
            '';
          };
          ElectricBorderDelay = mkOption {
            type = nullOr (either str int);
            default = 150;
            description = ''
              

              Type: Int
            '';
          };
          ElectricBorderCooldown = mkOption {
            type = nullOr (either str int);
            default = 350;
            description = ''
              

              Type: Int
            '';
          };
          ElectricBorderPushbackPixels = mkOption {
            type = nullOr (either str int);
            default = 1;
            description = ''
              

              Type: Int
            '';
          };
          ElectricBorderMaximize = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          ElectricBorderTiling = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          ElectricBorderCornerRatio = mkOption {
            type = nullOr (either str float);
            default = 0.25;
            description = ''
              

              Type: Double
              Min: 0.0
              Max: 1.0
            '';
          };
          TitlebarDoubleClickCommand = mkOption {
            type = nullOr str;
            default = "Maximize";
            description = ''
              

              Type: String
            '';
          };
          MaximizeButtonLeftClickCommand = mkOption {
            type = nullOr str;
            default = "Maximize";
            description = ''
              

              Type: String
            '';
          };
          MaximizeButtonMiddleClickCommand = mkOption {
            type = nullOr str;
            default = "Maximize (vertical only)";
            description = ''
              

              Type: String
            '';
          };
          MaximizeButtonRightClickCommand = mkOption {
            type = nullOr str;
            default = "Maximize (horizontal only)";
            description = ''
              

              Type: String
            '';
          };
          KillPingTimeout = mkOption {
            type = nullOr (either str int);
            default = 5000;
            description = ''
              

              Type: Int
            '';
          };
          HideUtilityWindowsForInactive = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          InactiveTabsSkipTaskbar = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          AutogroupSimilarWindows = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          AutogroupInForeground = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          BorderlessMaximizedWindows = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
        };
      };
      default = {};
      description = "Windows";
    };    
    "Xwayland" = with types; mkOption {
      type = submodule {
        options = { 
          XwaylandCrashPolicy = mkOption {
            type = nullOr (either str (enum [ 
              "Stop"
              "Restart"
            ]));
            default = "XwaylandCrashPolicy::Restart";
            description = ''
              

              Type: Enum
              Choices: 
                - Stop
                - Restart
            '';
          };
          XwaylandMaxCrashCount = mkOption {
            type = nullOr (either str int);
            default = 3;
            description = ''
              

              Type: UInt
            '';
          };
          XwaylandEavesdrops = mkOption {
            type = nullOr (either str (enum [ 
              "None"
              "Modifiers"
              "Combinations"
              "All"
            ]));
            default = "None";
            description = ''
              

              Type: Enum
              Choices: 
                - None
                - Modifiers
                - Combinations
                - All
            '';
          };
        };
      };
      default = {};
      description = "Xwayland";
    };    
  };
  config = mkIf cfg.enable {
    programs.plasma.files."kwinrc" = cfg.kwin;
  };
}
