{ config, lib, ... }:
with lib;
let cfg = config.programs.plasma;
in {
  options.programs.plasma.kwin = {
    "Windows" = with types;
      mkOption {
        type = submodule {
          options = {
            "BorderSnapZone" = mkOption {
              type = nullOr (either str int);
              default = 10;
              description = ''


                Type: Int
                Min: 0
                Max: 100
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
            "CenterSnapZone" = mkOption {
              type = nullOr (either str int);
              default = 0;
              description = ''


                Type: Int
                Min: 0
                Max: 100
              '';
            };
            "SnapOnlyWhenOverlapping" = mkOption {
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
            Placement = mkOption {
              type = nullOr (either str (enum [
                "Smart"
                "Maximizing"
                "Random"
                "Centered"
                "ZeroCornered"
                "UnderMouse"
              ]));
              default = "Centered";
              description = ''


                Type: Enum
                Choices: 
                  - Smart
                  - Maximizing
                  - Random
                  - Centered
                  - ZeroCornered
                  - UnderMouse
              '';
            };
            "HideUtilityWindowsForInactive" = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''


                Type: Bool
              '';
            };
            ActivationDesktopPolicy = mkOption {
              type = nullOr (either str
                (enum [ "SwitchToOtherDesktop" "BringToCurrentDesktop" ]));
              default = "SwitchToOtherDesktop";
              description = ''


                Type: Enum
                Choices: 
                  - SwitchToOtherDesktop
                  - BringToCurrentDesktop
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
            "NextFocusPrefersMouse" = mkOption {
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
            "DelayFocusInterval" = mkOption {
              type = nullOr (either str int);
              default = 300;
              description = ''


                Type: Int
                Min: 0
              '';
            };
            "AutoRaise" = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''


                Type: Bool
              '';
            };
            "ClickRaise" = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''


                Type: Bool
              '';
            };
            "SeparateScreenFocus" = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''


                Type: Bool
              '';
            };
            "ActiveMouseScreen" = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''


                Type: Bool
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
          };
        };
        default = { };
        description = "Windows";
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
          };
        };
        default = { };
        description = "MouseBindings";
      };
  };
  config = mkIf cfg.enable { programs.plasma.files."kwinrc" = cfg.kwin; };
}
