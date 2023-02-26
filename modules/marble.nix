{ config, lib, ... }:
with lib;
let
  cfg = config.programs.plasma;
  moduleCfg = config.programs.plasma.marble;
in {
  options.programs.plasma.marble = {
    enable = mkEnableOption ''
      Enable marble
    '';
    package = mkOption {
      default = if (pkgs ? marble) then
                        pkgs.marble
                      else
                        (if pkgs.libsForQt5 ? marble then pkgs.libsForQt5.marble else false);
      defaultText = literalExpression "pkgs.marble";
      type = either bool types.package;
      description = mdDoc "Package to use.";
    };
    "Cache" = with types; mkOption {
      type = submodule {
        options = { 
          persistentTileCacheLimit = mkOption {
            type = nullOr (either str int);
            default = 0;
            description = ''
              Maximum space on the hard disk that can be used to store tiles.

              Type: Int
              Min: 0
              Max: 999999
            '';
          };
          proxyAuth = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Proxy requires Authentication

              Type: Bool
            '';
          };
          proxyHttp = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Proxy type is HTTP

              Type: Bool
            '';
          };
          proxyPass = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              Password for authorization.

              Type: String
            '';
          };
          proxyPort = mkOption {
            type = nullOr (either str int);
            default = 8080;
            description = ''
              Port for the proxy server.

              Type: Int
              Min: 0
              Max: 65535
            '';
          };
          "proxySocks5" = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Proxy type is Socks5

              Type: Bool
            '';
          };
          proxyType = mkOption {
            type = nullOr (either str (enum [ 
              "HttpProxy"
              "Socks5Proxy"
            ]));
            default = "Marble::HttpProxy";
            description = ''
              

              Type: Enum
              Choices: 
                - HttpProxy
                - Socks5Proxy
            '';
          };
          proxyUrl = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              URL for the proxy server.

              Type: String
            '';
          };
          proxyUser = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              Username for authorization.

              Type: String
            '';
          };
          volatileTileCacheLimit = mkOption {
            type = nullOr (either str int);
            default = 100;
            description = ''
              Cache for tiles reserved in the physical memory.

              Type: Int
              Min: 0
              Max: 999999
            '';
          };
        };
      };
      default = {};
      description = "Cache";
    };    
    "CloudSync" = with types; mkOption {
      type = submodule {
        options = { 
          enableSync = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          owncloudPassword = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              

              Type: String
            '';
          };
          owncloudServer = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              

              Type: String
            '';
          };
          owncloudUsername = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              

              Type: String
            '';
          };
          syncBackend = mkOption {
            type = nullOr str;
            default = "owncloud";
            description = ''
              

              Type: String
            '';
          };
          syncBookmarks = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          syncRoutes = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
        };
      };
      default = {};
      description = "CloudSync";
    };    
    "General" = with types; mkOption {
      type = submodule {
        options = { 
          centerMode = mkOption {
            type = nullOr (either str (enum [ 
              "Daylight"
              "Longitude"
              "Position"
            ]));
            default = "Daylight";
            description = ''
              

              Type: Enum
              Choices: 
                - Daylight
                - Longitude
                - Position
            '';
          };
          fixedLongitude = mkOption {
            type = nullOr (either str float);
            default = 0.0;
            description = ''
              

              Type: double
            '';
          };
          projection = mkOption {
            type = nullOr (either str (enum [ 
              "Equirectangular"
              "Mercator"
            ]));
            default = "Equirectangular";
            description = ''
              

              Type: Enum
              Choices: 
                - Equirectangular
                - Mercator
            '';
          };
          showDate = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
        };
      };
      default = {};
      description = "General";
    };    
    "MapWizard" = with types; mkOption {
      type = submodule {
        options = { 
          staticUrlServers = mkOption {
            type = nullOr (either str (listOf str));
            default = "";
            description = ''
              

              Type: StringList
            '';
          };
          wmsServers = mkOption {
            type = nullOr (either str (listOf str));
            default = "";
            description = ''
              

              Type: StringList
            '';
          };
        };
      };
      default = {};
      description = "MapWizard";
    };    
    "MarbleWidget" = with types; mkOption {
      type = submodule {
        options = { 
          homeLatitude = mkOption {
            type = nullOr (either str float);
            default = 54.8;
            description = ''
              

              Type: Double
            '';
          };
          homeLongitude = mkOption {
            type = nullOr (either str float);
            default = 9.4;
            description = ''
              

              Type: Double
            '';
          };
          homeZoom = mkOption {
            type = nullOr (either str int);
            default = 1050;
            description = ''
              

              Type: Int
            '';
          };
          lockFloatItemPositions = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          mapTheme = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              

              Type: String
            '';
          };
          marbleDataPath = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              

              Type: Path
            '';
          };
          projection = mkOption {
            type = nullOr (either str int);
            default = 0;
            description = ''
              

              Type: Int
            '';
          };
          quitLatitude = mkOption {
            type = nullOr (either str float);
            default = 0.0;
            description = ''
              

              Type: Double
            '';
          };
          quitLongitude = mkOption {
            type = nullOr (either str float);
            default = 0.0;
            description = ''
              

              Type: Double
            '';
          };
          quitRange = mkOption {
            type = nullOr (either str float);
            default = 11564500.0;
            description = ''
              

              Type: Double
            '';
          };
          showBookmarks = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          showClouds = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          showCurrentLocation = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          workOffline = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
        };
      };
      default = {};
      description = "MarbleWidget";
    };    
    "Navigation" = with types; mkOption {
      type = submodule {
        options = { 
          animateTargetVoyage = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Display animation on voyage to target.

              Type: Bool
            '';
          };
          dragLocation = mkOption {
            type = nullOr (either str (enum [ 
              "DragLocation::KeepAxisVertically"
              "DragLocation::FollowMousePointer"
            ]));
            default = "Marble::KeepAxisVertically";
            description = ''
              The behaviour of the planet's axis on mouse dragging.

              Type: Enum
              Choices: 
                - DragLocation::KeepAxisVertically
                - DragLocation::FollowMousePointer
            '';
          };
          externalMapEditor = mkOption {
            type = nullOr (either str int);
            default = 0;
            description = ''
              The external OpenStreetMap editor application

              Type: Int
            '';
          };
          inertialEarthRotation = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          mouseViewRotation = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          onStartup = mkOption {
            type = nullOr (either str (enum [ 
              "onStartup::ShowHomeLocation"
              "onStartup::LastLocationVisited"
            ]));
            default = "Marble::ShowHomeLocation";
            description = ''
              The location shown on application startup.

              Type: Enum
              Choices: 
                - onStartup::ShowHomeLocation
                - onStartup::LastLocationVisited
            '';
          };
        };
      };
      default = {};
      description = "Navigation";
    };    
    "Plugins" = with types; mkOption {
      type = submodule {
        options = { 
          activePositionTrackingPlugin = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              The position tracking plugin used to determine the current location

              Type: String
            '';
          };
        };
      };
      default = {};
      description = "Plugins";
    };    
    "Routing" = with types; mkOption {
      type = submodule {
        options = { 
          currentRoutingProfile = mkOption {
            type = nullOr (either str int);
            default = 0;
            description = ''
              

              Type: Int
            '';
          };
          routeAlphaAlternative = mkOption {
            type = nullOr (either str int);
            default = 200;
            description = ''
              

              Type: Int
            '';
          };
          routeAlphaHighlighted = mkOption {
            type = nullOr (either str int);
            default = 200;
            description = ''
              

              Type: Int
            '';
          };
          routeAlphaStandard = mkOption {
            type = nullOr (either str int);
            default = 200;
            description = ''
              

              Type: Int
            '';
          };
          routeColorAlternative = mkOption {
            type = nullOr str;
            default = "Marble::Oxygen::aluminumGray4";
            defaultText = "Code: true";
            description = ''
              

              Type: Color
            '';
          };
          routeColorHighlighted = mkOption {
            type = nullOr str;
            default = "Marble::Oxygen::seaBlue2";
            defaultText = "Code: true";
            description = ''
              

              Type: Color
            '';
          };
          routeColorStandard = mkOption {
            type = nullOr str;
            default = "Marble::Oxygen::skyBlue4";
            defaultText = "Code: true";
            description = ''
              

              Type: Color
            '';
          };
          showGuidanceModeStartupWarning = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
        };
      };
      default = {};
      description = "Routing";
    };    
    "StatusBar" = with types; mkOption {
      type = submodule {
        options = { 
          showAltitudeLabel = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          showDateTimeLabel = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          showDownloadProgressBar = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          showPositionLabel = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          showTileZoomLevelLabel = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
        };
      };
      default = {};
      description = "StatusBar";
    };    
    "Sun" = with types; mkOption {
      type = submodule {
        options = { 
          lockToSubSolarPoint = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          showCitylights = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          showSun = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          subSolarPointIconVisible = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
        };
      };
      default = {};
      description = "Sun";
    };    
    "Time" = with types; mkOption {
      type = submodule {
        options = { 
          chosenTimezone = mkOption {
            type = nullOr (either str int);
            default = 0;
            description = ''
              

              Type: Int
            '';
          };
          customTimezone = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          dateTime = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              The date and time of marble clock

              Type: DateTime
            '';
          };
          lastSessionTime = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          speedSlider = mkOption {
            type = nullOr (either str int);
            default = 1;
            description = ''
              The speed of marble clock

              Type: Int
              Min: -100
              Max: 100
            '';
          };
          systemTime = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          systemTimezone = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          utc = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
        };
      };
      default = {};
      description = "Time";
    };    
    "Tracking" = with types; mkOption {
      type = submodule {
        options = { 
          autoCenter = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          autoZoom = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          lastTrackOpenPath = mkOption {
            type = nullOr str;
            default = "QDir::homePath()";
            defaultText = "Code: true";
            description = ''
              

              Type: String
            '';
          };
          lastTrackSavePath = mkOption {
            type = nullOr str;
            default = "QDir::homePath()";
            defaultText = "Code: true";
            description = ''
              

              Type: String
            '';
          };
          recenterMode = mkOption {
            type = nullOr (either str int);
            default = 0;
            description = ''
              

              Type: Int
            '';
          };
          trackVisible = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
        };
      };
      default = {};
      description = "Tracking";
    };    
    "View" = with types; mkOption {
      type = submodule {
        options = { 
          angleUnit = mkOption {
            type = nullOr (either str (enum [ 
              "AngleUnit::DMSDegree"
              "AngleUnit::DecimalDegree"
              "AngleUnit::UTM"
            ]));
            default = "Marble::DMSDegree";
            description = ''
              The unit chosen to measure angles.

              Type: Enum
              Choices: 
                - AngleUnit::DMSDegree
                - AngleUnit::DecimalDegree
                - AngleUnit::UTM
            '';
          };
          animationQuality = mkOption {
            type = nullOr (either str (enum [ 
              "MapQuality::OutlineQuality"
              "MapQuality::LowQuality"
              "MapQuality::NormalQuality"
              "MapQuality::HighQuality"
              "MapQuality::PrintQuality"
            ]));
            default = "Marble::LowQuality";
            description = ''
              The quality at which an animated map gets painted.

              Type: Enum
              Choices: 
                - MapQuality::OutlineQuality
                - MapQuality::LowQuality
                - MapQuality::NormalQuality
                - MapQuality::HighQuality
                - MapQuality::PrintQuality
            '';
          };
          distanceUnit = mkOption {
            type = nullOr (either str (enum [ 
              "MeasurementSystem::MetricSystem"
              "MeasurementSystem::ImperialSystem"
            ]));
            default = "QLocale::MetricSystem";
            description = ''
              The unit chosen to measure distances.

              Type: Enum
              Choices: 
                - MeasurementSystem::MetricSystem
                - MeasurementSystem::ImperialSystem
            '';
          };
          labelLocalization = mkOption {
            type = nullOr (either str (enum [ 
              "LabelLocalization::CustomAndNative"
              "LabelLocalization::Custom"
              "LabelLocalization::Native"
            ]));
            default = "Marble::Native";
            description = ''
              The localization of the labels.

              Type: Enum
              Choices: 
                - LabelLocalization::CustomAndNative
                - LabelLocalization::Custom
                - LabelLocalization::Native
            '';
          };
          lastFileOpenDir = mkOption {
            type = nullOr str;
            default = "QDir::homePath()";
            defaultText = "Code: true";
            description = ''
              The last directory that was opened by File->Open.

              Type: String
            '';
          };
          mapFont = mkOption {
            type = nullOr str;
            default = "QFontDatabase::systemFont(QFontDatabase::GeneralFont)";
            defaultText = "Code: true";
            description = ''
              The general font used on the map.

              Type: Font
            '';
          };
          stillQuality = mkOption {
            type = nullOr (either str (enum [ 
              "MapQuality::OutlineQuality"
              "MapQuality::LowQuality"
              "MapQuality::NormalQuality"
              "MapQuality::HighQuality"
              "MapQuality::PrintQuality"
            ]));
            default = "Marble::HighQuality";
            description = ''
              The quality at which a still map gets painted.

              Type: Enum
              Choices: 
                - MapQuality::OutlineQuality
                - MapQuality::LowQuality
                - MapQuality::NormalQuality
                - MapQuality::HighQuality
                - MapQuality::PrintQuality
            '';
          };
        };
      };
      default = {};
      description = "View";
    };    
  };
  config = mkIf (cfg.enable && moduleCfg.enable) {
    home.packages = mkIf moduleCfg.package [ moduleCfg.package ];
    programs.plasma.files."marblerc" = removeAttrs moduleCfg [ "enable" "package" ];
  };
}
