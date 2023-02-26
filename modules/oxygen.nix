{ config, lib, pkgs, ... }:
with lib;
let
  cfg = config.programs.plasma;
  moduleCfg = config.programs.plasma.oxygen;
in {
  options.programs.plasma.oxygen = {
    enable = mkEnableOption ''
      Enable oxygen
    '';
    package = mkOption {
      default = if (pkgs ? oxygen) then
                        pkgs.oxygen
                      else
                        (if pkgs.libsForQt5 ? oxygen then pkgs.libsForQt5.oxygen else false);
      defaultText = literalExpression "pkgs.oxygen";
      type = with types; either bool package;
      description = mdDoc "Package to use.";
    };
    "Common" = with types; mkOption {
      type = submodule {
        options = { 
          UseBackgroundGradient = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
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
          AnimationsEnabled = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          CacheEnabled = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          ComboBoxTransitionsDuration = mkOption {
            type = nullOr (either str int);
            default = 75;
            description = ''
              

              Type: Int
            '';
          };
          ComboBoxTransitionsEnabled = mkOption {
            type = nullOr (either str bool);
            default = true;
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
          GenericAnimationsDuration = mkOption {
            type = nullOr (either str int);
            default = 150;
            description = ''
              

              Type: Int
            '';
          };
          GenericAnimationsEnabled = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          LabelTransitionsDuration = mkOption {
            type = nullOr (either str int);
            default = 75;
            description = ''
              

              Type: Int
            '';
          };
          LabelTransitionsEnabled = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          LineEditTransitionsDuration = mkOption {
            type = nullOr (either str int);
            default = 150;
            description = ''
              

              Type: Int
            '';
          };
          LineEditTransitionsEnabled = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          MaxCacheSize = mkOption {
            type = nullOr (either str int);
            default = 512;
            description = ''
              

              Type: Int
            '';
          };
          MenuAnimationType = mkOption {
            type = nullOr (either str (enum [ 
              "ME_NONE"
              "ME_FADE"
              "ME_FOLLOW_MOUSE"
            ]));
            default = "ME_FADE";
            description = ''
              

              Type: Enum
              Choices: 
                - ME_NONE
                - ME_FADE
                - ME_FOLLOW_MOUSE
            '';
          };
          MenuAnimationsDuration = mkOption {
            type = nullOr (either str int);
            default = 150;
            description = ''
              

              Type: Int
            '';
          };
          MenuBarAnimationType = mkOption {
            type = nullOr (either str (enum [ 
              "MB_NONE"
              "MB_FADE"
              "MB_FOLLOW_MOUSE"
            ]));
            default = "MB_FADE";
            description = ''
              

              Type: Enum
              Choices: 
                - MB_NONE
                - MB_FADE
                - MB_FOLLOW_MOUSE
            '';
          };
          MenuBarAnimationsDuration = mkOption {
            type = nullOr (either str int);
            default = 150;
            description = ''
              

              Type: Int
            '';
          };
          MenuBarFollowMouseAnimationsDuration = mkOption {
            type = nullOr (either str int);
            default = 80;
            description = ''
              

              Type: Int
            '';
          };
          MenuFollowMouseAnimationsDuration = mkOption {
            type = nullOr (either str int);
            default = 40;
            description = ''
              

              Type: Int
            '';
          };
          MenuHighlightMode = mkOption {
            type = nullOr (either str (enum [ 
              "MM_DARK"
              "MM_SUBTLE"
              "MM_STRONG"
            ]));
            default = "MM_DARK";
            description = ''
              

              Type: Enum
              Choices: 
                - MM_DARK
                - MM_SUBTLE
                - MM_STRONG
            '';
          };
          MnemonicsMode = mkOption {
            type = nullOr (either str (enum [ 
              "MN_NEVER"
              "MN_AUTO"
              "MN_ALWAYS"
            ]));
            default = "MN_ALWAYS";
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
          ProgressBarAnimationsDuration = mkOption {
            type = nullOr (either str int);
            default = 250;
            description = ''
              

              Type: Int
            '';
          };
          ProgressBarAnimationsEnabled = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          ProgressBarBusyStepDuration = mkOption {
            type = nullOr (either str int);
            default = 50;
            description = ''
              

              Type: Int
            '';
          };
          ScrollBarAddLineButtons = mkOption {
            type = nullOr (either str int);
            default = 2;
            description = ''
              

              Type: Int
            '';
          };
          ScrollBarSubLineButtons = mkOption {
            type = nullOr (either str int);
            default = 1;
            description = ''
              

              Type: Int
            '';
          };
          ScrollBarWidth = mkOption {
            type = nullOr (either str int);
            default = 15;
            description = ''
              

              Type: Int
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
          StackedWidgetTransitionsDuration = mkOption {
            type = nullOr (either str int);
            default = 150;
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
          ToolBarAnimationType = mkOption {
            type = nullOr (either str (enum [ 
              "TB_NONE"
              "TB_FADE"
              "TB_FOLLOW_MOUSE"
            ]));
            default = "TB_FADE";
            description = ''
              

              Type: Enum
              Choices: 
                - TB_NONE
                - TB_FADE
                - TB_FOLLOW_MOUSE
            '';
          };
          ToolBarAnimationsDuration = mkOption {
            type = nullOr (either str int);
            default = 50;
            description = ''
              

              Type: Int
            '';
          };
          ToolBarDrawItemSeparator = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          ToolTipTransparent = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          UseWMMoveResize = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          ViewDrawFocusIndicator = mkOption {
            type = nullOr (either str bool);
            default = false;
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
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          ViewTriangularExpanderSize = mkOption {
            type = nullOr (either str (enum [ 
              "TE_TINY"
              "TE_SMALL"
              "TE_NORMAL"
            ]));
            default = "TE_SMALL";
            description = ''
              

              Type: Enum
              Choices: 
                - TE_TINY
                - TE_SMALL
                - TE_NORMAL
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
          WindowDragEnabled = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
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
  };
  config = mkIf (cfg.enable && moduleCfg.enable) {
    home.packages = mkIf (moduleCfg.package != false) [ moduleCfg.package ];
    programs.plasma.files."oxygenrc" = removeAttrs moduleCfg [ "enable" "package" ];
  };
}
