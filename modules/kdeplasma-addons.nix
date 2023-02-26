{ config, lib, pkgs, ... }:
with lib;
let
  cfg = config.programs.plasma;
  moduleCfg = config.programs.plasma.kdeplasma-addons;
in {
  options.programs.plasma.kdeplasma-addons = {
    enable = mkEnableOption ''
      Enable kdeplasma-addons
    '';
    package = mkOption {
      default = if (pkgs ? kdeplasma-addons) then
                        pkgs.kdeplasma-addons
                      else
                        (if pkgs.libsForQt5 ? kdeplasma-addons then pkgs.libsForQt5.kdeplasma-addons else false);
      defaultText = literalExpression "pkgs.kdeplasma-addons";
      type = with types; either bool package;
      description = mdDoc "Package to use.";
    };
    "Appearance" = with types; mkOption {
      type = submodule {
        options = { 
          boardColor = mkOption {
            type = nullOr str;
            default = "#333333";
            description = ''
              

              Type: Color
            '';
          };
          boardSize = mkOption {
            type = nullOr (either str int);
            default = 4;
            description = ''
              

              Type: Int
            '';
          };
          boldText = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          copyAutomatically = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: bool
            '';
          };
          fuzzyness = mkOption {
            type = nullOr (either str int);
            default = 1;
            description = ''
              

              Type: Int
            '';
          };
          historySize = mkOption {
            type = nullOr (either str int);
            default = 3;
            description = ''
              

              Type: int
            '';
          };
          imagePath = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              

              Type: String
            '';
          };
          italicText = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          numberColor = mkOption {
            type = nullOr str;
            default = "#ffffff";
            description = ''
              

              Type: Color
            '';
          };
          showHumidityInTooltip = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: bool
            '';
          };
          showNumerals = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          showPressureInTooltip = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: bool
            '';
          };
          showTemperatureInBadge = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: bool
            '';
          };
          showTemperatureInCompactMode = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: bool
            '';
          };
          showTemperatureInTooltip = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: bool
            '';
          };
          showWindInTooltip = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: bool
            '';
          };
          useImage = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
        };
      };
      default = {};
      description = "Appearance";
    };    
    "General" = with types; mkOption {
      type = submodule {
        options = { 
          Category = mkOption {
            type = nullOr str;
            default = "1065976";
            description = ''
              Category for Unsplash provider

              Type: String
            '';
          };
          Color = mkOption {
            type = nullOr str;
            default = "#000000";
            description = ''
              Color of the wallpaper

              Type: Color
            '';
          };
          FillMode = mkOption {
            type = nullOr (either str int);
            default = 0;
            description = ''
              Sizing, cropping and positioning of the wallpaper image

              Type: int
            '';
          };
          Provider = mkOption {
            type = nullOr str;
            default = "apod";
            description = ''
              Provider of Picture of the Day

              Type: String
            '';
          };
          UpdateOverMeteredConnection = mkOption {
            type = nullOr (either str int);
            default = 0;
            description = ''
              Update wallpaper over metered connection. 0 - False, 1 - True, 2 - True when data usage is below limit (not implemented)

              Type: Int
            '';
          };
          autoClipboard = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          color = mkOption {
            type = nullOr str;
            default = "yellow";
            description = ''
              

              Type: String
            '';
          };
          command = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              

              Type: String
            '';
          };
          compactPreviewCount = mkOption {
            type = nullOr (either str int);
            default = 1;
            description = ''
              

              Type: Int
            '';
          };
          constantZoomFactor = mkOption {
            type = nullOr (either str int);
            default = 100;
            description = ''
              

              Type: Int
            '';
          };
          cursorPosition = mkOption {
            type = nullOr (either str int);
            default = 0;
            description = ''
              

              Type: Int
            '';
          };
          customColorForActive = mkOption {
            type = nullOr str;
            default = "green";
            description = ''
              

              Type: Color
            '';
          };
          customColorForGrid = mkOption {
            type = nullOr str;
            default = "blue";
            description = ''
              

              Type: Color
            '';
          };
          customColorForInactive = mkOption {
            type = nullOr str;
            default = "red";
            description = ''
              

              Type: Color
            '';
          };
          defaultFormat = mkOption {
            type = nullOr str;
            default = "#RRGGBB";
            description = ''
              

              Type: String
            '';
          };
          dictionary = mkOption {
            type = nullOr str;
            default = "all";
            description = ''
              

              Type: String
            '';
          };
          enablePopup = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          fillMode = mkOption {
            type = nullOr (either str int);
            default = 1;
            description = ''
              

              Type: int
            '';
          };
          fontSize = mkOption {
            type = nullOr (either str int);
            default = "";
            description = ''
              

              Type: int
            '';
          };
          history = mkOption {
            type = nullOr (either str (listOf str));
            default = "";
            description = ''
              

              Type: StringList
            '';
          };
          interval = mkOption {
            type = nullOr (either str float);
            default = 10.0;
            description = ''
              

              Type: Double
            '';
          };
          key = mkOption {
            type = nullOr (either str (listOf str));
            default = "Caps Lock";
            description = ''
              

              Type: StringList
            '';
          };
          launcherUrls = mkOption {
            type = nullOr (either str (listOf str));
            default = "";
            description = ''
              

              Type: StringList
            '';
          };
          leftClickOpenImage = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          maxSectionCount = mkOption {
            type = nullOr (either str int);
            default = 1;
            description = ''
              

              Type: Int
            '';
          };
          minViewWidth = mkOption {
            type = nullOr (either str int);
            default = 600;
            description = ''
              

              Type: Int
            '';
          };
          noteId = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              

              Type: String
            '';
          };
          notificationText = mkOption {
            type = nullOr str;
            default = "Timer finished";
            description = ''
              

              Type: String
            '';
          };
          pauseOnMouseOver = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          pickOnActivate = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          popupUrls = mkOption {
            type = nullOr (either str (listOf str));
            default = "";
            description = ''
              

              Type: StringList
            '';
          };
          predefinedTimers = mkOption {
            type = nullOr (either str (listOf str));
            default = "30,60,120,300,450,600,900,1200,1500,1800,2700,3600";
            description = ''
              

              Type: StringList
            '';
          };
          randomize = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          runCommand = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          running = mkOption {
            type = nullOr (either str int);
            default = 0;
            description = ''
              

              Type: int
            '';
          };
          savedAt = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              

              Type: DateTime
            '';
          };
          scrollX = mkOption {
            type = nullOr (either str float);
            default = 0.0;
            description = ''
              

              Type: Double
            '';
          };
          scrollY = mkOption {
            type = nullOr (either str float);
            default = 0.0;
            description = ''
              

              Type: Double
            '';
          };
          seconds = mkOption {
            type = nullOr (either str int);
            default = 0;
            description = ''
              

              Type: int
            '';
          };
          showBcdFormat = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          showCountdown = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          showFace = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          showFullName = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          showGrid = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          showLauncherNames = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          showName = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          showNotification = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          showOffLeds = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          showProgressBar = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          showRemainingTime = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          showSeconds = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          showTechnicalInfo = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          showTimerToggle = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          showTitle = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          title = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              

              Type: String
            '';
          };
          url = mkOption {
            type = nullOr str;
            default = "https://www.kde.org/";
            description = ''
              

              Type: String
            '';
          };
          useCustomColorForActive = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          useCustomColorForGrid = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          useCustomColorForInactive = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          useMinViewWidth = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
        };
      };
      default = {};
      description = "General";
    };    
    "Paths" = with types; mkOption {
      type = submodule {
        options = { 
          pathList = mkOption {
            type = nullOr (either str (listOf str));
            default = "";
            description = ''
              

              Type: StringList
            '';
          };
        };
      };
      default = {};
      description = "Paths";
    };    
    "Units" = with types; mkOption {
      type = submodule {
        options = { 
          pressureUnit = mkOption {
            type = nullOr (either str int);
            default = "";
            description = ''
              

              Type: int
            '';
          };
          speedUnit = mkOption {
            type = nullOr (either str int);
            default = "";
            description = ''
              

              Type: int
            '';
          };
          temperatureUnit = mkOption {
            type = nullOr (either str int);
            default = "";
            description = ''
              

              Type: int
            '';
          };
          visibilityUnit = mkOption {
            type = nullOr (either str int);
            default = "";
            description = ''
              

              Type: int
            '';
          };
        };
      };
      default = {};
      description = "Units";
    };    
    "WeatherStation" = with types; mkOption {
      type = submodule {
        options = { 
          source = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              

              Type: string
            '';
          };
          updateInterval = mkOption {
            type = nullOr (either str int);
            default = 30;
            description = ''
              

              Type: int
            '';
          };
        };
      };
      default = {};
      description = "WeatherStation";
    };    
  };
  config = mkIf (cfg.enable && moduleCfg.enable) {
    home.packages = mkIf moduleCfg.package [ moduleCfg.package ];
    programs.plasma.files."kdeplasma-addonsrc" = removeAttrs moduleCfg [ "enable" "package" ];
  };
}
