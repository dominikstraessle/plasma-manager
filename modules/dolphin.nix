{ config, lib, pkgs, ... }:
with lib;
let
  cfg = config.programs.plasma;
  moduleCfg = config.programs.plasma.dolphin;
in {
  options.programs.plasma.dolphin = {
    enable = mkEnableOption ''
      Enable dolphin
    '';
    package = mkOption {
      default = if (pkgs ? dolphin) then
                        pkgs.dolphin
                      else
                        (if pkgs.libsForQt5 ? dolphin then pkgs.libsForQt5.dolphin else false);
      defaultText = literalExpression "pkgs.dolphin";
      type = with types; either bool package;
      description = mdDoc "Package to use.";
    };
    "CompactMode" = with types; mkOption {
      type = submodule {
        options = { 
          IconSize = mkOption {
            type = nullOr (either str int);
            default = "KIconLoader::SizeSmall";
            defaultText = "Code: true";
            description = ''
              Icon size

              Type: Int
            '';
          };
          MaximumTextWidthIndex = mkOption {
            type = nullOr (either str int);
            default = 0;
            description = ''
              Maximum text width index (0 means unlimited)

              Type: Int
            '';
          };
          PreviewSize = mkOption {
            type = nullOr (either str int);
            default = "KIconLoader::SizeLarge";
            defaultText = "Code: true";
            description = ''
              Preview size

              Type: Int
            '';
          };
          UseSystemFont = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Use system font

              Type: Bool
            '';
          };
          ViewFont = mkOption {
            type = nullOr str;
            default = "QFont()";
            defaultText = "Code: true";
            description = ''
              

              Type: Font
            '';
          };
        };
      };
      default = {};
      description = "CompactMode";
    };    
    "ContextMenu" = with types; mkOption {
      type = submodule {
        options = { 
          ShowAddToPlaces = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Show 'Add to Places' in context menu.

              Type: Bool
            '';
          };
          ShowCopyLocation = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Show 'Copy Location' in context menu.

              Type: Bool
            '';
          };
          ShowCopyMoveMenu = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Show 'Copy To' and 'Move To' commands in context menu

              Type: Bool
            '';
          };
          ShowDuplicateHere = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Show 'Duplicate Here' in context menu.

              Type: Bool
            '';
          };
          ShowOpenInNewTab = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Show 'Open in New Tab' and 'Open in New Tabs' in context menu.

              Type: Bool
            '';
          };
          ShowOpenInNewWindow = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Show 'Open in New Window' in context menu.

              Type: Bool
            '';
          };
          ShowOpenTerminal = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Show 'Open Terminal' in context menu.

              Type: Bool
            '';
          };
          ShowSortBy = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Show 'Sort By' in context menu.

              Type: Bool
            '';
          };
          ShowViewMode = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Show 'View Mode' in context menu.

              Type: Bool
            '';
          };
        };
      };
      default = {};
      description = "ContextMenu";
    };    
    "DetailsMode" = with types; mkOption {
      type = submodule {
        options = { 
          ColumnPositions = mkOption {
            type = nullOr (either str (listOf int));
            default = "0,1,2,3,4,5,6,7,8";
            description = ''
              Position of columns

              Type: IntList
            '';
          };
          DirectorySizeCount = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Whether or not content count is used as directory size

              Type: Bool
            '';
          };
          ExpandableFolders = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Expandable folders

              Type: Bool
            '';
          };
          HighlightEntireRow = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Highlight entire row

              Type: Bool
            '';
          };
          IconSize = mkOption {
            type = nullOr (either str int);
            default = "KIconLoader::SizeSmall";
            defaultText = "Code: true";
            description = ''
              Icon size

              Type: Int
            '';
          };
          PreviewSize = mkOption {
            type = nullOr (either str int);
            default = "KIconLoader::SizeLarge";
            defaultText = "Code: true";
            description = ''
              Preview size

              Type: Int
            '';
          };
          RecursiveDirectorySizeLimit = mkOption {
            type = nullOr (either str int);
            default = 10;
            description = ''
              Recursive directory size limit

              Type: UInt
            '';
          };
          SidePadding = mkOption {
            type = nullOr (either str int);
            default = 20;
            description = ''
              Side Padding

              Type: UInt
            '';
          };
          UseShortRelativeDates = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              if true we use short relative dates, if not short dates

              Type: Bool
            '';
          };
          UseSystemFont = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Use system font

              Type: Bool
            '';
          };
          ViewFont = mkOption {
            type = nullOr str;
            default = "QFont()";
            defaultText = "Code: true";
            description = ''
              

              Type: Font
            '';
          };
        };
      };
      default = {};
      description = "DetailsMode";
    };    
    "Dolphin" = with types; mkOption {
      type = submodule {
        options = { 
          AdditionalInfo = mkOption {
            type = nullOr (either str (listOf str));
            default = "";
            description = ''
              Additional Information

              Type: StringList
            '';
          };
          GroupedSorting = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Grouped Sorting

              Type: Bool
            '';
          };
          HeaderColumnWidths = mkOption {
            type = nullOr (either str (listOf int));
            default = "";
            description = ''
              Header column widths

              Type: IntList
            '';
          };
          PreviewsShown = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Previews shown

              Type: Bool
            '';
          };
          SortFoldersFirst = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Show folders first when sorting files and folders

              Type: Bool
            '';
          };
          SortHiddenLast = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Show hidden files and folders last

              Type: Bool
            '';
          };
          SortOrder = mkOption {
            type = nullOr (either str int);
            default = "Qt::AscendingOrder";
            defaultText = "Code: true";
            description = ''
              Order in which to sort files

              Type: Int
              Min: Qt::AscendingOrder
              Max: Qt::DescendingOrder
            '';
          };
          SortRole = mkOption {
            type = nullOr str;
            default = "text";
            description = ''
              Sort files by

              Type: String
            '';
          };
          Timestamp = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              Properties last changed

              Type: DateTime
            '';
          };
          Version = mkOption {
            type = nullOr (either str int);
            default = -1;
            description = ''
              Version

              Type: Int
            '';
          };
          ViewMode = mkOption {
            type = nullOr (either str int);
            default = "DolphinView::IconsView";
            description = ''
              View Mode

              Type: Int
            '';
          };
          VisibleRoles = mkOption {
            type = nullOr (either str (listOf str));
            default = "";
            description = ''
              Visible roles

              Type: StringList
            '';
          };
        };
      };
      default = {};
      description = "Dolphin";
    };    
    "FoldersPanel" = with types; mkOption {
      type = submodule {
        options = { 
          AutoScrolling = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Automatic scrolling

              Type: Bool
            '';
          };
          HiddenFilesShown = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Hidden files shown

              Type: Bool
            '';
          };
          LimitFoldersPanelToHome = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Limit folders panel to home directory if inside home

              Type: Bool
            '';
          };
        };
      };
      default = {};
      description = "FoldersPanel";
    };    
    "General" = with types; mkOption {
      type = submodule {
        options = { 
          AutoExpandFolders = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Use auto-expanding folders for all view types

              Type: Bool
            '';
          };
          BrowseThroughArchives = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Browse through archives

              Type: Bool
            '';
          };
          CloseActiveSplitView = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Close active pane when toggling off split view

              Type: Bool
            '';
          };
          ConfirmClosingMultipleTabs = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Ask for confirmation when closing windows with multiple tabs.

              Type: Bool
            '';
          };
          ConfirmClosingTerminalRunningProgram = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Ask for confirmation when closing windows with a program that is still running in the Terminal panel.

              Type: Bool
            '';
          };
          EditableUrl = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Should the URL be editable for the user

              Type: Bool
            '';
          };
          EnlargeSmallPreviews = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Enlarge Small Previews

              Type: Bool
            '';
          };
          FilterBar = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Should the filter bar be shown

              Type: Bool
            '';
          };
          GlobalViewProps = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Should the view properties be used for all folders

              Type: Bool
            '';
          };
          HomeUrl = mkOption {
            type = nullOr str;
            default = "QUrl::fromLocalFile(QDir::homePath()).toDisplayString(QUrl::PreferLocalFile)";
            defaultText = "Code: true";
            description = ''
              Home URL

              Type: String
            '';
          };
          LockPanels = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Lock the layout of the panels

              Type: Bool
            '';
          };
          ModifiedStartupSettings = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Have the startup settings been modified (internal setting not shown in the UI)

              Type: Bool
            '';
          };
          OpenExternallyCalledFolderInNewTab = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Should an externally called folder open in a new tab in an existing Dolphin instance

              Type: Bool
            '';
          };
          OpenNewTabAfterLastTab = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              New tab will be open after last one

              Type: Bool
            '';
          };
          RememberOpenedTabs = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Remember open folders and tabs

              Type: Bool
            '';
          };
          RenameInline = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Rename inline

              Type: Bool
            '';
          };
          ShowFullPath = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Should the full path be shown inside the location bar

              Type: Bool
            '';
          };
          ShowFullPathInTitlebar = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Should the full path be shown in the title bar

              Type: Bool
            '';
          };
          ShowPasteBarAfterCopying = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Show a bar for easy pasting after a cut or copy was done using the selection mode bottom bar.

              Type: Bool
            '';
          };
          ShowSelectionToggle = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Show selection toggle

              Type: Bool
            '';
          };
          ShowSpaceInfo = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Show the space information in the statusbar

              Type: Bool
            '';
          };
          ShowStatusBar = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Show the statusbar

              Type: Bool
            '';
          };
          ShowToolTips = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Show tooltips

              Type: Bool
            '';
          };
          ShowZoomSlider = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Show zoom slider in the statusbar

              Type: Bool
            '';
          };
          SortingChoice = mkOption {
            type = nullOr (either str (enum [ 
              "NaturalSorting"
              "CaseInsensitiveSorting"
              "CaseSensitiveSorting"
            ]));
            default = "0";
            description = ''
              Choose Natural, Case Sensitive, or Case Insensitive order of sorting the items

              Type: Enum
              Choices: 
                - NaturalSorting
                - CaseInsensitiveSorting
                - CaseSensitiveSorting
            '';
          };
          SplitView = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Split the view into two panes

              Type: Bool
            '';
          };
          UrlCompletionMode = mkOption {
            type = nullOr (either str (enum [ 
            ]));
            default = "KCompletion::CompletionPopupAuto";
            description = ''
              Text completion mode of the URL Navigator

              Type: Enum
            '';
          };
          UseTabForSwitchingSplitView = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Use tab for switching between right and left split

              Type: Bool
            '';
          };
          Version = mkOption {
            type = nullOr (either str int);
            default = 0;
            description = ''
              Internal config version of Dolphin, mainly Used to determine whether an updated version of Dolphin is running, so as to migrate config entries that were removed/renamed ...etc

              Type: Int
            '';
          };
          ViewPropsTimestamp = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              Timestamp since when the view properties are valid

              Type: DateTime
            '';
          };
        };
      };
      default = {};
      description = "General";
    };    
    "IconsMode" = with types; mkOption {
      type = submodule {
        options = { 
          IconSize = mkOption {
            type = nullOr (either str int);
            default = "KIconLoader::SizeMedium";
            defaultText = "Code: true";
            description = ''
              Icon size

              Type: Int
            '';
          };
          MaximumTextLines = mkOption {
            type = nullOr (either str int);
            default = 3;
            description = ''
              Maximum textlines (0 means unlimited)

              Type: Int
            '';
          };
          PreviewSize = mkOption {
            type = nullOr (either str int);
            default = "KIconLoader::SizeHuge";
            defaultText = "Code: true";
            description = ''
              Preview size

              Type: Int
            '';
          };
          TextWidthIndex = mkOption {
            type = nullOr (either str int);
            default = 1;
            description = ''
              Text width index

              Type: Int
            '';
          };
          UseSystemFont = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Use system font

              Type: Bool
            '';
          };
          ViewFont = mkOption {
            type = nullOr str;
            default = "QFont()";
            defaultText = "Code: true";
            description = ''
              

              Type: Font
            '';
          };
        };
      };
      default = {};
      description = "IconsMode";
    };    
    "InformationPanel" = with types; mkOption {
      type = submodule {
        options = { 
          dateFormat = mkOption {
            type = nullOr (either str (enum [ 
              "LongFormat"
              "ShortFormat"
            ]));
            default = "0";
            description = ''
              Date display format

              Type: Enum
              Choices: 
                - LongFormat
                - ShortFormat
            '';
          };
          previewsAutoPlay = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Auto-Play media files

              Type: Bool
            '';
          };
          previewsShown = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Previews shown

              Type: Bool
            '';
          };
        };
      };
      default = {};
      description = "InformationPanel";
    };    
    "PlacesPanel" = with types; mkOption {
      type = submodule {
        options = { 
          IconSize = mkOption {
            type = nullOr (either str int);
            default = "KIconLoader::SizeSmallMedium";
            defaultText = "Code: true";
            description = ''
              Size of icons in the Places Panel (-1 means "automatic")

              Type: Int
            '';
          };
        };
      };
      default = {};
      description = "PlacesPanel";
    };    
    "Search" = with types; mkOption {
      type = submodule {
        options = { 
          Location = mkOption {
            type = nullOr str;
            default = "FromHere";
            description = ''
              Location

              Type: String
            '';
          };
          What = mkOption {
            type = nullOr str;
            default = "FileName";
            description = ''
              What

              Type: String
            '';
          };
        };
      };
      default = {};
      description = "Search";
    };    
    "Settings" = with types; mkOption {
      type = submodule {
        options = { 
          HiddenFilesShown = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Hidden files shown

              Type: Bool
            '';
          };
        };
      };
      default = {};
      description = "Settings";
    };    
    "VersionControl" = with types; mkOption {
      type = submodule {
        options = { 
          enabledPlugins = mkOption {
            type = nullOr (either str (listOf str));
            default = "";
            description = ''
              Enabled plugins

              Type: StringList
            '';
          };
        };
      };
      default = {};
      description = "VersionControl";
    };    
  };
  config = mkIf (cfg.enable && moduleCfg.enable) {
    home.packages = mkIf (moduleCfg.package != false) [ moduleCfg.package ];
    programs.plasma.files."dolphinrc" = removeAttrs moduleCfg [ "enable" "package" ];
  };
}
