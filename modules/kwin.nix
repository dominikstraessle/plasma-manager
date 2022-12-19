{ config, lib, ... }:
with lib;
let cfg = config.programs.plasma;
in {
  options.programs.plasma.kwin = {
    "$(EffectGroup)" = with types;
      mkOption {
        type = submodule {
          options = {
            "TabBox" = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''


                Type: Bool
              '';
            };
            "TabBoxAlternative" = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''


                Type: Bool
              '';
            };
          };
        };
        default = { };
        description = "$(EffectGroup)";
      };
    "$(TabBoxGroup)" = with types;
      mkOption {
        type = submodule {
          options = {
            "ActivitiesMode" = mkOption {
              type = nullOr (either str int);
              default = "TabBoxConfig::defaultActivitiesMode()";
              defaultText = "Code: true";
              description = ''


                Type: Int
              '';
            };
            "ApplicationsMode" = mkOption {
              type = nullOr (either str int);
              default = "TabBoxConfig::defaultApplicationsMode()";
              defaultText = "Code: true";
              description = ''


                Type: Int
              '';
            };
            "DesktopMode" = mkOption {
              type = nullOr (either str int);
              default = "TabBoxConfig::defaultDesktopMode()";
              defaultText = "Code: true";
              description = ''


                Type: Int
              '';
            };
            "HighlightWindows" = mkOption {
              type = nullOr (either str bool);
              default = "TabBoxConfig::defaultHighlightWindow()";
              defaultText = "Code: true";
              description = ''


                Type: Bool
              '';
            };
            "LayoutName" = mkOption {
              type = nullOr str;
              default = "TabBoxConfig::defaultLayoutName()";
              defaultText = "Code: true";
              description = ''


                Type: String
              '';
            };
            "MinimizedMode" = mkOption {
              type = nullOr (either str int);
              default = "TabBoxConfig::defaultMinimizedMode()";
              defaultText = "Code: true";
              description = ''


                Type: Int
              '';
            };
            "MultiScreenMode" = mkOption {
              type = nullOr (either str int);
              default = "TabBoxConfig::defaultMultiScreenMode()";
              defaultText = "Code: true";
              description = ''


                Type: Int
              '';
            };
            "OrderMinimizedMode" = mkOption {
              type = nullOr (either str int);
              default = "TabBoxConfig::defaultOrderMinimizedMode()";
              defaultText = "Code: true";
              description = ''


                Type: Int
              '';
            };
            "ShowDesktopMode" = mkOption {
              type = nullOr (either str int);
              default = "TabBoxConfig::defaultShowDesktopMode()";
              defaultText = "Code: true";
              description = ''


                Type: Int
              '';
            };
            "ShowTabBox" = mkOption {
              type = nullOr (either str bool);
              default = "TabBoxConfig::defaultShowTabBox()";
              defaultText = "Code: true";
              description = ''


                Type: Bool
              '';
            };
            "SwitchingMode" = mkOption {
              type = nullOr (either str int);
              default = "TabBoxConfig::defaultSwitchingMode()";
              defaultText = "Code: true";
              description = ''


                Type: Int
              '';
            };
          };
        };
        default = { };
        description = "$(TabBoxGroup)";
      };
    "Compositing" = with types;
      mkOption {
        type = submodule {
          options = {
            AllowTearing = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''


                Type: Bool
              '';
            };
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
            GLLegacy = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''


                Type: Bool
              '';
            };
            GLPlatformInterface = mkOption {
              type = nullOr str;
              default = "glx";
              description = ''


                Type: String
              '';
            };
            GLStrictBinding = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''


                Type: Bool
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
            HiddenPreviews = mkOption {
              type = nullOr (either str int);
              default = 5;
              description = ''


                Type: Int
                Min: 4
                Max: 6
              '';
            };
            LastFailureTimestamp = mkOption {
              type = nullOr (either str int);
              default = 0;
              description = ''


                Type: Int
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
            WindowsBlockCompositing = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''


                Type: Bool
              '';
            };
          };
        };
        default = { };
        description = "Compositing";
      };
    "Effect-$(EffectName)" = with types;
      mkOption {
        type = submodule {
          options = {
            "BorderActivate" = mkOption {
              type = nullOr (either str (listOf int));
              default = "ElectricNone";
              description = ''


                Type: IntList
              '';
            };
            "TouchBorderActivate" = mkOption {
              type = nullOr (either str (listOf int));
              default = "ElectricNone";
              description = ''


                Type: IntList
              '';
            };
          };
        };
        default = { };
        description = "Effect-$(EffectName)";
      };
    "Effect-DesktopGrid" = with types;
      mkOption {
        type = submodule {
          options = {
            "BorderActivate" = mkOption {
              type = nullOr (either str (listOf int));
              default = "ElectricNone";
              description = ''


                Type: IntList
              '';
            };
          };
        };
        default = { };
        description = "Effect-DesktopGrid";
      };
    "Effect-Overview" = with types;
      mkOption {
        type = submodule {
          options = {
            "BorderActivate" = mkOption {
              type = nullOr (either str (listOf int));
              default = "ElectricNone";
              description = ''


                Type: IntList
              '';
            };
          };
        };
        default = { };
        description = "Effect-Overview";
      };
    "Effect-windowview" = with types;
      mkOption {
        type = submodule {
          options = {
            "BorderActivate" = mkOption {
              type = nullOr (either str (listOf int));
              default = "ElectricNone";
              description = ''


                Type: IntList
              '';
            };
            "BorderActivateAll" = mkOption {
              type = nullOr (either str (listOf int));
              default = "ElectricTopLeft";
              description = ''


                Type: IntList
              '';
            };
            "BorderActivateClass" = mkOption {
              type = nullOr (either str (listOf int));
              default = "ElectricNone";
              description = ''


                Type: IntList
              '';
            };
            "TouchBorderActivate" = mkOption {
              type = nullOr (either str (listOf int));
              default = "ElectricNone";
              description = ''


                Type: IntList
              '';
            };
            "TouchBorderActivateAll" = mkOption {
              type = nullOr (either str (listOf int));
              default = "ElectricNone";
              description = ''


                Type: IntList
              '';
            };
            "TouchBorderActivateClass" = mkOption {
              type = nullOr (either str (listOf int));
              default = "ElectricNone";
              description = ''


                Type: IntList
              '';
            };
          };
        };
        default = { };
        description = "Effect-windowview";
      };
    "ElectricBorders" = with types;
      mkOption {
        type = submodule {
          options = {
            "Bottom" = mkOption {
              type = nullOr str;
              default = "None";
              description = ''


                Type: String
              '';
            };
            "BottomLeft" = mkOption {
              type = nullOr str;
              default = "None";
              description = ''


                Type: String
              '';
            };
            "BottomRight" = mkOption {
              type = nullOr str;
              default = "None";
              description = ''


                Type: String
              '';
            };
            "Left" = mkOption {
              type = nullOr str;
              default = "None";
              description = ''


                Type: String
              '';
            };
            "Right" = mkOption {
              type = nullOr str;
              default = "None";
              description = ''


                Type: String
              '';
            };
            "Top" = mkOption {
              type = nullOr str;
              default = "None";
              description = ''


                Type: String
              '';
            };
            "TopLeft" = mkOption {
              type = nullOr str;
              default = "None";
              description = ''


                Type: String
              '';
            };
            "TopRight" = mkOption {
              type = nullOr str;
              default = "None";
              description = ''


                Type: String
              '';
            };
          };
        };
        default = { };
        description = "ElectricBorders";
      };
    "Input" = with types;
      mkOption {
        type = submodule {
          options = {
            "TabletMode" = mkOption {
              type = nullOr str;
              default = "auto";
              description = ''
                Automatically switch to touch-optimized mode

                Type: String
              '';
            };
          };
        };
        default = { };
        description = "Input";
      };
    "KDE" = with types;
      mkOption {
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
        default = { };
        description = "KDE";
      };
    "MouseBindings" = with types;
      mkOption {
        type = submodule {
          options = {
            "CommandActiveTitlebar1" = mkOption {
              type = nullOr (either str (enum [
                "Raise"
                "Lower"
                "ToggleRaiseAndLower"
                "Minimize"
                "Shade"
                "Close"
                "OperationsMenu"
                "Nothing"
              ]));
              default = "Raise";
              description = ''


                Type: Enum
                Choices: 
                  - Raise
                  - Lower
                  - ToggleRaiseAndLower
                  - Minimize
                  - Shade
                  - Close
                  - OperationsMenu
                  - Nothing
              '';
            };
            "CommandActiveTitlebar2" = mkOption {
              type = nullOr (either str (enum [
                "Raise"
                "Lower"
                "ToggleRaiseAndLower"
                "Minimize"
                "Shade"
                "Close"
                "OperationsMenu"
                "Nothing"
              ]));
              default = "Nothing";
              description = ''


                Type: Enum
                Choices: 
                  - Raise
                  - Lower
                  - ToggleRaiseAndLower
                  - Minimize
                  - Shade
                  - Close
                  - OperationsMenu
                  - Nothing
              '';
            };
            "CommandActiveTitlebar3" = mkOption {
              type = nullOr (either str (enum [
                "Raise"
                "Lower"
                "ToggleRaiseAndLower"
                "Minimize"
                "Shade"
                "Close"
                "OperationsMenu"
                "Nothing"
              ]));
              default = "OperationsMenu";
              description = ''


                Type: Enum
                Choices: 
                  - Raise
                  - Lower
                  - ToggleRaiseAndLower
                  - Minimize
                  - Shade
                  - Close
                  - OperationsMenu
                  - Nothing
              '';
            };
            "CommandAll1" = mkOption {
              type = nullOr (either str (enum [
                "Move"
                "ActivateRaiseAndMove"
                "ToggleRaiseAndLower"
                "Resize"
                "Raise"
                "Lower"
                "Minimize"
                "DecreaseOpacity"
                "IncreaseOpactiy"
                "Nothing"
              ]));
              default = "Move";
              description = ''


                Type: Enum
                Choices: 
                  - Move
                  - ActivateRaiseAndMove
                  - ToggleRaiseAndLower
                  - Resize
                  - Raise
                  - Lower
                  - Minimize
                  - DecreaseOpacity
                  - IncreaseOpactiy
                  - Nothing
              '';
            };
            "CommandAll2" = mkOption {
              type = nullOr (either str (enum [
                "Move"
                "ActivateRaiseAndMove"
                "ToggleRaiseAndLower"
                "Resize"
                "Raise"
                "Lower"
                "Minimize"
                "DecreaseOpacity"
                "IncreaseOpactiy"
                "Nothing"
              ]));
              default = "ToggleRaiseAndLower";
              description = ''


                Type: Enum
                Choices: 
                  - Move
                  - ActivateRaiseAndMove
                  - ToggleRaiseAndLower
                  - Resize
                  - Raise
                  - Lower
                  - Minimize
                  - DecreaseOpacity
                  - IncreaseOpactiy
                  - Nothing
              '';
            };
            "CommandAll3" = mkOption {
              type = nullOr (either str (enum [
                "Move"
                "ActivateRaiseAndMove"
                "ToggleRaiseAndLower"
                "Resize"
                "Raise"
                "Lower"
                "Minimize"
                "DecreaseOpacity"
                "IncreaseOpactiy"
                "Nothing"
              ]));
              default = "Resize";
              description = ''


                Type: Enum
                Choices: 
                  - Move
                  - ActivateRaiseAndMove
                  - ToggleRaiseAndLower
                  - Resize
                  - Raise
                  - Lower
                  - Minimize
                  - DecreaseOpacity
                  - IncreaseOpactiy
                  - Nothing
              '';
            };
            "CommandAllKey" = mkOption {
              type = nullOr (either str (enum [ "Meta" "Alt" ]));
              default = "Meta";
              description = ''


                Type: Enum
                Choices: 
                  - Meta
                  - Alt
              '';
            };
            "CommandAllWheel" = mkOption {
              type = nullOr (either str (enum [
                "RaiseLower"
                "ShadeUnshade"
                "MaxmizeRestore"
                "AboveBelow"
                "PreviousNextDesktop"
                "ChangeOpacity"
                "Nothing"
              ]));
              default = "Nothing";
              description = ''


                Type: Enum
                Choices: 
                  - RaiseLower
                  - ShadeUnshade
                  - MaxmizeRestore
                  - AboveBelow
                  - PreviousNextDesktop
                  - ChangeOpacity
                  - Nothing
              '';
            };
            "CommandInactiveTitlebar1" = mkOption {
              type = nullOr (either str (enum [
                "ActivateAndRaise"
                "ActivateAndLower"
                "Activate"
                "Raise"
                "Lower"
                "ToggleRaiseAndLower"
                "Minimize"
                "Shade"
                "Close"
                "OperationsMenu"
                "Nothing"
              ]));
              default = "ActivateAndRaise";
              description = ''


                Type: Enum
                Choices: 
                  - ActivateAndRaise
                  - ActivateAndLower
                  - Activate
                  - Raise
                  - Lower
                  - ToggleRaiseAndLower
                  - Minimize
                  - Shade
                  - Close
                  - OperationsMenu
                  - Nothing
              '';
            };
            "CommandInactiveTitlebar2" = mkOption {
              type = nullOr (either str (enum [
                "ActivateAndRaise"
                "ActivateAndLower"
                "Activate"
                "Raise"
                "Lower"
                "ToggleRaiseAndLower"
                "Minimize"
                "Shade"
                "Close"
                "OperationsMenu"
                "Nothing"
              ]));
              default = "Nothing";
              description = ''


                Type: Enum
                Choices: 
                  - ActivateAndRaise
                  - ActivateAndLower
                  - Activate
                  - Raise
                  - Lower
                  - ToggleRaiseAndLower
                  - Minimize
                  - Shade
                  - Close
                  - OperationsMenu
                  - Nothing
              '';
            };
            "CommandInactiveTitlebar3" = mkOption {
              type = nullOr (either str (enum [
                "ActivateAndRaise"
                "ActivateAndLower"
                "Activate"
                "Raise"
                "Lower"
                "ToggleRaiseAndLower"
                "Minimize"
                "Shade"
                "Close"
                "OperationsMenu"
                "Nothing"
              ]));
              default = "OperationsMenu";
              description = ''


                Type: Enum
                Choices: 
                  - ActivateAndRaise
                  - ActivateAndLower
                  - Activate
                  - Raise
                  - Lower
                  - ToggleRaiseAndLower
                  - Minimize
                  - Shade
                  - Close
                  - OperationsMenu
                  - Nothing
              '';
            };
            "CommandTitlebarWheel" = mkOption {
              type = nullOr (either str (enum [
                "RaiseLower"
                "ShadeUnshade"
                "MaxmizeRestore"
                "AboveBelow"
                "PreviousNextDesktop"
                "ChangeOpacity"
                "Nothing"
              ]));
              default = "Nothing";
              description = ''


                Type: Enum
                Choices: 
                  - RaiseLower
                  - ShadeUnshade
                  - MaxmizeRestore
                  - AboveBelow
                  - PreviousNextDesktop
                  - ChangeOpacity
                  - Nothing
              '';
            };
            "CommandWindow1" = mkOption {
              type = nullOr (either str (enum [
                "ActivateRaisePassClick"
                "ActivatePassClick"
                "Activate"
                "ActivateRaise"
              ]));
              default = "ActivateRaisePassClick";
              description = ''


                Type: Enum
                Choices: 
                  - ActivateRaisePassClick
                  - ActivatePassClick
                  - Activate
                  - ActivateRaise
              '';
            };
            "CommandWindow2" = mkOption {
              type = nullOr (either str (enum [
                "ActivateRaisePassClick"
                "ActivatePassClick"
                "Activate"
                "ActivateRaise"
              ]));
              default = "ActivatePassClick";
              description = ''


                Type: Enum
                Choices: 
                  - ActivateRaisePassClick
                  - ActivatePassClick
                  - Activate
                  - ActivateRaise
              '';
            };
            "CommandWindow3" = mkOption {
              type = nullOr (either str (enum [
                "ActivateRaisePassClick"
                "ActivatePassClick"
                "Activate"
                "ActivateRaise"
              ]));
              default = "ActivatePassClick";
              description = ''


                Type: Enum
                Choices: 
                  - ActivateRaisePassClick
                  - ActivatePassClick
                  - Activate
                  - ActivateRaise
              '';
            };
            "CommandWindowWheel" = mkOption {
              type = nullOr (either str
                (enum [ "Scroll" "ActivateScroll" "ActivateRaiseAndScroll" ]));
              default = "Scroll";
              description = ''


                Type: Enum
                Choices: 
                  - Scroll
                  - ActivateScroll
                  - ActivateRaiseAndScroll
              '';
            };
          };
        };
        default = { };
        description = "MouseBindings";
      };
    "NightColor" = with types;
      mkOption {
        type = submodule {
          options = {
            Active = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''


                Type: Bool
              '';
            };
            ActiveEnabled = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''


                Type: Bool
              '';
            };
            EveningBeginFixed = mkOption {
              type = nullOr str;
              default = "1800";
              description = ''


                Type: String
              '';
            };
            LatitudeAuto = mkOption {
              type = nullOr (either str float);
              default = 0.0;
              description = ''


                Type: Double
              '';
            };
            LatitudeFixed = mkOption {
              type = nullOr (either str float);
              default = 0.0;
              description = ''


                Type: Double
              '';
            };
            LocationEnabled = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''


                Type: Bool
              '';
            };
            LongitudeAuto = mkOption {
              type = nullOr (either str float);
              default = 0.0;
              description = ''


                Type: Double
              '';
            };
            LongitudeFixed = mkOption {
              type = nullOr (either str float);
              default = 0.0;
              description = ''


                Type: Double
              '';
            };
            Mode = mkOption {
              type = nullOr (either str
                (enum [ "Automatic" "Location" "Times" "Constant" ]));
              default = "Automatic";
              description = ''


                Type: Enum
                Choices: 
                  - Automatic
                  - Location
                  - Times
                  - Constant
              '';
            };
            ModeEnabled = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''


                Type: Bool
              '';
            };
            MorningBeginFixed = mkOption {
              type = nullOr str;
              default = "0600";
              description = ''


                Type: String
              '';
            };
            NightTemperature = mkOption {
              type = nullOr (either str int);
              default = 4500;
              description = ''


                Type: Int
                Min: 1000
                Max: 6500
              '';
            };
            NightTemperatureEnabled = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''


                Type: Bool
              '';
            };
            TransitionTime = mkOption {
              type = nullOr (either str int);
              default = 30;
              description = ''


                Type: Int
              '';
            };
          };
        };
        default = { };
        description = "NightColor";
      };
    "Plugins" = with types;
      mkOption {
        type = submodule {
          options = {
            "desktopchangeosdEnabled" = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''
                Display in an OSD the virtual desktop name when switching between virtual desktops

                Type: bool
              '';
            };
            "highlightwindowEnabled" = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''


                Type: Bool
              '';
            };
          };
        };
        default = { };
        description = "Plugins";
      };
    "ScreenEdges" = with types;
      mkOption {
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
        default = { };
        description = "ScreenEdges";
      };
    "Script-$(ScriptName)" = with types;
      mkOption {
        type = submodule {
          options = {
            "BorderActivate" = mkOption {
              type = nullOr (either str (listOf int));
              default = "ElectricNone";
              description = ''


                Type: IntList
              '';
            };
            "TouchBorderActivate" = mkOption {
              type = nullOr (either str (listOf int));
              default = "ElectricNone";
              description = ''


                Type: IntList
              '';
            };
          };
        };
        default = { };
        description = "Script-$(ScriptName)";
      };
    "Script-desktopchangeosd" = with types;
      mkOption {
        type = submodule {
          options = {
            "PopupHideDelay" = mkOption {
              type = nullOr (either str int);
              default = 1000;
              description = ''
                Duraton of the OSD

                Type: int
              '';
            };
            "TextOnly" = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''
                Whether or not to display desktop layout in the OSD

                Type: bool
              '';
            };
          };
        };
        default = { };
        description = "Script-desktopchangeosd";
      };
    "TabBox" = with types;
      mkOption {
        type = submodule {
          options = {
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
            "BorderActivate" = mkOption {
              type = nullOr (either str (listOf int));
              default = "ElectricNone";
              description = ''


                Type: IntList
              '';
            };
            "BorderAlternativeActivate" = mkOption {
              type = nullOr (either str (listOf int));
              default = "ElectricNone";
              description = ''


                Type: IntList
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
            MinimizedMode = mkOption {
              type = nullOr (either str int);
              default = 0;
              description = ''


                Type: UInt
              '';
            };
            MoveMinimizedWindowsToEndOfTabBoxFocusChain = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''


                Type: Bool
              '';
            };
            MultiScreenMode = mkOption {
              type = nullOr (either str int);
              default = 0;
              description = ''


                Type: UInt
              '';
            };
            ShowDelay = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''


                Type: Bool
              '';
            };
            ShowDesktopMode = mkOption {
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
            SwitchingMode = mkOption {
              type = nullOr (either str int);
              default = 0;
              description = ''


                Type: UInt
              '';
            };
            "TouchBorderActivate" = mkOption {
              type = nullOr (either str (listOf int));
              default = "ElectricNone";
              description = ''


                Type: IntList
              '';
            };
            "TouchBorderAlternativeActivate" = mkOption {
              type = nullOr (either str (listOf int));
              default = "ElectricNone";
              description = ''


                Type: IntList
              '';
            };
          };
        };
        default = { };
        description = "TabBox";
      };
    "TouchEdges" = with types;
      mkOption {
        type = submodule {
          options = {
            "Bottom" = mkOption {
              type = nullOr str;
              default = "None";
              description = ''


                Type: String
              '';
            };
            "Left" = mkOption {
              type = nullOr str;
              default = "None";
              description = ''


                Type: String
              '';
            };
            "Right" = mkOption {
              type = nullOr str;
              default = "None";
              description = ''


                Type: String
              '';
            };
            "Top" = mkOption {
              type = nullOr str;
              default = "None";
              description = ''


                Type: String
              '';
            };
          };
        };
        default = { };
        description = "TouchEdges";
      };
    "Wayland" = with types;
      mkOption {
        type = submodule {
          options = {
            DoubleTapWakeup = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''


                Type: Bool
              '';
            };
            "EnablePrimarySelection" = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''
                Enable middle click selection pasting

                Type: bool
              '';
            };
            InputMethod = mkOption {
              type = nullOr str;
              default = "";
              description = ''


                Type: Path
              '';
            };
          };
        };
        default = { };
        description = "Wayland";
      };
    "Windows" = with types;
      mkOption {
        type = submodule {
          options = {
            ActivationDesktopPolicy = mkOption {
              type = nullOr (either str
                (enum [ "SwitchToOtherDesktop" "BringToCurrentDesktop" ]));
              default =
                "KWin::Options::ActivationDesktopPolicy::SwitchToOtherDesktop";
              description = ''


                Type: Enum
                Choices: 
                  - SwitchToOtherDesktop
                  - BringToCurrentDesktop
              '';
            };
            "ActiveMouseScreen" = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''


                Type: Bool
              '';
            };
            "AutoRaise" = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''


                Type: Bool
              '';
            };
            "AutoRaiseInterval" = mkOption {
              type = nullOr (either str int);
              default = 750;
              description = ''


                Type: Int
                Min: 0
              '';
            };
            AutogroupInForeground = mkOption {
              type = nullOr (either str bool);
              default = true;
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
            "BorderSnapZone" = mkOption {
              type = nullOr (either str int);
              default = 10;
              description = ''


                Type: Int
                Min: 0
                Max: 100
              '';
            };
            BorderlessMaximizedWindows = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''


                Type: Bool
              '';
            };
            "CenterSnapZone" = mkOption {
              type = nullOr (either str int);
              default = 0;
              description = ''


                Type: Int
                Min: 0
                Max: 100
              '';
            };
            "ClickRaise" = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''


                Type: Bool
              '';
            };
            CondensedTitle = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''


                Type: Bool
              '';
            };
            "DelayFocusInterval" = mkOption {
              type = nullOr (either str int);
              default = 300;
              description = ''


                Type: Int
                Min: 0
              '';
            };
            "ElectricBorderCooldown" = mkOption {
              type = nullOr (either str int);
              default = 350;
              description = ''


                Type: Int
              '';
            };
            "ElectricBorderCornerRatio" = mkOption {
              type = nullOr (either str float);
              default = 0.25;
              description = ''


                Type: Double
              '';
            };
            "ElectricBorderDelay" = mkOption {
              type = nullOr (either str int);
              default = 150;
              description = ''


                Type: Int
              '';
            };
            "ElectricBorderMaximize" = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''


                Type: Bool
              '';
            };
            ElectricBorderPushbackPixels = mkOption {
              type = nullOr (either str int);
              default = 1;
              description = ''


                Type: Int
              '';
            };
            "ElectricBorderTiling" = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''


                Type: Bool
              '';
            };
            "ElectricBorders" = mkOption {
              type = nullOr (either str int);
              default = 0;
              description = ''


                Type: Int
              '';
            };
            "FocusPolicy" = mkOption {
              type = nullOr (either str (enum [
                "ClickToFocus"
                "FocusFollowsMouse"
                "FocusUnderMouse"
                "FocusStrictlyUnderMouse"
              ]));
              default = "ClickToFocus";
              description = ''


                Type: Enum
                Choices: 
                  - ClickToFocus
                  - FocusFollowsMouse
                  - FocusUnderMouse
                  - FocusStrictlyUnderMouse
              '';
            };
            "FocusStealingPreventionLevel" = mkOption {
              type = nullOr (either str int);
              default = 1;
              description = ''


                Type: Int
                Min: 0
                Max: 4
              '';
            };
            "HideUtilityWindowsForInactive" = mkOption {
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
            KillPingTimeout = mkOption {
              type = nullOr (either str int);
              default = 5000;
              description = ''


                Type: Int
              '';
            };
            "MaximizeButtonLeftClickCommand" = mkOption {
              type = nullOr (either str (enum [
                "Maximize"
                "MaximizeVerticalOnly"
                "MaximizeHorizontalOnly"
              ]));
              default = "Maximize";
              description = ''


                Type: Enum
                Choices: 
                  - Maximize
                  - MaximizeVerticalOnly
                  - MaximizeHorizontalOnly
              '';
            };
            "MaximizeButtonMiddleClickCommand" = mkOption {
              type = nullOr (either str (enum [
                "Maximize"
                "MaximizeVerticalOnly"
                "MaximizeHorizontalOnly"
              ]));
              default = "MaximizeVerticalOnly";
              description = ''


                Type: Enum
                Choices: 
                  - Maximize
                  - MaximizeVerticalOnly
                  - MaximizeHorizontalOnly
              '';
            };
            "MaximizeButtonRightClickCommand" = mkOption {
              type = nullOr (either str (enum [
                "Maximize"
                "MaximizeVerticalOnly"
                "MaximizeHorizontalOnly"
              ]));
              default = "MaximizeHorizontalOnly";
              description = ''


                Type: Enum
                Choices: 
                  - Maximize
                  - MaximizeVerticalOnly
                  - MaximizeHorizontalOnly
              '';
            };
            "NextFocusPrefersMouse" = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''


                Type: Bool
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
              default = ''
                [] {
                                #if KWIN_BUILD_DECORATIONS
                                    return PlacementCentered;
                                #else
                                    return PlacementMaximizing;
                                #endif
                            }()'';
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
            "RollOverDesktops" = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''
                Whether or not, we circle through the virtual desktop when moving from one to the next

                Type: bool
              '';
            };
            "SeparateScreenFocus" = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''


                Type: Bool
              '';
            };
            "ShadeHover" = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''


                Type: Bool
              '';
            };
            "ShadeHoverInterval" = mkOption {
              type = nullOr (either str int);
              default = 250;
              description = ''


                Type: Int
                Min: 0
              '';
            };
            "SnapOnlyWhenOverlapping" = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''


                Type: Bool
              '';
            };
            "TitlebarDoubleClickCommand" = mkOption {
              type = nullOr (either str (enum [
                "Maximize"
                "MaximizeVerticalOnly"
                "MaximizeHorizontalOnly"
                "Minimize"
                "Shade"
                "Lower"
                "Close"
                "OnAllDesktops"
                "Nothing"
              ]));
              default = "Maximize";
              description = ''


                Type: Enum
                Choices: 
                  - Maximize
                  - MaximizeVerticalOnly
                  - MaximizeHorizontalOnly
                  - Minimize
                  - Shade
                  - Lower
                  - Close
                  - OnAllDesktops
                  - Nothing
              '';
            };
            "WindowSnapZone" = mkOption {
              type = nullOr (either str int);
              default = 10;
              description = ''


                Type: Int
                Min: 0
                Max: 100
              '';
            };
          };
        };
        default = { };
        description = "Windows";
      };
    "Xwayland" = with types;
      mkOption {
        type = submodule {
          options = {
            XwaylandCrashPolicy = mkOption {
              type = nullOr (either str (enum [ "Stop" "Restart" ]));
              default = "XwaylandCrashPolicy::Restart";
              description = ''


                Type: Enum
                Choices: 
                  - Stop
                  - Restart
              '';
            };
            XwaylandEavesdrops = mkOption {
              type = nullOr
                (either str (enum [ "None" "Modifiers" "Combinations" "All" ]));
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
            XwaylandMaxCrashCount = mkOption {
              type = nullOr (either str int);
              default = 3;
              description = ''


                Type: UInt
              '';
            };
          };
        };
        default = { };
        description = "Xwayland";
      };
    "org.kde.kdecoration2" = with types;
      mkOption {
        type = submodule {
          options = {
            "BorderSize" = mkOption {
              type = nullOr str;
              default = "Normal";
              description = ''
                Window border size

                Type: String
              '';
            };
            "BorderSizeAuto" = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''
                Use theme's default window border size

                Type: Bool
              '';
            };
            "ButtonsOnLeft" = mkOption {
              type = nullOr str;
              default = "MS";
              description = ''
                Titlebar left buttons

                Type: String
              '';
            };
            "ButtonsOnRight" = mkOption {
              type = nullOr str;
              default = "HIAX";
              description = ''
                Titlebar right buttons

                Type: String
              '';
            };
            "CloseOnDoubleClickOnMenu" = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''
                Close windows by double clicking the menu button

                Type: Bool
              '';
            };
            "ShowToolTips" = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''
                Show titlebar button tooltips

                Type: Bool
              '';
            };
            "library" = mkOption {
              type = nullOr str;
              default = "s_defaultPlugin";
              defaultText = "Code: true";
              description = ''
                Plugin name

                Type: String
              '';
            };
            "theme" = mkOption {
              type = nullOr str;
              default = "s_defaultTheme";
              defaultText = "Code: true";
              description = ''
                Theme name

                Type: String
              '';
            };
          };
        };
        default = { };
        description = "org.kde.kdecoration2";
      };
  };
  config = mkIf cfg.enable { programs.plasma.files."kwinrc" = cfg.kwin; };
}
