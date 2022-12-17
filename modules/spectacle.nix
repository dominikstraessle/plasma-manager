{ config, lib, ... }:
with lib;
let cfg = config.programs.plasma;
in {
  options.programs.plasma.spectacle = { 
    "General" = mkOption {
      type = types.submodule {
        options = with types; {            
          "onLaunchAction" = mkOption {
            type = nullOr (either str (enum [ 
              "TakeFullscreenScreenshot"
              "UseLastUsedCapturemode"
              "DoNotTakeScreenshot"
            ]));
            default = "TakeFullscreenScreenshot";
            description = ''
              What to do when Spectacle is launched
              Type: Enum
            '';
            };
          printKeyActionRunning = mkOption {
            type = nullOr (either str (enum [ 
              "TakeNewScreenshot"
              "StartNewInstance"
              "FocusWindow"
            ]));
            default = "TakeNewScreenshot";
            description = ''
              What should happen if print key is pressed when Spectacle is already running
              Type: Enum
            '';
            };
          autoSaveImage = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Save screenshot automatically after it is taken
              Type: Bool
            '';
            };
          clipboardGroup = mkOption {
            type = nullOr (either str (enum [ 
              "PostScreenshotDoNothing"
              "PostScreenshotCopyImage"
              "PostScreenshotCopyLocation"
            ]));
            default = "PostScreenshotDoNothing";
            description = ''
              Clipboard action which should be executed after the screenshot is taken
              Type: Enum
            '';
            };
          "useLightMaskColour" = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Whether to use a light color mask in the region selection dialog
              Type: Bool
            '';
            };
          showMagnifier = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Whether to show a magnifier in the region selection
              Type: Bool
            '';
            };
          useReleaseToCapture = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Whether the screenshot should be captured after selecting the region and releasing the mouse
              Type: Bool
            '';
            };
          showCaptureInstructions = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Whether to show capture instructions in the region selection
              Type: Bool
            '';
            };
          rememberLastRectangularRegion = mkOption {
            type = nullOr (either str (enum [ 
              "Never"
              "Always"
              "UntilSpectacleIsClosed"
            ]));
            default = "Always";
            description = ''
              Remember the last rectangular region
              Type: Enum
            '';
            };
        };
      };
      default = {};
      description = "General";
    };    
    "GuiConfig" = mkOption {
      type = types.submodule {
        options = with types; {            
          cropRegion = mkOption {
            type = nullOr (either str str);
            default = "QRect()";
            description = ''
              The last used region the user selected
              Type: Rect
            '';
            };
          "onClickChecked" = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Take screenshot on click
              Type: Bool
            '';
            };
          includePointer = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Whether the mouse cursor is included in the screenshot
              Type: Bool
            '';
            };
          includeDecorations = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Whether the window decorations are included in the screenshot
              Type: Bool
            '';
            };
          transientOnly = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Only capture the current pop up menu
              Type: Bool
            '';
            };
          quitAfterSaveCopyExport = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Quit after saving or copying an image
              Type: Bool
            '';
            };
          captureDelay = mkOption {
            type = nullOr (either str float);
            default = 0.0;
            description = ''
              Delay
              Type: Double
              Min: 0
            '';
            };
          captureMode = mkOption {
            type = nullOr (either str (enum [ 
            ]));
            default = "CaptureModeModel::CaptureMode::AllScreens";
            description = ''
              
              Type: Enum
            '';
            };
        };
      };
      default = {};
      description = "GuiConfig";
    };    
    "Save" = mkOption {
      type = types.submodule {
        options = with types; {            
          defaultSaveLocation = mkOption {
            type = nullOr (either str str);
            default = "
                QUrl::fromLocalFile(QStandardPaths::writableLocation(QStandardPaths::PicturesLocation)+QLatin1Char('/'))
            ";
            defaultText = "Code: true";
            description = ''
              Default filename
              Type: Url
            '';
            };
          compressionQuality = mkOption {
            type = nullOr (either str int);
            default = 90;
            description = ''
              Compression quality for lossy file formats
              Type: UInt
              Min: 0
              Max: 100
            '';
            };
          defaultSaveImageFormat = mkOption {
            type = nullOr (either str str);
            default = "PNG";
            description = ''
              Default save image format
              Type: String
            '';
            };
          saveFilenameFormat = mkOption {
            type = nullOr (either str str);
            default = "Screenshot_%Y%M%D_%H%m%S";
            description = ''
              The default filename used when saving
              Type: String
            '';
            };
          lastSaveLocation = mkOption {
            type = nullOr (either str str);
            default = "defaultSaveLocation()";
            defaultText = "Code: true";
            description = ''
              The path of the file saved last
              Type: Url
            '';
            };
          lastSaveAsLocation = mkOption {
            type = nullOr (either str str);
            default = "defaultSaveLocation()";
            defaultText = "Code: true";
            description = ''
              Last path used for "save as" action
              Type: Url
            '';
            };
        };
      };
      default = {};
      description = "Save";
    };    
    "Annotations" = mkOption {
      type = types.submodule {
        options = with types; {            
          annotationToolType = mkOption {
            type = nullOr (either str (enum [ 
            ]));
            default = "AnnotationDocument::EditActionType::None";
            description = ''
              The last used annotation tool type
              Type: Enum
            '';
            };
          freehandStrokeWidth = mkOption {
            type = nullOr (either str int);
            default = 4;
            description = ''
              Stroke width for freehand annotation tool
              Type: UInt
              Min: 1
            '';
            };
          highlighterStrokeWidth = mkOption {
            type = nullOr (either str int);
            default = 20;
            description = ''
              Stroke width for highlighter annotation tool
              Type: UInt
              Min: 1
            '';
            };
          lineStrokeWidth = mkOption {
            type = nullOr (either str int);
            default = 4;
            description = ''
              Stroke width for line annotation tool
              Type: UInt
              Min: 1
            '';
            };
          arrowStrokeWidth = mkOption {
            type = nullOr (either str int);
            default = 4;
            description = ''
              Stroke width for arrow annotation tool
              Type: UInt
              Min: 1
            '';
            };
          rectangleStrokeWidth = mkOption {
            type = nullOr (either str int);
            default = 0;
            description = ''
              Stroke width for rectangle annotation tool
              Type: UInt
              Min: 0
            '';
            };
          ellipseStrokeWidth = mkOption {
            type = nullOr (either str int);
            default = 0;
            description = ''
              Stroke width for ellipse annotation tool
              Type: UInt
              Min: 0
            '';
            };
          freehandStrokeColor = mkOption {
            type = nullOr (either str str);
            default = "255,0,0,255";
            description = ''
              Stroke width for freehand annotation tool
              Type: Color
            '';
            };
          highlighterStrokeColor = mkOption {
            type = nullOr (either str str);
            default = "255,255,0,255";
            description = ''
              Stroke width for highlighter annotation tool
              Type: Color
            '';
            };
          lineStrokeColor = mkOption {
            type = nullOr (either str str);
            default = "255,0,0,255";
            description = ''
              Stroke width for line annotation tool
              Type: Color
            '';
            };
          arrowStrokeColor = mkOption {
            type = nullOr (either str str);
            default = "255,0,0,255";
            description = ''
              Stroke width for arrow annotation tool
              Type: Color
            '';
            };
          rectangleStrokeColor = mkOption {
            type = nullOr (either str str);
            default = "0,0,0,255";
            description = ''
              Stroke width for rectangle annotation tool
              Type: Color
            '';
            };
          ellipseStrokeColor = mkOption {
            type = nullOr (either str str);
            default = "0,0,0,255";
            description = ''
              Stroke width for ellipse annotation tool
              Type: Color
            '';
            };
          rectangleFillColor = mkOption {
            type = nullOr (either str str);
            default = "255,0,0,255";
            description = ''
              Stroke width for rectangle annotation tool
              Type: Color
            '';
            };
          ellipseFillColor = mkOption {
            type = nullOr (either str str);
            default = "255,0,0,255";
            description = ''
              Stroke width for ellipse annotation tool
              Type: Color
            '';
            };
          numberFillColor = mkOption {
            type = nullOr (either str str);
            default = "255,0,0,255";
            description = ''
              Stroke width for ellipse annotation tool
              Type: Color
            '';
            };
          textFont = mkOption {
            type = nullOr (either str str);
            default = "";
            description = ''
              Font for annotations
              Type: Font
            '';
            };
          numberFont = mkOption {
            type = nullOr (either str str);
            default = "";
            description = ''
              Font for annotations
              Type: Font
            '';
            };
          textFontColor = mkOption {
            type = nullOr (either str str);
            default = "0,0,0,255";
            description = ''
              Font color for annotations
              Type: Color
            '';
            };
          numberFontColor = mkOption {
            type = nullOr (either str str);
            default = "0,0,0,255";
            description = ''
              Font color for annotations
              Type: Color
            '';
            };
          freehandShadow = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Whether freehand annotation tool has a drop shadow
              Type: Bool
            '';
            };
          lineShadow = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Whether line annotation tool has a drop shadow
              Type: Bool
            '';
            };
          arrowShadow = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Whether arrow annotation tool has a drop shadow
              Type: Bool
            '';
            };
          rectangleShadow = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Whether rectangle annotation tool has a drop shadow
              Type: Bool
            '';
            };
          ellipseShadow = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Whether ellipse annotation tool has a drop shadow
              Type: Bool
            '';
            };
          textShadow = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Whether text annotation tool has a drop shadow
              Type: Bool
            '';
            };
          numberShadow = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Whether number annotation tool has a drop shadow
              Type: Bool
            '';
            };
        };
      };
      default = {};
      description = "Annotations";
    };    
  };
  config = mkIf cfg.enable {
    programs.plasma.files."spectaclerc" = cfg.spectacle;
  };
}
