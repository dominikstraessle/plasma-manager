{ config, lib, ... }:
with lib;
let
  cfg = config.programs.plasma;
  moduleCfg = config.programs.plasma.yakuake;
in {
  options.programs.plasma.yakuake = {
    enable = mkEnableOption ''
      Enable yakuake
    '';
    package = mkOption {
      default = if (pkgs ? yakuake) then
                        pkgs.yakuake
                      else
                        (if pkgs.libsForQt5 ? yakuake then pkgs.libsForQt5.yakuake else false);
      defaultText = literalExpression "pkgs.yakuake";
      type = either bool types.package;
      description = mdDoc "Package to use.";
    };
    "Animation" = with types; mkOption {
      type = submodule {
        options = { 
          Frames = mkOption {
            type = nullOr (either str int);
            default = 17;
            description = ''
              Animation frames

              Type: Int
              Min: 0
              Max: 50
            '';
          };
          UseWMAssist = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Attempt to use the window manager to animate the window

              Type: Bool
            '';
          };
        };
      };
      default = {};
      description = "Animation";
    };    
    "Appearance" = with types; mkOption {
      type = submodule {
        options = { 
          BackgroundColor = mkOption {
            type = nullOr str;
            default = "#000000";
            description = ''
              Window background color

              Type: Color
            '';
          };
          BackgroundColorOpacity = mkOption {
            type = nullOr (either str int);
            default = 50;
            description = ''
              Background color opacity

              Type: Int
              Min: 0
              Max: 100
            '';
          };
          HideSkinBorders = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Hide the borders defined by the skin

              Type: Bool
            '';
          };
          KeyboardInputBlockIndicatorColor = mkOption {
            type = nullOr str;
            default = "#FF0000";
            description = ''
              Keyboard input block indicator color

              Type: Color
            '';
          };
          KeyboardInputBlockIndicatorDuration = mkOption {
            type = nullOr (either str int);
            default = 250;
            description = ''
              Keyboard input block indicator duration

              Type: Int
              Min: 0
              Max: 86400000
            '';
          };
          KeyboardInputBlockIndicatorOpacity = mkOption {
            type = nullOr (either str float);
            default = 0.5;
            description = ''
              Keyboard input block indicator opacity

              Type: Double
              Min: 0
              Max: 1.0
            '';
          };
          Skin = mkOption {
            type = nullOr str;
            default = "default";
            description = ''
              Skin

              Type: String
            '';
          };
          SkinInstalledWithKns = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Skin installed by KNS

              Type: Bool
            '';
          };
          TerminalHighlightDuration = mkOption {
            type = nullOr (either str int);
            default = 250;
            description = ''
              Terminal highlight duration

              Type: Int
              Min: 0
              Max: 86400000
            '';
          };
          TerminalHighlightOnManualActivation = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Highlight newly focused terminals

              Type: Bool
            '';
          };
          TerminalHighlightOpacity = mkOption {
            type = nullOr (either str float);
            default = 0.4;
            description = ''
              Terminal highlight opacity

              Type: Double
              Min: 0
              Max: 1.0
            '';
          };
          Translucency = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Use translucent background

              Type: Bool
            '';
          };
        };
      };
      default = {};
      description = "Appearance";
    };    
    "AutoOpen" = with types; mkOption {
      type = submodule {
        options = { 
          PollInterval = mkOption {
            type = nullOr (either str int);
            default = 500;
            description = ''
              Mouse pointer poll interval

              Type: Int
            '';
          };
          PollMouse = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Auto-open window

              Type: Bool
            '';
          };
        };
      };
      default = {};
      description = "AutoOpen";
    };    
    "Behavior" = with types; mkOption {
      type = submodule {
        options = { 
          FocusFollowsMouse = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Focus follows mouse

              Type: Bool
            '';
          };
          OpenAfterStart = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Open after start

              Type: Bool
            '';
          };
          RememberFullscreen = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Remember window fullscreen state

              Type: Bool
            '';
          };
        };
      };
      default = {};
      description = "Behavior";
    };    
    "Dialogs" = with types; mkOption {
      type = submodule {
        options = { 
          ConfirmQuit = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Confirm quit with multiple sessions

              Type: Bool
            '';
          };
          FirstRun = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Application first run

              Type: Bool
            '';
          };
        };
      };
      default = {};
      description = "Dialogs";
    };    
    "Window" = with types; mkOption {
      type = submodule {
        options = { 
          DynamicTabTitles = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Dynamic tab titles

              Type: Bool
            '';
          };
          Height = mkOption {
            type = nullOr (either str int);
            default = 50;
            description = ''
              Window height

              Type: Int
              Min: 10
              Max: 100
            '';
          };
          KeepAbove = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Keep window on top

              Type: Bool
            '';
          };
          KeepOpen = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Keep window open

              Type: Bool
            '';
          };
          KeepOpenAfterLastSessionCloses = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Keep window open after last session closes

              Type: Bool
            '';
          };
          Position = mkOption {
            type = nullOr (either str int);
            default = 50;
            description = ''
              Window position

              Type: Int
              Min: 0
              Max: 100
            '';
          };
          Screen = mkOption {
            type = nullOr (either str int);
            default = 0;
            description = ''
              Screen to use

              Type: Int
            '';
          };
          ShowOnAllDesktops = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Show window on all desktops

              Type: Bool
            '';
          };
          ShowSystrayIcon = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Show a system tray icon

              Type: Bool
            '';
          };
          ShowTabBar = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Show tab bar

              Type: Bool
            '';
          };
          ShowTitleBar = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Show title bar

              Type: Bool
            '';
          };
          ToggleToFocus = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Use open/retract shortcut to focus window

              Type: Bool
            '';
          };
          Width = mkOption {
            type = nullOr (either str int);
            default = 90;
            description = ''
              Window width

              Type: Int
              Min: 10
              Max: 100
            '';
          };
        };
      };
      default = {};
      description = "Window";
    };    
  };
  config = mkIf (cfg.enable && moduleCfg.enable) {
    home.packages = mkIf moduleCfg.package [ moduleCfg.package ];
    programs.plasma.files."yakuakerc" = removeAttrs moduleCfg [ "enable" "package" ];
  };
}
