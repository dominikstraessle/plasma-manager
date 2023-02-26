{ config, lib, ... }:
with lib;
let
  cfg = config.programs.plasma;
  moduleCfg = config.programs.plasma.kwin;
in {
  options.programs.plasma.kwin = {
    enable = mkEnableOption ''
      Enable kwin
    '';
    package = mkOption {
      default = if (pkgs ? kwin) then
                        pkgs.kwin
                      else
                        (if pkgs.libsForQt5 ? kwin then pkgs.libsForQt5.kwin else false);
      defaultText = literalExpression "pkgs.kwin";
      type = with types; either bool package;
      description = mdDoc "Package to use.";
    };
    "" = with types; mkOption {
      type = submodule {
        options = { 
          ApplyTo = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: bool
            '';
          };
          Blacklist = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              

              Type: string
            '';
          };
          ComboboxPopups = mkOption {
            type = nullOr (either str int);
            default = 100;
            description = ''
              

              Type: UInt
            '';
          };
          Dialogs = mkOption {
            type = nullOr (either str int);
            default = 100;
            description = ''
              

              Type: UInt
            '';
          };
          DropdownMenus = mkOption {
            type = nullOr (either str int);
            default = 100;
            description = ''
              

              Type: UInt
            '';
          };
          Duration = mkOption {
            type = nullOr (either str int);
            default = 0;
            description = ''
              

              Type: UInt
            '';
          };
          FadeInTime = mkOption {
            type = nullOr (either str int);
            default = 150;
            description = ''
              

              Type: Int
            '';
          };
          FadeOutTime = mkOption {
            type = nullOr (either str int);
            default = 150;
            description = ''
              

              Type: Int
            '';
          };
          FadeToBlack = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          FadeWindows = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          Ignore = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: bool
            '';
          };
          InScale = mkOption {
            type = nullOr (either str float);
            default = 0.8;
            description = ''
              

              Type: Double
            '';
          };
          Inactive = mkOption {
            type = nullOr (either str int);
            default = 100;
            description = ''
              

              Type: UInt
            '';
          };
          IndividualMenuConfig = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          Menus = mkOption {
            type = nullOr (either str int);
            default = 100;
            description = ''
              

              Type: UInt
            '';
          };
          MoveResize = mkOption {
            type = nullOr (either str int);
            default = 80;
            description = ''
              

              Type: Int
            '';
          };
          OutScale = mkOption {
            type = nullOr (either str float);
            default = 0.8;
            description = ''
              

              Type: Double
            '';
          };
          PopupMenus = mkOption {
            type = nullOr (either str int);
            default = 100;
            description = ''
              

              Type: UInt
            '';
          };
          TornOffMenus = mkOption {
            type = nullOr (either str int);
            default = 100;
            description = ''
              

              Type: UInt
            '';
          };
          Whitelist = mkOption {
            type = nullOr str;
            default = "vlc, xv, vdpau, smplayer, dragon, xine, ffplay, mplayer";
            description = ''
              

              Type: string
            '';
          };
          animateButtons = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          coloredBorder = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          titleAlignCenter = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          titleAlignLeft = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          titleAlignRight = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
        };
      };
      default = {};
      description = "";
    };    
    "$(EffectGroup)" = with types; mkOption {
      type = submodule {
        options = { 
          TabBox = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          TabBoxAlternative = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
        };
      };
      default = {};
      description = "$(EffectGroup)";
    };    
    "Effect-$(EffectName)" = with types; mkOption {
      type = submodule {
        options = { 
          BorderActivate = mkOption {
            type = nullOr (either str (listOf int));
            default = "ElectricNone";
            description = ''
              

              Type: IntList
            '';
          };
          TouchBorderActivate = mkOption {
            type = nullOr (either str (listOf int));
            default = "ElectricNone";
            description = ''
              

              Type: IntList
            '';
          };
        };
      };
      default = {};
      description = "Effect-$(EffectName)";
    };    
    "Effect-DesktopGrid" = with types; mkOption {
      type = submodule {
        options = { 
          BorderActivate = mkOption {
            type = nullOr (either str (listOf int));
            default = "ElectricNone";
            description = ''
              

              Type: IntList
            '';
          };
        };
      };
      default = {};
      description = "Effect-DesktopGrid";
    };    
    "Effect-Overview" = with types; mkOption {
      type = submodule {
        options = { 
          BorderActivate = mkOption {
            type = nullOr (either str (listOf int));
            default = "ElectricNone";
            description = ''
              

              Type: IntList
            '';
          };
        };
      };
      default = {};
      description = "Effect-Overview";
    };    
    "Effect-blur" = with types; mkOption {
      type = submodule {
        options = { 
          BlurStrength = mkOption {
            type = nullOr (either str int);
            default = 15;
            description = ''
              

              Type: Int
            '';
          };
          NoiseStrength = mkOption {
            type = nullOr (either str int);
            default = 5;
            description = ''
              

              Type: Int
            '';
          };
        };
      };
      default = {};
      description = "Effect-blur";
    };    
    "Effect-diminactive" = with types; mkOption {
      type = submodule {
        options = { 
          DimByGroup = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          DimDesktop = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          DimFullScreen = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          DimKeepAbove = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          DimPanels = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          Strength = mkOption {
            type = nullOr (either str int);
            default = 25;
            description = ''
              

              Type: Int
            '';
          };
        };
      };
      default = {};
      description = "Effect-diminactive";
    };    
    "Effect-fallapart" = with types; mkOption {
      type = submodule {
        options = { 
          BlockSize = mkOption {
            type = nullOr (either str int);
            default = 40;
            description = ''
              

              Type: Int
              Min: 1
              Max: 100000
            '';
          };
        };
      };
      default = {};
      description = "Effect-fallapart";
    };    
    "Effect-kscreen" = with types; mkOption {
      type = submodule {
        options = { 
          Duration = mkOption {
            type = nullOr (either str int);
            default = 0;
            description = ''
              

              Type: Int
            '';
          };
        };
      };
      default = {};
      description = "Effect-kscreen";
    };    
    "Effect-magiclamp" = with types; mkOption {
      type = submodule {
        options = { 
          AnimationDuration = mkOption {
            type = nullOr (either str int);
            default = 0;
            description = ''
              

              Type: Int
            '';
          };
        };
      };
      default = {};
      description = "Effect-magiclamp";
    };    
    "Effect-magnifier" = with types; mkOption {
      type = submodule {
        options = { 
          Height = mkOption {
            type = nullOr (either str int);
            default = 200;
            description = ''
              

              Type: UInt
            '';
          };
          InitialZoom = mkOption {
            type = nullOr (either str float);
            default = 1.0;
            description = ''
              

              Type: Double
            '';
          };
          Width = mkOption {
            type = nullOr (either str int);
            default = 200;
            description = ''
              

              Type: UInt
            '';
          };
        };
      };
      default = {};
      description = "Effect-magnifier";
    };    
    "Effect-mousemark" = with types; mkOption {
      type = submodule {
        options = { 
          Color = mkOption {
            type = nullOr str;
            default = "255,0,0";
            description = ''
              

              Type: Color
            '';
          };
          LineWidth = mkOption {
            type = nullOr (either str int);
            default = 3;
            description = ''
              

              Type: UInt
            '';
          };
        };
      };
      default = {};
      description = "Effect-mousemark";
    };    
    "Effect-overview" = with types; mkOption {
      type = submodule {
        options = { 
          BlurBackground = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          BorderActivate = mkOption {
            type = nullOr (either str (listOf int));
            default = "";
            description = ''
              

              Type: IntList
            '';
          };
          IgnoreMinimized = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: bool
            '';
          };
          LayoutMode = mkOption {
            type = nullOr (either str int);
            default = 1;
            description = ''
              

              Type: Int
            '';
          };
          TouchBorderActivate = mkOption {
            type = nullOr (either str (listOf int));
            default = "";
            description = ''
              

              Type: IntList
            '';
          };
        };
      };
      default = {};
      description = "Effect-overview";
    };    
    "Effect-sheet" = with types; mkOption {
      type = submodule {
        options = { 
          AnimationTime = mkOption {
            type = nullOr (either str int);
            default = 0;
            description = ''
              

              Type: Int
            '';
          };
        };
      };
      default = {};
      description = "Effect-sheet";
    };    
    "Effect-slide" = with types; mkOption {
      type = submodule {
        options = { 
          HorizontalGap = mkOption {
            type = nullOr (either str int);
            default = 45;
            description = ''
              

              Type: UInt
            '';
          };
          SlideBackground = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          VerticalGap = mkOption {
            type = nullOr (either str int);
            default = 20;
            description = ''
              

              Type: UInt
            '';
          };
        };
      };
      default = {};
      description = "Effect-slide";
    };    
    "Effect-slidingpopups" = with types; mkOption {
      type = submodule {
        options = { 
          SlideInTime = mkOption {
            type = nullOr (either str int);
            default = 0;
            description = ''
              

              Type: Int
            '';
          };
          SlideOutTime = mkOption {
            type = nullOr (either str int);
            default = 0;
            description = ''
              

              Type: Int
            '';
          };
        };
      };
      default = {};
      description = "Effect-slidingpopups";
    };    
    "Effect-thumbnailaside" = with types; mkOption {
      type = submodule {
        options = { 
          MaxWidth = mkOption {
            type = nullOr (either str int);
            default = 200;
            description = ''
              

              Type: Int
            '';
          };
          Opacity = mkOption {
            type = nullOr (either str float);
            default = 50.0;
            description = ''
              

              Type: Double
            '';
          };
          Screen = mkOption {
            type = nullOr (either str int);
            default = -1;
            description = ''
              

              Type: Int
            '';
          };
          Spacing = mkOption {
            type = nullOr (either str int);
            default = 10;
            description = ''
              

              Type: Int
            '';
          };
        };
      };
      default = {};
      description = "Effect-thumbnailaside";
    };    
    "Effect-trackmouse" = with types; mkOption {
      type = submodule {
        options = { 
          Alt = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          Control = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          Meta = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          Shift = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
        };
      };
      default = {};
      description = "Effect-trackmouse";
    };    
    "Effect-windowview" = with types; mkOption {
      type = submodule {
        options = { 
          BorderActivate = mkOption {
            type = nullOr (either str (listOf int));
            default = "ElectricNone";
            description = ''
              

              Type: IntList
            '';
          };
          BorderActivateAll = mkOption {
            type = nullOr (either str (listOf int));
            default = "ElectricTopLeft";
            description = ''
              

              Type: IntList
            '';
          };
          BorderActivateClass = mkOption {
            type = nullOr (either str (listOf int));
            default = "ElectricNone";
            description = ''
              

              Type: IntList
            '';
          };
          BorderActivateClassCurrentDesktop = mkOption {
            type = nullOr (either str (listOf int));
            default = "";
            description = ''
              

              Type: IntList
            '';
          };
          IgnoreMinimized = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: bool
            '';
          };
          LayoutMode = mkOption {
            type = nullOr (either str int);
            default = 1;
            description = ''
              

              Type: Int
            '';
          };
          TouchBorderActivate = mkOption {
            type = nullOr (either str (listOf int));
            default = "ElectricNone";
            description = ''
              

              Type: IntList
            '';
          };
          TouchBorderActivateAll = mkOption {
            type = nullOr (either str (listOf int));
            default = "ElectricNone";
            description = ''
              

              Type: IntList
            '';
          };
          TouchBorderActivateClass = mkOption {
            type = nullOr (either str (listOf int));
            default = "ElectricNone";
            description = ''
              

              Type: IntList
            '';
          };
          TouchBorderActivateClassCurrentDesktop = mkOption {
            type = nullOr (either str (listOf int));
            default = "";
            description = ''
              

              Type: IntList
            '';
          };
        };
      };
      default = {};
      description = "Effect-windowview";
    };    
    "Effect-zoom" = with types; mkOption {
      type = submodule {
        options = { 
          EnableFocusTracking = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          EnableTextCaretTracking = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          FocusDelay = mkOption {
            type = nullOr (either str int);
            default = 350;
            description = ''
              

              Type: UInt
            '';
          };
          InitialZoom = mkOption {
            type = nullOr (either str float);
            default = 1.0;
            description = ''
              

              Type: Double
            '';
          };
          MousePointer = mkOption {
            type = nullOr (either str int);
            default = 0;
            description = ''
              

              Type: UInt
            '';
          };
          MouseTracking = mkOption {
            type = nullOr (either str int);
            default = 0;
            description = ''
              

              Type: UInt
            '';
          };
          MoveFactor = mkOption {
            type = nullOr (either str float);
            default = 20.0;
            description = ''
              

              Type: Double
            '';
          };
          ZoomFactor = mkOption {
            type = nullOr (either str float);
            default = 1.2;
            description = ''
              

              Type: Double
            '';
          };
        };
      };
      default = {};
      description = "Effect-zoom";
    };    
    "ElectricBorders" = with types; mkOption {
      type = submodule {
        options = { 
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
          BottomRight = mkOption {
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
          Right = mkOption {
            type = nullOr str;
            default = "None";
            description = ''
              

              Type: String
            '';
          };
          Top = mkOption {
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
          TopRight = mkOption {
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
    "General" = with types; mkOption {
      type = submodule {
        options = { 
          count = mkOption {
            type = nullOr (either str int);
            default = 0;
            description = ''
              Total rules count (legacy)

              Type: int
            '';
          };
          rules = mkOption {
            type = nullOr (either str (listOf str));
            default = "QStringList()";
            description = ''
              Ordered list of rules groups

              Type: stringList
            '';
          };
        };
      };
      default = {};
      description = "General";
    };    
    "Input" = with types; mkOption {
      type = submodule {
        options = { 
          TabletMode = mkOption {
            type = nullOr str;
            default = "auto";
            description = ''
              Automatically switch to touch-optimized mode

              Type: String
            '';
          };
        };
      };
      default = {};
      description = "Input";
    };    
    "NightColor" = with types; mkOption {
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
          DayTemperature = mkOption {
            type = nullOr (either str int);
            default = 6500;
            description = ''
              

              Type: Int
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
            type = nullOr (either str (enum [ 
              "Automatic"
              "Location"
              "Times"
              "Constant"
            ]));
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
      default = {};
      description = "NightColor";
    };    
    "Plugins" = with types; mkOption {
      type = submodule {
        options = { 
          highlightwindowEnabled = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
        };
      };
      default = {};
      description = "Plugins";
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
    "Script-$(ScriptName)" = with types; mkOption {
      type = submodule {
        options = { 
          BorderActivate = mkOption {
            type = nullOr (either str (listOf int));
            default = "ElectricNone";
            description = ''
              

              Type: IntList
            '';
          };
          TouchBorderActivate = mkOption {
            type = nullOr (either str (listOf int));
            default = "ElectricNone";
            description = ''
              

              Type: IntList
            '';
          };
        };
      };
      default = {};
      description = "Script-$(ScriptName)";
    };    
    "TabBox" = with types; mkOption {
      type = submodule {
        options = { 
          BorderActivate = mkOption {
            type = nullOr (either str (listOf int));
            default = "ElectricNone";
            description = ''
              

              Type: IntList
            '';
          };
          BorderAlternativeActivate = mkOption {
            type = nullOr (either str (listOf int));
            default = "ElectricNone";
            description = ''
              

              Type: IntList
            '';
          };
          TouchBorderActivate = mkOption {
            type = nullOr (either str (listOf int));
            default = "ElectricNone";
            description = ''
              

              Type: IntList
            '';
          };
          TouchBorderAlternativeActivate = mkOption {
            type = nullOr (either str (listOf int));
            default = "ElectricNone";
            description = ''
              

              Type: IntList
            '';
          };
        };
      };
      default = {};
      description = "TabBox";
    };    
    "TouchEdges" = with types; mkOption {
      type = submodule {
        options = { 
          Bottom = mkOption {
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
          Right = mkOption {
            type = nullOr str;
            default = "None";
            description = ''
              

              Type: String
            '';
          };
          Top = mkOption {
            type = nullOr str;
            default = "None";
            description = ''
              

              Type: String
            '';
          };
        };
      };
      default = {};
      description = "TouchEdges";
    };    
    "Wayland" = with types; mkOption {
      type = submodule {
        options = { 
          EnablePrimarySelection = mkOption {
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
      default = {};
      description = "Wayland";
    };    
    "Windows" = with types; mkOption {
      type = submodule {
        options = { 
          ElectricBorderCooldown = mkOption {
            type = nullOr (either str int);
            default = 350;
            description = ''
              

              Type: Int
            '';
          };
          ElectricBorderCornerRatio = mkOption {
            type = nullOr (either str float);
            default = 0.25;
            description = ''
              

              Type: Double
            '';
          };
          ElectricBorderDelay = mkOption {
            type = nullOr (either str int);
            default = 150;
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
          ElectricBorders = mkOption {
            type = nullOr (either str int);
            default = 0;
            description = ''
              

              Type: Int
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
  config = mkIf (cfg.enable && moduleCfg.enable) {
    home.packages = mkIf moduleCfg.package [ moduleCfg.package ];
    programs.plasma.files."kwinrc" = removeAttrs moduleCfg [ "enable" "package" ];
  };
}
