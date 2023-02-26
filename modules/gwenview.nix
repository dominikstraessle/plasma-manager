{ config, lib, pkgs, ... }:
with lib;
let
  cfg = config.programs.plasma;
  moduleCfg = config.programs.plasma.gwenview;
in {
  options.programs.plasma.gwenview = {
    enable = mkEnableOption ''
      Enable gwenview
    '';
    package = mkOption {
      default = if (pkgs ? gwenview) then
                        pkgs.gwenview
                      else
                        (if pkgs.libsForQt5 ? gwenview then pkgs.libsForQt5.gwenview else false);
      defaultText = literalExpression "pkgs.gwenview";
      type = with types; either bool package;
      description = mdDoc "Package to use.";
    };
    "Crop" = with types; mkOption {
      type = submodule {
        options = { 
          CropAdvancedSettingsEnabled = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          CropPreserveAspectRatio = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Restrict crop to image ratio when Advanced Settings disabled

              Type: Bool
            '';
          };
          CropRatioHeight = mkOption {
            type = nullOr (either str float);
            default = 0.0;
            description = ''
              Last used crop ratio height when Advanced Settings enabled

              Type: Double
            '';
          };
          CropRatioIndex = mkOption {
            type = nullOr (either str int);
            default = -1;
            description = ''
              Index representing selected ratio in the Advanced settings combobox

              Type: Int
            '';
          };
          CropRatioWidth = mkOption {
            type = nullOr (either str float);
            default = 0.0;
            description = ''
              Last used crop ratio width when Advanced Settings enabled

              Type: Double
            '';
          };
        };
      };
      default = {};
      description = "Crop";
    };    
    "FullScreen" = with types; mkOption {
      type = submodule {
        options = { 
          FullScreenBarHeight = mkOption {
            type = nullOr (either str int);
            default = "";
            description = ''
              

              Type: Int
            '';
          };
          FullScreenColorScheme = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              

              Type: String
            '';
          };
          FullScreenModeActive = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          FullScreenPreferredMetaInfoKeyList = mkOption {
            type = nullOr (either str (listOf str));
            default = "General.Name,Exif.Image.DateTime";
            description = ''
              

              Type: StringList
            '';
          };
          ShowFullScreenThumbnails = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
        };
      };
      default = {};
      description = "FullScreen";
    };    
    "General" = with types; mkOption {
      type = submodule {
        options = { 
          AutoRename = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          AutoRenameFormat = mkOption {
            type = nullOr str;
            default = "{date}_{time}.{ext.lower}";
            description = ''
              

              Type: String
            '';
          };
          BackgroundColorMode = mkOption {
            type = nullOr (either str (enum [ 
              "DocumentView::Auto"
              "DocumentView::Light"
              "DocumentView::Neutral"
              "DocumentView::Dark"
            ]));
            default = "DocumentView::Auto";
            description = ''
              

              Type: Enum
              Choices: 
                - DocumentView::Auto
                - DocumentView::Light
                - DocumentView::Neutral
                - DocumentView::Dark
            '';
          };
          BirdEyeViewEnabled = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          BlackListedExtensions = mkOption {
            type = nullOr (either str (listOf str));
            default = "new";
            description = ''
              

              Type: StringList
            '';
          };
          DefaultExportPluginText = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              

              Type: String
            '';
          };
          DestinationUrl = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              

              Type: Url
            '';
          };
          FullScreenBackground = mkOption {
            type = nullOr (either str (enum [ 
              "FullScreenBackground::Image"
              "FullScreenBackground::Black"
            ]));
            default = "FullScreenBackground::Image";
            description = ''
              

              Type: Enum
              Choices: 
                - FullScreenBackground::Image
                - FullScreenBackground::Black
            '';
          };
          HistoryEnabled = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          JPEGQuality = mkOption {
            type = nullOr (either str int);
            default = 90;
            description = ''
              

              Type: Int
            '';
          };
          LastTargetDir = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              

              Type: Path
            '';
          };
          LastUsedVersion = mkOption {
            type = nullOr (either str int);
            default = -1;
            description = ''
              

              Type: int
            '';
          };
          PercentageOfMemoryUsageWarning = mkOption {
            type = nullOr (either str float);
            default = 0.5;
            description = ''
              

              Type: Double
            '';
          };
          SideBarPage = mkOption {
            type = nullOr str;
            default = "information";
            description = ''
              

              Type: String
            '';
          };
          ThumbnailActions = mkOption {
            type = nullOr (either str (enum [ 
              "ThumbnailActions::AllButtons"
              "ThumbnailActions::ShowSelectionButtonOnly"
              "ThumbnailActions::None"
            ]));
            default = "ThumbnailActions::AllButtons";
            description = ''
              

              Type: Enum
              Choices: 
                - ThumbnailActions::AllButtons
                - ThumbnailActions::ShowSelectionButtonOnly
                - ThumbnailActions::None
            '';
          };
          ThumbnailBarIsVisible = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          ThumbnailBarOrientation = mkOption {
            type = nullOr (either str (enum [ 
              "Dummy"
              "Horizontal"
              "Vertical"
            ]));
            default = "Horizontal";
            description = ''
              

              Type: Enum
              Choices: 
                - Dummy
                - Horizontal
                - Vertical
            '';
          };
          ThumbnailBarRowCount = mkOption {
            type = nullOr (either str int);
            default = 1;
            description = ''
              

              Type: Int
            '';
          };
          UrlNavigatorIsEditable = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          UrlNavigatorShowFullPath = mkOption {
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
    "ImageView" = with types; mkOption {
      type = submodule {
        options = { 
          AlphaBackgroundColor = mkOption {
            type = nullOr str;
            default = "#ffffff";
            description = ''
              

              Type: Color
            '';
          };
          AlphaBackgroundMode = mkOption {
            type = nullOr (either str (enum [ 
              "AbstractImageView::AlphaBackgroundNone"
              "AbstractImageView::AlphaBackgroundCheckBoard"
              "AbstractImageView::AlphaBackgroundSolid"
            ]));
            default = "AbstractImageView::AlphaBackgroundNone";
            description = ''
              

              Type: Enum
              Choices: 
                - AbstractImageView::AlphaBackgroundNone
                - AbstractImageView::AlphaBackgroundCheckBoard
                - AbstractImageView::AlphaBackgroundSolid
            '';
          };
          AnimationMethod = mkOption {
            type = nullOr (either str (enum [ 
              "DocumentView::NoAnimation"
              "DocumentView::SoftwareAnimation"
              "DocumentView::GLAnimation"
            ]));
            default = "DocumentView::SoftwareAnimation";
            description = ''
              

              Type: Enum
              Choices: 
                - DocumentView::NoAnimation
                - DocumentView::SoftwareAnimation
                - DocumentView::GLAnimation
            '';
          };
          ApplyExifOrientation = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          EnlargeSmallerImages = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          MouseWheelBehavior = mkOption {
            type = nullOr (either str (enum [ 
              "MouseWheelBehavior::Scroll"
              "MouseWheelBehavior::Browse"
              "MouseWheelBehavior::Zoom"
            ]));
            default = "MouseWheelBehavior::Scroll";
            description = ''
              

              Type: Enum
              Choices: 
                - MouseWheelBehavior::Scroll
                - MouseWheelBehavior::Browse
                - MouseWheelBehavior::Zoom
            '';
          };
          NavigationEndNotification = mkOption {
            type = nullOr (either str (enum [ 
              "NavigationEndNotification::NeverWarn"
              "NavigationEndNotification::WarnOnSlideshow"
              "NavigationEndNotification::AlwaysWarn"
            ]));
            default = "Gwenview::SlideShow::NavigationEndNotification::WarnOnSlideshow";
            description = ''
              

              Type: Enum
              Choices: 
                - NavigationEndNotification::NeverWarn
                - NavigationEndNotification::WarnOnSlideshow
                - NavigationEndNotification::AlwaysWarn
            '';
          };
          NoMonitorICC = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          RenderingIntent = mkOption {
            type = nullOr (either str (enum [ 
              "RenderingIntent::Perceptual"
              "RenderingIntent::Relative"
            ]));
            default = "RenderingIntent::Perceptual";
            description = ''
              

              Type: Enum
              Choices: 
                - RenderingIntent::Perceptual
                - RenderingIntent::Relative
            '';
          };
          ThumbnailSplitterSizes = mkOption {
            type = nullOr (either str (listOf int));
            default = "350, 100";
            description = ''
              

              Type: IntList
            '';
          };
          ZoomMode = mkOption {
            type = nullOr (either str (enum [ 
              "ZoomMode::Autofit"
              "ZoomMode::KeepSame"
              "ZoomMode::Individual"
            ]));
            default = "ZoomMode::Autofit";
            description = ''
              

              Type: Enum
              Choices: 
                - ZoomMode::Autofit
                - ZoomMode::KeepSame
                - ZoomMode::Individual
            '';
          };
        };
      };
      default = {};
      description = "ImageView";
    };    
    "Print" = with types; mkOption {
      type = submodule {
        options = { 
          PrintEnlargeSmallerImages = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          PrintHeight = mkOption {
            type = nullOr (either str float);
            default = 10.0;
            description = ''
              

              Type: Double
            '';
          };
          PrintKeepRatio = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          PrintPosition = mkOption {
            type = nullOr (either str int);
            default = "
                Qt::AlignHCenter | Qt::AlignVCenter
            ";
            defaultText = "Code: true";
            description = ''
              

              Type: Int
            '';
          };
          PrintScaleMode = mkOption {
            type = nullOr (either str (enum [ 
              "PrintOptionsPage::NoScale"
              "PrintOptionsPage::ScaleToPage"
              "PrintOptionsPage::ScaleToCustomSize"
            ]));
            default = "PrintOptionsPage::ScaleToPage";
            description = ''
              

              Type: Enum
              Choices: 
                - PrintOptionsPage::NoScale
                - PrintOptionsPage::ScaleToPage
                - PrintOptionsPage::ScaleToCustomSize
            '';
          };
          PrintUnit = mkOption {
            type = nullOr (either str (enum [ 
              "PrintOptionsPage::Millimeters"
              "PrintOptionsPage::Centimeters"
              "PrintOptionsPage::Inches"
            ]));
            default = "PrintOptionsPage::Centimeters";
            description = ''
              

              Type: Enum
              Choices: 
                - PrintOptionsPage::Millimeters
                - PrintOptionsPage::Centimeters
                - PrintOptionsPage::Inches
            '';
          };
          PrintWidth = mkOption {
            type = nullOr (either str float);
            default = 15.0;
            description = ''
              

              Type: Double
            '';
          };
        };
      };
      default = {};
      description = "Print";
    };    
    "RedEyeReduction" = with types; mkOption {
      type = submodule {
        options = { 
          RedEyeReductionDiameter = mkOption {
            type = nullOr (either str int);
            default = 24;
            description = ''
              

              Type: Int
            '';
          };
        };
      };
      default = {};
      description = "RedEyeReduction";
    };    
    "SideBar" = with types; mkOption {
      type = submodule {
        options = { 
          InformationSplitterSizes = mkOption {
            type = nullOr (either str (listOf int));
            default = "";
            description = ''
              

              Type: IntList
            '';
          };
          "IsVisible ViewMode" = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          "IsVisible ViewMode FullScreen" = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          PreferredMetaInfoKeyList = mkOption {
            type = nullOr (either str (listOf str));
            default = "General.Name,General.ImageSize,Exif.Photo.ExposureTime,Exif.Photo.Flash";
            description = ''
              

              Type: StringList
            '';
          };
          SideBarSplitterSizes = mkOption {
            type = nullOr (either str (listOf int));
            default = "";
            description = ''
              

              Type: IntList
            '';
          };
        };
      };
      default = {};
      description = "SideBar";
    };    
    "StatusBar" = with types; mkOption {
      type = submodule {
        options = { 
          "IsVisible BrowseMode" = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          "IsVisible ViewMode" = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          "IsVisible ViewMode FullScreen" = mkOption {
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
    "ThumbnailView" = with types; mkOption {
      type = submodule {
        options = { 
          AutoplayVideos = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          ListVideos = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          LowResourceUsageMode = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          SortDescending = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          Sorting = mkOption {
            type = nullOr (either str (enum [ 
              "Sorting::Name"
              "Sorting::Size"
              "Sorting::Date"
              "Sorting::Rating"
            ]));
            default = "Sorting::Name";
            description = ''
              

              Type: Enum
              Choices: 
                - Sorting::Name
                - Sorting::Size
                - Sorting::Date
                - Sorting::Rating
            '';
          };
          ThumbnailAspectRatio = mkOption {
            type = nullOr (either str float);
            default = "3./2.";
            description = ''
              

              Type: Double
            '';
          };
          ThumbnailDetails = mkOption {
            type = nullOr (either str int);
            default = 1;
            description = ''
              

              Type: Int
            '';
          };
          ThumbnailSize = mkOption {
            type = nullOr (either str int);
            default = 128;
            description = ''
              

              Type: Int
            '';
          };
        };
      };
      default = {};
      description = "ThumbnailView";
    };    
    "slide show" = with types; mkOption {
      type = submodule {
        options = { 
          fullscreen = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Show slideshow in fullscreen mode

              Type: Bool
            '';
          };
          interval = mkOption {
            type = nullOr (either str float);
            default = 5.0;
            description = ''
              Interval between images (in seconds)

              Type: Double
            '';
          };
          loop = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Loop on images

              Type: Bool
            '';
          };
          random = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Display slide show images in random order

              Type: Bool
            '';
          };
          "stop at end" = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Stop at last image of folder

              Type: Bool
            '';
          };
        };
      };
      default = {};
      description = "slide show";
    };    
  };
  config = mkIf (cfg.enable && moduleCfg.enable) {
    home.packages = mkIf moduleCfg.package [ moduleCfg.package ];
    programs.plasma.files."gwenview_importerrc" = removeAttrs moduleCfg [ "enable" "package" ];
  };
}
