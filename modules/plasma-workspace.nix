{ config, lib, ... }:
with lib;
let
  cfg = config.programs.plasma;
  moduleCfg = config.programs.plasma.plasma-workspace;
in {
  options.programs.plasma.plasma-workspace = {
    enable = mkEnableOption ''
      Enable plasma-workspace
    '';
    package = mkOption {
      default = if (pkgs ? plasma-workspace) then
                        pkgs.plasma-workspace
                      else
                        (if pkgs.libsForQt5 ? plasma-workspace then pkgs.libsForQt5.plasma-workspace else false);
      defaultText = literalExpression "pkgs.plasma-workspace";
      type = either bool types.package;
      description = mdDoc "Package to use.";
    };
    "Agenda" = with types; mkOption {
      type = submodule {
        options = { 
          compactDisplay = mkOption {
            type = nullOr str;
            default = "d";
            description = ''
              

              Type: String
            '';
          };
          endOfWorkingDay = mkOption {
            type = nullOr (either str int);
            default = 17;
            description = ''
              

              Type: int
            '';
          };
          showWeekNumbers = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          startOfWorkingDay = mkOption {
            type = nullOr (either str int);
            default = 9;
            description = ''
              

              Type: int
            '';
          };
        };
      };
      default = {};
      description = "Agenda";
    };    
    "Appearance" = with types; mkOption {
      type = submodule {
        options = { 
          autoFontAndSize = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Use Plasma default font and automatically determine font size.

              Type: Bool
            '';
          };
          boldText = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Sets the font to bold.

              Type: Bool
            '';
          };
          chartFace = mkOption {
            type = nullOr str;
            default = "org.kde.ksysguard.piechart";
            description = ''
              

              Type: String
            '';
          };
          compactView = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              If true it only shows a button for the application menu.

              Type: Bool
            '';
          };
          customDateFormat = mkOption {
            type = nullOr str;
            default = "ddd d";
            description = ''
              Custom date format string.

              Type: string
            '';
          };
          dateDisplayFormat = mkOption {
            type = nullOr (either str (enum [ 
              "Adaptive"
              "BesideTime"
              "BelowTime"
            ]));
            default = "Adaptive";
            description = ''
              Whether the date should be shown below or beside the time

              Type: Enum
              Choices: 
                - Adaptive
                - BesideTime
                - BelowTime
            '';
          };
          dateFormat = mkOption {
            type = nullOr str;
            default = "shortDate";
            description = ''
              The date format to display. Options are: shortDate, longDate, isoDate or custom.

              Type: string
            '';
          };
          displayTimezoneFormat = mkOption {
            type = nullOr (either str (enum [ 
              "Code"
              "FullText"
              "UTCOffset"
            ]));
            default = "Code";
            description = ''
              Whether the timezone is displayed as a code i.e. "GMT", full text i.e. "London" or UTC offset "+1".

              Type: Enum
              Choices: 
                - Code
                - FullText
                - UTCOffset
            '';
          };
          enabledCalendarPlugins = mkOption {
            type = nullOr (either str (listOf str));
            default = "";
            description = ''
              A list of plugins where additional calendar event data can be sourced.

              Type: StringList
            '';
          };
          firstDayOfWeek = mkOption {
            type = nullOr (either str int);
            default = -1;
            description = ''
              Force the calendar to use a specific week day as first day of a week. -1 means follow user locale, 0 is Sunday, 1 is Monday, etc.

              Type: Int
            '';
          };
          fontFamily = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              Font family. e.g "arial". The system font is used if this is not set.

              Type: string
            '';
          };
          fontSize = mkOption {
            type = nullOr (either str int);
            default = 10;
            description = ''
              Sets font size.

              Type: Int
            '';
          };
          fontStyleName = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              Sets font style 

              Type: string
            '';
          };
          fontWeight = mkOption {
            type = nullOr (either str int);
            default = 50;
            description = ''
              Sets font weight.

              Type: Int
            '';
          };
          italicText = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Sets the font to italic.

              Type: Bool
            '';
          };
          lastSelectedTimezone = mkOption {
            type = nullOr str;
            default = "Local";
            description = ''
              When multiple time zones are configured, this is the one shown on widget restore. Typically the system's current timezone.

              Type: String
            '';
          };
          pin = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Whether the popup should remain open when another window is activated

              Type: Bool
            '';
          };
          selectedTimeZones = mkOption {
            type = nullOr (either str (listOf str));
            default = "Local";
            description = ''
              A list of the configured time zones. Format is "Europe/London". Special entry "Local" indicates system time zone.

              Type: StringList
            '';
          };
          showDate = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Whether the date should be shown next to the clock.

              Type: Bool
            '';
          };
          showLocalTimezone = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Whether the timezone should be displayed when the clock is showing the local timezone.

              Type: Bool
            '';
          };
          showSeconds = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Whether seconds should be shown in the clock.

              Type: Bool
            '';
          };
          showWeekNumbers = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Whether the calendar should show week numbers.

              Type: Bool
            '';
          };
          timeFormat = mkOption {
            type = nullOr str;
            default = "default";
            description = ''
              

              Type: string
            '';
          };
          title = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              

              Type: String
            '';
          };
          "use24hFormat" = mkOption {
            type = nullOr (either str int);
            default = 1;
            description = ''
              Force the clock to use 12/24 hour time, instead of following the user locale.

              Type: UInt
            '';
          };
          wheelChangesTimezone = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Whether the mouse wheel switches between the timezones configured in selectedTimeZones.

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
          Blur = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Blur background filling

              Type: bool
            '';
          };
          Color = mkOption {
            type = nullOr str;
            default = "#1d99f3";
            description = ''
              Color of the wallpaper

              Type: Color
            '';
          };
          FillMode = mkOption {
            type = nullOr (either str int);
            default = 2;
            description = ''
              Sizing, cropping and positioning of the wallpaper image

              Type: int
            '';
          };
          Image = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              Wallpaper image path or wallpaper name

              Type: String
            '';
          };
          PreviewImage = mkOption {
            type = nullOr str;
            default = "null";
            description = ''
              Wallpaper preview image path

              Type: String
            '';
          };
          SlideInterval = mkOption {
            type = nullOr (either str int);
            default = 900;
            description = ''
              Interval between slides (s)

              Type: int
            '';
          };
          SlidePaths = mkOption {
            type = nullOr (either str (listOf str));
            default = "preferred://wallpaperlocations";
            description = ''
              Paths used for the slideshow

              Type: StringList
            '';
          };
          SlideshowFoldersFirst = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Display folders first when on slideshow

              Type: bool
            '';
          };
          SlideshowMode = mkOption {
            type = nullOr (either str int);
            default = 0;
            description = ''
              Ordering mode for the slideshow

              Type: int
            '';
          };
          UncheckedSlides = mkOption {
            type = nullOr (either str (listOf str));
            default = "";
            description = ''
              Unchecked Slides

              Type: StringList
            '';
          };
          allDevices = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              If true it lists all kind of devices. Only one between removableDevices, nonRemovableDevices and allDevices should be set.

              Type: Bool
            '';
          };
          alwaysShowClock = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              If true, the clock is shown even when the computer is idle and the password prompt is hidden.

              Type: Bool
            '';
          };
          barcodeType = mkOption {
            type = nullOr (either str int);
            default = 1;
            description = ''
              

              Type: Int
            '';
          };
          enableNotification = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Is the free space notification enabled.

              Type: Bool
            '';
          };
          expanding = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              If true, the spacer tries to take all the available space in the panel.

              Type: bool
            '';
          };
          extraItems = mkOption {
            type = nullOr (either str (listOf str));
            default = "";
            description = ''
              All plasmoid items that are explicitly enabled in the systray. It's a comma-separated string list of plasmoid plugin ids.

              Type: StringList
            '';
          };
          forceFontDPI = mkOption {
            type = nullOr (either str int);
            default = 0;
            description = ''
              Force font DPI on X11

              Type: UInt
            '';
          };
          forceFontDPIWayland = mkOption {
            type = nullOr (either str int);
            default = 0;
            description = ''
              Force font DPI Wayland

              Type: UInt
            '';
          };
          hiddenItems = mkOption {
            type = nullOr (either str (listOf str));
            default = "";
            description = ''
              All items that are hidden, forced always in the popup. It's a comma-separated string list of unique identifiers that are either plasmoid plugin ids or StatusNotifier ids.

              Type: StringList
            '';
          };
          iconSpacing = mkOption {
            type = nullOr (either str int);
            default = 2;
            description = ''
              spacing between icons, determined by this number multiplied by PlasmaCore.Units.smallSpacing

              Type: int
            '';
          };
          knownItems = mkOption {
            type = nullOr (either str (listOf str));
            default = "";
            description = ''
              

              Type: StringList
            '';
          };
          length = mkOption {
            type = nullOr (either str int);
            default = -1;
            description = ''
              length in pixels of the spacer. Configuration effective only if expanding is set to false. A negative value means an invalid value that should be completely ignored.

              Type: Int
            '';
          };
          localPath = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              

              Type: String
            '';
          };
          minimumSpace = mkOption {
            type = nullOr (either str int);
            default = 200;
            description = ''
              Minimum free space before user starts being notified.

              Type: Int
              Min: 1
              Max: 100000
            '';
          };
          nonRemovableDevices = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              If true it lists non removable devices, such as internal harddrives. Only one between removableDevices, nonRemovableDevices and allDevices should be set.

              Type: Bool
            '';
          };
          pin = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Whether the popup should remain open when another window is activated

              Type: Bool
            '';
          };
          popupOnNewDevice = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              If true it tries to open the plasmoid when a new device is inserted, as a kind of notification.

              Type: Bool
            '';
          };
          removableDevices = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              If true it lists removable devices, such as USB thumbdrives. Only one between removableDevices, nonRemovableDevices and allDevices should be set.

              Type: Bool
            '';
          };
          scaleIconsToFit = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Whether to automatically scale System Tray icons to fix the available thickness of the panel. If false, tray icons will be capped at the smallMedium size (22px) and become a two-row/column layout when the panel is thick.

              Type: bool
            '';
          };
          showAllItems = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              If true, all systray entries will be always in the main area, outside the popup.

              Type: bool
            '';
          };
          showMediaControls = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              If true, shows any currently playing media along with controls to pause it.

              Type: Bool
            '';
          };
          showPercentage = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              If true, the battery will display a little charge percentage label inside.

              Type: bool
            '';
          };
          showSecondHand = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          showTimezoneString = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          "show_lockScreen" = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Show an option to lock the system.

              Type: Bool
            '';
          };
          "show_requestLogout" = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Show an option to logout.

              Type: Bool
            '';
          };
          "show_requestReboot" = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Show an option to reboot the system.

              Type: Bool
            '';
          };
          "show_requestShutDown" = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Show an option to shut down the system.

              Type: Bool
            '';
          };
          "show_suspendToDisk" = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Show an option to suspend the system to disk (hibernate).

              Type: Bool
            '';
          };
          "show_suspendToRam" = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Show an option to suspend the system suspend.

              Type: Bool
            '';
          };
          "show_switchUser" = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Show an option to switch user.

              Type: Bool
            '';
          };
          shownItems = mkOption {
            type = nullOr (either str (listOf str));
            default = "";
            description = ''
              All items that are shown. It's a comma-separated string list of unique identifiers that are either plasmoid plugin ids or StatusNotifier ids.

              Type: StringList
            '';
          };
          url = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              

              Type: String
            '';
          };
        };
      };
      default = {};
      description = "General";
    };    
    "Global" = with types; mkOption {
      type = submodule {
        options = { 
          FeedbackLevel = mkOption {
            type = nullOr (either str int);
            default = "KUserFeedback::Provider::NoTelemetry";
            defaultText = "Code: true";
            description = ''
              

              Type: Int
            '';
          };
        };
      };
      default = {};
      description = "Global";
    };    
    "Sensors" = with types; mkOption {
      type = submodule {
        options = { 
          sensorColors = mkOption {
            type = nullOr (either str (listOf str));
            default = "";
            description = ''
              

              Type: StringList
            '';
          };
          sensorIds = mkOption {
            type = nullOr (either str (listOf str));
            default = "";
            description = ''
              

              Type: StringList
            '';
          };
          textOnlySensorIds = mkOption {
            type = nullOr (either str (listOf str));
            default = "";
            description = ''
              

              Type: StringList
            '';
          };
          totalSensor = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              

              Type: String
            '';
          };
        };
      };
      default = {};
      description = "Sensors";
    };    
  };
  config = mkIf (cfg.enable && moduleCfg.enable) {
    home.packages = mkIf moduleCfg.package [ moduleCfg.package ];
    programs.plasma.files."plasma-workspacerc" = removeAttrs moduleCfg [ "enable" "package" ];
  };
}
