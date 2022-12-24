{ config, lib, ... }:
with lib;
let cfg = config.programs.plasma;
in {
  options.programs.plasma.breeze = { 
    "Common" = with types; mkOption {
      type = submodule {
        options = { 
          OutlineCloseButton = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          ShadowColor = mkOption {
            type = nullOr str;
            default = "0, 0, 0";
            description = ''
              

              Type: Color
            '';
          };
          ShadowSize = mkOption {
            type = nullOr (either str (enum [ 
              "ShadowNone"
              "ShadowSmall"
              "ShadowMedium"
              "ShadowLarge"
              "ShadowVeryLarge"
            ]));
            default = "ShadowLarge";
            description = ''
              

              Type: Enum
              Choices: 
                - ShadowNone
                - ShadowSmall
                - ShadowMedium
                - ShadowLarge
                - ShadowVeryLarge
            '';
          };
          ShadowStrength = mkOption {
            type = nullOr (either str int);
            default = 255;
            description = ''
              

              Type: Int
              Min: 25
              Max: 255
            '';
          };
        };
      };
      default = {};
      description = "Common";
    };    
    "Style" = with types; mkOption {
      type = submodule {
        options = { 
          AnimationSteps = mkOption {
            type = nullOr (either str int);
            default = 10;
            description = ''
              

              Type: Int
            '';
          };
          AnimationsDuration = mkOption {
            type = nullOr (either str int);
            default = 100;
            description = ''
              

              Type: Int
            '';
          };
          AnimationsEnabled = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          DockWidgetDrawFrame = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          DrawWidgetRects = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          MenuItemDrawStrongFocus = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          MenuOpacity = mkOption {
            type = nullOr (either str int);
            default = 100;
            description = ''
              

              Type: Int
            '';
          };
          MnemonicsMode = mkOption {
            type = nullOr (either str (enum [ 
              "MN_NEVER"
              "MN_AUTO"
              "MN_ALWAYS"
            ]));
            default = "MN_AUTO";
            description = ''
              

              Type: Enum
              Choices: 
                - MN_NEVER
                - MN_AUTO
                - MN_ALWAYS
            '';
          };
          ProgressBarAnimated = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          ProgressBarBusyStepDuration = mkOption {
            type = nullOr (either str int);
            default = 800;
            description = ''
              

              Type: Int
            '';
          };
          ScrollBarAddLineButtons = mkOption {
            type = nullOr (either str int);
            default = 0;
            description = ''
              

              Type: Int
            '';
          };
          ScrollBarSubLineButtons = mkOption {
            type = nullOr (either str int);
            default = 0;
            description = ''
              

              Type: Int
            '';
          };
          SidePanelDrawFrame = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          SliderDrawTickMarks = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          SplitterProxyEnabled = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          SplitterProxyWidth = mkOption {
            type = nullOr (either str int);
            default = 12;
            description = ''
              

              Type: Int
            '';
          };
          StackedWidgetTransitionsEnabled = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          TabBarDrawCenteredTabs = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          ToolBarDrawItemSeparator = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          ViewDrawFocusIndicator = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          ViewDrawTreeBranchLines = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          ViewInvertSortIndicator = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          WidgetExplorerEnabled = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          WindowDragBlackList = mkOption {
            type = nullOr (either str (listOf str));
            default = "";
            description = ''
              

              Type: StringList
            '';
          };
          WindowDragMode = mkOption {
            type = nullOr (either str (enum [ 
              "WD_NONE"
              "WD_MINIMAL"
              "WD_FULL"
            ]));
            default = "WD_FULL";
            description = ''
              

              Type: Enum
              Choices: 
                - WD_NONE
                - WD_MINIMAL
                - WD_FULL
            '';
          };
          WindowDragWhiteList = mkOption {
            type = nullOr (either str (listOf str));
            default = "";
            description = ''
              

              Type: StringList
            '';
          };
        };
      };
      default = {};
      description = "Style";
    };    
    "Windeco" = with types; mkOption {
      type = submodule {
        options = { 
          BorderSize = mkOption {
            type = nullOr (either str (enum [ 
              "BorderNone"
              "BorderNoSides"
              "BorderTiny"
              "BorderNormal"
              "BorderLarge"
              "BorderVeryLarge"
              "BorderHuge"
              "BorderVeryHuge"
              "BorderOversized"
            ]));
            default = "BorderNone";
            description = ''
              

              Type: Enum
              Choices: 
                - BorderNone
                - BorderNoSides
                - BorderTiny
                - BorderNormal
                - BorderLarge
                - BorderVeryLarge
                - BorderHuge
                - BorderVeryHuge
                - BorderOversized
            '';
          };
          ButtonSize = mkOption {
            type = nullOr (either str (enum [ 
              "ButtonTiny"
              "ButtonSmall"
              "ButtonDefault"
              "ButtonLarge"
              "ButtonVeryLarge"
            ]));
            default = "ButtonDefault";
            description = ''
              

              Type: Enum
              Choices: 
                - ButtonTiny
                - ButtonSmall
                - ButtonDefault
                - ButtonLarge
                - ButtonVeryLarge
            '';
          };
          DrawBackgroundGradient = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          DrawBorderOnMaximizedWindows = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          Enabled = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          ExceptionPattern = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              

              Type: String
            '';
          };
          ExceptionType = mkOption {
            type = nullOr (either str (enum [ 
              "ExceptionWindowClassName"
              "ExceptionWindowTitle"
            ]));
            default = "ExceptionWindowClassName";
            description = ''
              

              Type: Enum
              Choices: 
                - ExceptionWindowClassName
                - ExceptionWindowTitle
            '';
          };
          HideTitleBar = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          Mask = mkOption {
            type = nullOr (either str int);
            default = 0;
            description = ''
              

              Type: Int
            '';
          };
          TitleAlignment = mkOption {
            type = nullOr (either str (enum [ 
              "AlignLeft"
              "AlignCenter"
              "AlignCenterFullWidth"
              "AlignRight"
            ]));
            default = "AlignCenterFullWidth";
            description = ''
              

              Type: Enum
              Choices: 
                - AlignLeft
                - AlignCenter
                - AlignCenterFullWidth
                - AlignRight
            '';
          };
        };
      };
      default = {};
      description = "Windeco";
    };    
  };
  config = mkIf cfg.enable {
    programs.plasma.files."breezerc" = cfg.breeze;
  };
}
