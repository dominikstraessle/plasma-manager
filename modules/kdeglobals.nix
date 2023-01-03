{ config, lib, ... }:
with lib;
let cfg = config.programs.plasma;
in {
  options.programs.plasma.kdeglobals = { 
    "DesktopIcons" = with types; mkOption {
      type = submodule {
        options = { 
          Size = mkOption {
            type = nullOr (either str int);
            default = 32;
            description = ''
              Desktop icons size

              Type: Int
            '';
          };
        };
      };
      default = {};
      description = "DesktopIcons";
    };    
    "DialogIcons" = with types; mkOption {
      type = submodule {
        options = { 
          Size = mkOption {
            type = nullOr (either str int);
            default = 32;
            description = ''
              Dialog icons size

              Type: Int
            '';
          };
        };
      };
      default = {};
      description = "DialogIcons";
    };    
    "General" = with types; mkOption {
      type = submodule {
        options = { 
          AccentColor = mkOption {
            type = nullOr str;
            default = "transparent";
            description = ''
              Accent color

              Type: Color
            '';
          };
          AllowKDEAppsToRememberWindowPositions = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          BrowserApplication = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              Default web browser

              Type: String
            '';
          };
          ColorScheme = mkOption {
            type = nullOr str;
            default = "BreezeLight";
            description = ''
              Color scheme name

              Type: String
            '';
          };
          LastUsedCustomAccentColor = mkOption {
            type = nullOr str;
            default = "transparent";
            description = ''
              The last used custom accent color before user switched to wallpaper generated color or default color

              Type: Color
            '';
          };
          TerminalApplication = mkOption {
            type = nullOr str;
            default = "konsole";
            description = ''
              

              Type: String
            '';
          };
          TerminalService = mkOption {
            type = nullOr str;
            default = "org.kde.konsole.desktop";
            description = ''
              

              Type: String
            '';
          };
          accentColorFromWallpaper = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Whether accent color from wallpaper should be applied

              Type: Bool
            '';
          };
          fixed = mkOption {
            type = nullOr str;
            default = "fixedWidthFont";
            defaultText = "Code: true";
            description = ''
              Fixed width font

              Type: Font
            '';
          };
          font = mkOption {
            type = nullOr str;
            default = "generalFont";
            defaultText = "Code: true";
            description = ''
              General font

              Type: Font
            '';
          };
          menuFont = mkOption {
            type = nullOr str;
            default = "menuFont";
            defaultText = "Code: true";
            description = ''
              Menu font

              Type: Font
            '';
          };
          smallestReadableFont = mkOption {
            type = nullOr str;
            default = "smallFont";
            defaultText = "Code: true";
            description = ''
              Small font

              Type: Font
            '';
          };
          toolBarFont = mkOption {
            type = nullOr str;
            default = "toolBarFont";
            defaultText = "Code: true";
            description = ''
              Tool bar font

              Type: Font
            '';
          };
        };
      };
      default = {};
      description = "General";
    };    
    "Icons" = with types; mkOption {
      type = submodule {
        options = { 
          Theme = mkOption {
            type = nullOr str;
            default = "breeze";
            description = ''
              Name of the current icon theme

              Type: String
            '';
          };
        };
      };
      default = {};
      description = "Icons";
    };    
    "KDE" = with types; mkOption {
      type = submodule {
        options = { 
          AnimationDurationFactor = mkOption {
            type = nullOr (either str float);
            default = 1.0;
            description = ''
              Animation speed

              Type: Double
            '';
          };
          DefaultDarkLookAndFeel = mkOption {
            type = nullOr str;
            default = "org.kde.breezedark.desktop";
            description = ''
              Global Look and Feel package, alternate

              Type: String
            '';
          };
          DefaultLightLookAndFeel = mkOption {
            type = nullOr str;
            default = "org.kde.breeze.desktop";
            description = ''
              Global Look and Feel package, alternate

              Type: String
            '';
          };
          LookAndFeelPackage = mkOption {
            type = nullOr str;
            default = "org.kde.breeze.desktop";
            description = ''
              Global Look and Feel package

              Type: String
            '';
          };
          ScrollbarLeftClickNavigatesByPage = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Left-click in scrollbar track moves scrollbar by one page

              Type: Bool
            '';
          };
          ShowIconsInMenuItems = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Show icons in menus

              Type: Bool
            '';
          };
          ShowIconsOnPushButtons = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Show icons on buttons

              Type: Bool
            '';
          };
          SingleClick = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Single click to open files

              Type: Bool
            '';
          };
          widgetStyle = mkOption {
            type = nullOr str;
            default = "Breeze";
            description = ''
              Application style

              Type: String
            '';
          };
        };
      };
      default = {};
      description = "KDE";
    };    
    "KScreen" = with types; mkOption {
      type = submodule {
        options = { 
          ScaleFactor = mkOption {
            type = nullOr (either str float);
            default = 1.0;
            description = ''
              

              Type: Double
            '';
          };
          XwaylandClientsScale = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
        };
      };
      default = {};
      description = "KScreen";
    };    
    "MainToolbarIcons" = with types; mkOption {
      type = submodule {
        options = { 
          Size = mkOption {
            type = nullOr (either str int);
            default = 22;
            description = ''
              Main toolbar icons size

              Type: Int
            '';
          };
        };
      };
      default = {};
      description = "MainToolbarIcons";
    };    
    "PanelIcons" = with types; mkOption {
      type = submodule {
        options = { 
          Size = mkOption {
            type = nullOr (either str int);
            default = 48;
            description = ''
              Panel icons size

              Type: Int
            '';
          };
        };
      };
      default = {};
      description = "PanelIcons";
    };    
    "SmallIcons" = with types; mkOption {
      type = submodule {
        options = { 
          Size = mkOption {
            type = nullOr (either str int);
            default = 16;
            description = ''
              Small icons size

              Type: Int
            '';
          };
        };
      };
      default = {};
      description = "SmallIcons";
    };    
    "Toolbar style" = with types; mkOption {
      type = submodule {
        options = { 
          ToolButtonStyle = mkOption {
            type = nullOr str;
            default = "TextBesideIcon";
            description = ''
              Main toolbar label

              Type: String
            '';
          };
          ToolButtonStyleOtherToolbars = mkOption {
            type = nullOr str;
            default = "TextBesideIcon";
            description = ''
              Secondary toolbar label

              Type: String
            '';
          };
        };
      };
      default = {};
      description = "Toolbar style";
    };    
    "ToolbarIcons" = with types; mkOption {
      type = submodule {
        options = { 
          Size = mkOption {
            type = nullOr (either str int);
            default = 22;
            description = ''
              Toolbar icons size

              Type: Int
            '';
          };
        };
      };
      default = {};
      description = "ToolbarIcons";
    };    
    "WM" = with types; mkOption {
      type = submodule {
        options = { 
          activeFont = mkOption {
            type = nullOr str;
            default = "windowTitleFont";
            defaultText = "Code: true";
            description = ''
              Window title font

              Type: Font
            '';
          };
        };
      };
      default = {};
      description = "WM";
    };    
  };
  config = mkIf cfg.enable {
    programs.plasma.files."kdeglobals" = cfg.kdeglobals;
  };
}
