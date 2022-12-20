{ config, lib, ... }:
with lib;
let cfg = config.programs.plasma;
in {
  options.programs.plasma.plasma = {
    "$(udi)" = with types;
      mkOption {
        type = submodule {
          options = {
            "EverMounted" = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''


                Type: Bool
              '';
            };
            "ForceAttachAutomount" = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''


                Type: Bool
              '';
            };
            "ForceAutomount" = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''


                Type: Bool
              '';
            };
            "ForceLoginAutomount" = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''


                Type: Bool
              '';
            };
            "Icon" = mkOption {
              type = nullOr str;
              default = "";
              description = ''


                Type: String
              '';
            };
            "LastNameSeen" = mkOption {
              type = nullOr str;
              default = "";
              description = ''


                Type: String
              '';
            };
            "LastSeenMounted" = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''


                Type: Bool
              '';
            };
          };
        };
        default = { };
        description = "$(udi)";
      };
    "Appearance" = with types;
      mkOption {
        type = submodule {
          options = {
            "font" = mkOption {
              type = nullOr str;
              default = "";
              description = ''


                Type: Font
              '';
            };
            "hiddenList" = mkOption {
              type = nullOr (either str (listOf str));
              default = "";
              description = ''


                Type: StringList
              '';
            };
            "scaleIconsToFit" = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''
                Whether to automatically scale System Tray icons to fix the available thickness of the panel. If false, tray icons will be capped at the smallMedium size (22px) and become a two-row/column layout when the panel is thick.

                Type: bool
              '';
            };
            "use_default_font" = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''


                Type: Bool
              '';
            };
            "vertical_lookup_table" = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''


                Type: Bool
              '';
            };
          };
        };
        default = { };
        description = "Appearance";
      };
    "Emojier" = with types;
      mkOption {
        type = submodule {
          options = {
            "recent" = mkOption {
              type = nullOr (either str (listOf str));
              default = "";
              description = ''


                Type: StringList
              '';
            };
            "recentDescriptions" = mkOption {
              type = nullOr (either str (listOf str));
              default = "";
              description = ''


                Type: StringList
              '';
            };
          };
        };
        default = { };
        description = "Emojier";
      };
    "General" = with types;
      mkOption {
        type = submodule {
          options = {
            "AppletOrder" = mkOption {
              type = nullOr str;
              default = "";
              description = ''
                encoded order of items

                Type: String
              '';
            };
            "FirstStartup" = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''
                First time the containment starts?

                Type: Bool
              '';
            };
            "ItemsGeometries" = mkOption {
              type = nullOr str;
              default = "";
              description = ''
                Encoded geometries of items (resource categories).

                Type: String
              '';
            };
            "ToolBoxButtonState" = mkOption {
              type = nullOr str;
              default = "";
              description = ''
                Position state of the toolbox button.

                Type: String
              '';
            };
            "ToolBoxButtonX" = mkOption {
              type = nullOr (either str int);
              default = "";
              description = ''
                X coordinate of the toolbox.

                Type: int
              '';
            };
            "ToolBoxButtonY" = mkOption {
              type = nullOr (either str int);
              default = "";
              description = ''
                Y coordinate of the toolbox.

                Type: int
              '';
            };
            "alignResultsToBottom" = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''
                Whether to align search results to the bottom of the menu representation (e.g. panel popup) instead of the top.

                Type: Bool
              '';
            };
            "alignment" = mkOption {
              type = nullOr (either str int);
              default = 0;
              description = ''
                How Folder View icons are aligned: 0 = Left, 1 = Right

                Type: Int
              '';
            };
            "alphaSort" = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''
                Whether to sort menu contents alphabetically or use manual/system sort order.

                Type: Bool
              '';
            };
            "appNameFormat" = mkOption {
              type = nullOr (either str int);
              default = 0;
              description = ''
                The format used in the display of application names: 0 = NameOnly, 1 = GenericNameOnly, 2 = NameAndGenericName, 3 = GenericNameAndName

                Type: Int
              '';
            };
            "applicationsDisplay" = mkOption {
              type = nullOr (either str int);
              default = 1;
              description = ''
                How to display applications: 0 = Grid, 1 = List

                Type: Int
              '';
            };
            "arrangement" = mkOption {
              type = nullOr (either str int);
              default = 0;
              description = ''
                How Folder View icons are arranged: 0 = Rows, 1 = Columns

                Type: Int
              '';
            };
            "compactMode" = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''
                Whether to use a compact display style for list items

                Type: Bool
              '';
            };
            "currentDesktopSelected" = mkOption {
              type = nullOr (either str (enum [ "DoNothing" "ShowDesktop" ]));
              default = "0";
              description = ''
                What to do on left-mouse click on a desktop rectangle.

                Type: Enum
                Choices: 
                  - DoNothing
                  - ShowDesktop
              '';
            };
            "customButtonImage" = mkOption {
              type = nullOr str;
              default = "";
              description = ''
                The URL of the custom image to use instead of an icon in the compact representation (e.g. on a small panel).

                Type: Url
              '';
            };
            "displayStyle" = mkOption {
              type =
                nullOr (either str (enum [ "Label" "Flag" "LabelOverFlag" ]));
              default = "0";
              description = ''
                Whether to show text, a flag, or both on the compact representation.

                Type: Enum
                Choices: 
                  - Label
                  - Flag
                  - LabelOverFlag
              '';
            };
            "displayedText" = mkOption {
              type = nullOr (either str (enum [ "Number" "Name" "None" ]));
              default = "2";
              description = ''
                The text to show inside the desktop rectangles.

                Type: Enum
                Choices: 
                  - Number
                  - Name
                  - None
              '';
            };
            "extraRunners" = mkOption {
              type = nullOr (either str (listOf str));
              default = "shell,bookmarks,baloosearch,locations";
              description = ''
                The plugin id's of additional KRunner plugins to use. Only used if useExtraRunners is true.

                Type: StringList
              '';
            };
            "favoriteApps" = mkOption {
              type = nullOr (either str (listOf str));
              default =
                "preferred://browser,org.kde.kontact.desktop,systemsettings.desktop,org.kde.dolphin.desktop,ktp-contactlist.desktop,org.kde.discover";
              description = ''
                List of general favorites. Supported values are menu id's (usually .desktop file names), special URLs that expand into default applications (e.g. preferred://browser), document URLs and KPeople contact URIs.

                Type: StringList
              '';
            };
            "favoriteSystemActions" = mkOption {
              type = nullOr (either str (listOf str));
              default = "logout,reboot,shutdown";
              description = ''
                List of system action favorites.

                Type: StringList
              '';
            };
            "favorites" = mkOption {
              type = nullOr (either str (listOf str));
              default =
                "preferred://browser,org.kde.kontact.desktop,systemsettings.desktop,org.kde.dolphin.desktop,ktp-contactlist.desktop,org.kde.discover.desktop";
              description = ''
                List of general favorites. Supported values are menu id's (usually .desktop file names), special URLs that expand into default applications (e.g. preferred://browser), document URLs and KPeople contact URIs.

                Type: StringList
              '';
            };
            "favoritesDisplay" = mkOption {
              type = nullOr (either str int);
              default = 0;
              description = ''
                How to display favorites: 0 = Grid, 1 = List

                Type: Int
              '';
            };
            "favoritesPortedToKAstats" = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''
                Are the favorites ported to use KActivitiesStats to allow per-activity favorites

                Type: Bool
              '';
            };
            "fill" = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''
                Whether task manager should occupy all available space.

                Type: Bool
              '';
            };
            "filterMimeTypes" = mkOption {
              type = nullOr (either str (listOf str));
              default = "all/all";
              description = ''
                List of MIME types to filter by.

                Type: StringList
              '';
            };
            "filterMode" = mkOption {
              type = nullOr (either str int);
              default = 0;
              description = ''
                The file filter mode: 0 = Show All Files, 1 = Show Files Matching, 2 = Hide Files Matching

                Type: Int
              '';
            };
            "filterPattern" = mkOption {
              type = nullOr str;
              default = "*";
              description = ''
                The pattern to filter files by. Supports wildcards.

                Type: String
              '';
            };
            "forceStripes" = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''
                Whether to try and always layout task buttons in as many rows/columns as set via maxStripes.

                Type: Bool
              '';
            };
            "groupPopups" = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''
                Whether groups are to be reduced to a single task button and expand into a popup or task buttons are grouped on the widget itself.

                Type: Bool
              '';
            };
            "groupedTaskVisualization" = mkOption {
              type = nullOr (either str (enum [ ]));
              default = "0";
              description = ''
                What happens when clicking on a grouped task: 0 = cycle through grouped tasks, 1 = try to show tooltips, 2 = try to show present Windows effect, 3 = show textual list (AKA group dialog)

                Type: Enum
              '';
            };
            "groupingAppIdBlacklist" = mkOption {
              type = nullOr (either str (listOf str));
              default = "";
              description = ''
                The id's (usually .desktop file names) of applications that should not have their tasks grouped.

                Type: StringList
              '';
            };
            "groupingLauncherUrlBlacklist" = mkOption {
              type = nullOr (either str (listOf str));
              default = "";
              description = ''
                The launcher URLs (usually .desktop file or executable URLs) of applications that should not have their tasks grouped.

                Type: StringList
              '';
            };
            "groupingStrategy" = mkOption {
              type = nullOr (either str (enum [ ]));
              default = "1";
              description = ''
                How tasks are grouped: 0 = Do Not Group, 1 = By Program Name

                Type: Enum
              '';
            };
            "hiddenApplications" = mkOption {
              type = nullOr (either str (listOf str));
              default = "";
              description = ''
                List of menu id's (usually .desktop file names) of apps that should not be shown in the menu.

                Type: StringList
              '';
            };
            "highlightWindows" = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''
                Whether to request the window manager highlight windows when hovering corresponding task tooltips.

                Type: Bool
              '';
            };
            "icon" = mkOption {
              type = nullOr str;
              default = "start-here-kde";
              description = ''
                The name of the icon to use for the compact representation (e.g. on a small panel).

                Type: String
              '';
            };
            "iconHoverEffect" = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''
                Whether icons should change in appearance when the mouse pointer is above them.

                Type: Bool
              '';
            };
            "iconSize" = mkOption {
              type = nullOr (either str int);
              default = 3;
              description = ''
                The icon size to use for Folder View icons. 0 = 22px (smallMedium); 1 = 32px (medium); 2 = 48px (large); 3 = 64px (huge); 4 = 96px (large * 2); 5 = 128px (enormous); 6 = 256px (enormous * 2)

                Type: Int
              '';
            };
            "iconSpacing" = mkOption {
              type = nullOr (either str int);
              default = 1;
              description = ''
                 Spacing between icons in task manager. Margin is multiplied by this value.

                Type: Int
              '';
            };
            "indicateAudioStreams" = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''
                Whether to indicate applications that are playing audio including an option to mute them.

                Type: Bool
              '';
            };
            "labelMode" = mkOption {
              type = nullOr (either str int);
              default = 1;
              description = ''
                How to show the Folder View label: 0 = No label, 1 = Friendly version of path relative to closest Places entry, 2 = Full path, 3 = Custom title

                Type: Int
              '';
            };
            "labelText" = mkOption {
              type = nullOr str;
              default = "";
              description = ''
                Custom text for the Folder View label. Only used if labelMode is 3.

                Type: String
              '';
            };
            "labelWidth" = mkOption {
              type = nullOr (either str int);
              default = 1;
              description = ''
                The width of the grid cells when using icon view. 0 = Narrow, 1 = Medium, 2 = Wide

                Type: Int
              '';
            };
            "launchers" = mkOption {
              type = nullOr (either str (listOf str));
              default =
                "applications:systemsettings.desktop,applications:org.kde.discover.desktop,preferred://filemanager,preferred://browser";
              description = ''
                The list of launcher tasks on the widget. Usually .desktop file or executable URLs. Special URLs such as preferred://browser that expand to default applications are supported.

                Type: StringList
              '';
            };
            "limitDepth" = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''
                Whether to flatten top-level menu categories to a single level instead of displaying sub-categories.

                Type: Bool
              '';
            };
            "locked" = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''
                Whether Folder View icons are locked or not. Only used when serving as containment.

                Type: Bool
              '';
            };
            "maxStripes" = mkOption {
              type = nullOr (either str int);
              default = 2;
              description = ''
                The maximum number of rows (in a horizontal-orientation containment, i.e. panel) or columns (in a vertical-orientation containment) to layout task buttons in.

                Type: Int
                Min: 1
              '';
            };
            "maxTextLines" = mkOption {
              type = nullOr (either str int);
              default = 0;
              description = ''
                The maximum number of text lines to show in a task button. 0 means no limit.

                Type: Int
              '';
            };
            "menuLabel" = mkOption {
              type = nullOr str;
              default = "";
              description = ''
                Text label for the Panel button

                Type: string
              '';
            };
            "middleClickAction" = mkOption {
              type = nullOr (either str (enum [
                "None"
                "Close"
                "NewInstance"
                "ToggleMinimized"
                "ToggleGrouping"
                "BringToCurrentDesktop"
              ]));
              default = "2";
              description = ''
                What to do on middle-mouse click on a task button.

                Type: Enum
                Choices: 
                  - None
                  - Close
                  - NewInstance
                  - ToggleMinimized
                  - ToggleGrouping
                  - BringToCurrentDesktop
              '';
            };
            "minimizeActiveTaskOnClick" = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''
                Whether to minimize the currently-active task when clicked. If false, clicking on the currently-active task will do nothing.

                Type: Bool
              '';
            };
            "onlyGroupWhenFull" = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''
                Whether to group always or only when the widget runs out of space to show additional task buttons comfortably.

                Type: Bool
              '';
            };
            "pagerLayout" = mkOption {
              type = nullOr
                (either str (enum [ "Default" "Horizontal" "Vertical" ]));
              default = "0";
              description = ''
                The layout style used for the presentation.

                Type: Enum
                Choices: 
                  - Default
                  - Horizontal
                  - Vertical
              '';
            };
            "pin" = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''
                Whether the popup should remain open when another window is activated

                Type: Bool
              '';
            };
            "popups" = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''
                Whether to show a popup preview window for Folder View icons for folders.

                Type: Bool
              '';
            };
            "positions" = mkOption {
              type = nullOr (either str (listOf str));
              default = "";
              description = ''


                Type: StringList
              '';
            };
            "previewPlugins" = mkOption {
              type = nullOr (either str (listOf str));
              default = "";
              description = ''
                List of ids of the thumbnail preview plugins to use in Folder View. If empty, uses a default set of thumbnailers (cf. KIO::PreviewJob::defaultPlugins)

                Type: StringList
              '';
            };
            "previews" = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''
                Whether to show preview thumbnails in Folder View.

                Type: Bool
              '';
            };
            "primaryActions" = mkOption {
              type = nullOr (either str int);
              default = 0;
              description = ''
                Which actions should be displayed in the footer: 0 = Power, 1 = Session, 2 = Custom, 3 = Power and session

                Type: Int
              '';
            };
            "recentOrdering" = mkOption {
              type = nullOr (either str int);
              default = 0;
              description = ''
                How should the previously used apps/docs/contacts be ordered: 0 = RecentFirst, 1 = PopularFirst

                Type: Int
              '';
            };
            "renameInline" = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''
                Whether to initiate inline renaming when clicking on the text of an already-selected item, while using the systemwide double-click mode.

                Type: Bool
              '';
            };
            "reverseMode" = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''
                Whether to grow the tasks in according to system configuration or opposite to system configuration.

                Type: Bool
              '';
            };
            "selectionMarkers" = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''
                Whether to show selection markers when hovering Folder View icons.

                Type: Bool
              '';
            };
            "separateLaunchers" = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''
                Whether launcher tasks are sorted separately at the left side of the widget or can be mixed with other tasks.

                Type: Bool
              '';
            };
            "showActionButtonCaptions" = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''
                Whether to display captions ("shut down", "log out", etc.) for the footer action buttons

                Type: Bool
              '';
            };
            "showActivityIcon" = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''
                Show the current activity icon instead of the applet icon

                Type: Bool
              '';
            };
            "showActivityName" = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''
                Show the current activity name

                Type: Bool
              '';
            };
            "showHiddenFiles" = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''
                Show hidden files.

                Type: Bool
              '';
            };
            "showIconsRootLevel" = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''
                Whether to show icons on the root level of the menu.

                Type: Bool
              '';
            };
            "showOnlyCurrentActivity" = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''
                Whether to show only tasks that are on the current activity.

                Type: Bool
              '';
            };
            "showOnlyCurrentDesktop" = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''
                Whether to only show tasks that are on the current virtual desktop.

                Type: Bool
              '';
            };
            "showOnlyCurrentScreen" = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''
                Whether to limit the Pager to the set of windows and the geometry of the screen the widget resides on.

                Type: Bool
              '';
            };
            "showOnlyMinimized" = mkOption {
              type = nullOr (either str int);
              default = "false";
              description = ''
                Whether to show only window tasks that are minmized.

                Type: Int
              '';
            };
            "showRecentApps" = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''
                Whether to show the "Recent Applications" category.

                Type: Bool
              '';
            };
            "showRecentContacts" = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''
                Whether to show the "Recent Contacts" category.

                Type: Bool
              '';
            };
            "showRecentDocs" = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''
                Whether to show the "Recent Files" category.

                Type: Bool
              '';
            };
            "showText" = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''
                Whether to show the window title when the applet is used on a horizontal panel

                Type: Bool
              '';
            };
            "showToolTips" = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''
                Whether to show tooltips when hovering task buttons.

                Type: Bool
              '';
            };
            "showWindowIcons" = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''
                Whether to show window icons inside the window rectangles.

                Type: Bool
              '';
            };
            "sortDesc" = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''
                Whether to sort Folder View icons descending instead of ascending.

                Type: Bool
              '';
            };
            "sortDirsFirst" = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''
                Whether to sort folders before files in Folder View.

                Type: Bool
              '';
            };
            "sortMode" = mkOption {
              type = nullOr (either str int);
              default = 0;
              description = ''
                How Folder View icons are sorted: 0 = Unsorted, 1 = Name, 2 = Size, 3 = Type, 4 = Date

                Type: Int
              '';
            };
            "sortingStrategy" = mkOption {
              type = nullOr (either str int);
              default = 1;
              description = ''
                How to sort tasks: 0 = Do Not Sort, 1 = Manually, 2 = Alphabetically, 3 = By Desktop, 4 = By Activity

                Type: Int
              '';
            };
            "systemApplications" = mkOption {
              type = nullOr (either str (listOf str));
              default =
                "systemsettings.desktop,org.kde.kinfocenter.desktop,org.kde.discover.desktop";
              description = ''
                List of applications at the top of the "Computer" tab.

                Type: StringList
              '';
            };
            "systemFavorites" = mkOption {
              type = nullOr (either str (listOf str));
              default = "suspend,hibernate,reboot,shutdown";
              description = ''
                List of system action favorites.

                Type: StringList
              '';
            };
            "taskHoverEffect" = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''
                Whether task buttons should change in appearance when the mouse pointer is above them.

                Type: Bool
              '';
            };
            "textColor" = mkOption {
              type = nullOr str;
              default = "white";
              description = ''
                The text color to use below Folder View icons. Only used when serving as containment.

                Type: String
              '';
            };
            "textLines" = mkOption {
              type = nullOr (either str int);
              default = 2;
              description = ''
                The (maximum) number of lines of text to use below Folder View icons.

                Type: Int
              '';
            };
            "toolTips" = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''
                Whether to show info tooltips when hovering Folder View icons.

                Type: Bool
              '';
            };
            "unhideOnAttention" = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''
                Whether to unhide if a window wants attention.

                Type: Bool
              '';
            };
            "url" = mkOption {
              type = nullOr str;
              default = "desktop:/";
              description = ''
                URL of the file system location being shown.

                Type: String
              '';
            };
            "useCustomButtonImage" = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''
                Whether to use a custom image instead of an icon in the compact representation (e.g. on a small panel).

                Type: Bool
              '';
            };
            "useCustomIcon" = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''
                Whether to use a custom icon for the compact representation (e.g. on a small panel) of the Folder View Applet.

                Type: Bool
              '';
            };
            "useExtraRunners" = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''
                Whether to use additional KRunner plugins to produce results in the search.

                Type: Bool
              '';
            };
            "viewMode" = mkOption {
              type = nullOr (either str int);
              default = 0;
              description = ''
                The Folder View view mode (used only by the widget full representation): 0 = Grid, 1 = List

                Type: Int
              '';
            };
            "wheelEnabled" = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''
                Whether using the mouse wheel with the mouse pointer above the widget should switch between tasks.

                Type: Bool
              '';
            };
            "wheelSkipMinimized" = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''
                Whether to skip minimized tasks when switching between them using the mouse wheel.

                Type: Bool
              '';
            };
            "wrapPage" = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''
                Whether to wrap page when navigating with pager

                Type: Bool
              '';
            };
          };
        };
        default = { };
        description = "General";
      };
  };
  config = mkIf cfg.enable { programs.plasma.files."plasmarc" = cfg.plasma; };
}
