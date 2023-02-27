{ config, lib, pkgs, ... }:
with lib;
let
  cfg = config.programs.plasma;
  moduleCfg = config.programs.plasma.spectacle;
in {
  options.programs.plasma.spectacle = {
    enable = mkEnableOption ''
      Enable spectacle
    '';
    package = mkOption {
      default = if (pkgs ? spectacle) then
                        pkgs.spectacle
                      else
                        (if pkgs.libsForQt5 ? spectacle then pkgs.libsForQt5.spectacle else false);
      defaultText = literalExpression "pkgs.spectacle";
      type = with types; either bool package;
      description = mdDoc "Package to use.";
    };
    "Annotations" = with types; mkOption {
      type = submodule {
        options = { 
          annotationToolType = mkOption {
            type = nullOr (either str (enum [ 
            ]));
            default = "AnnotationDocument::EditActionType::None";
            description = ''
              The last used annotation tool type

              Type: Enum
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
          arrowStrokeColor = mkOption {
            type = nullOr str;
            default = "255,0,0,255";
            description = ''
              Stroke width for arrow annotation tool

              Type: Color
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
          ellipseFillColor = mkOption {
            type = nullOr str;
            default = "255,0,0,255";
            description = ''
              Stroke width for ellipse annotation tool

              Type: Color
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
          ellipseStrokeColor = mkOption {
            type = nullOr str;
            default = "0,0,0,255";
            description = ''
              Stroke width for ellipse annotation tool

              Type: Color
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
          freehandShadow = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Whether freehand annotation tool has a drop shadow

              Type: Bool
            '';
          };
          freehandStrokeColor = mkOption {
            type = nullOr str;
            default = "255,0,0,255";
            description = ''
              Stroke width for freehand annotation tool

              Type: Color
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
          highlighterStrokeColor = mkOption {
            type = nullOr str;
            default = "255,255,0,255";
            description = ''
              Stroke width for highlighter annotation tool

              Type: Color
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
          lineShadow = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Whether line annotation tool has a drop shadow

              Type: Bool
            '';
          };
          lineStrokeColor = mkOption {
            type = nullOr str;
            default = "255,0,0,255";
            description = ''
              Stroke width for line annotation tool

              Type: Color
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
          numberFillColor = mkOption {
            type = nullOr str;
            default = "255,0,0,255";
            description = ''
              Stroke width for ellipse annotation tool

              Type: Color
            '';
          };
          numberFont = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              Font for annotations

              Type: Font
            '';
          };
          numberFontColor = mkOption {
            type = nullOr str;
            default = "0,0,0,255";
            description = ''
              Font color for annotations

              Type: Color
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
          rectangleFillColor = mkOption {
            type = nullOr str;
            default = "255,0,0,255";
            description = ''
              Stroke width for rectangle annotation tool

              Type: Color
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
          rectangleStrokeColor = mkOption {
            type = nullOr str;
            default = "0,0,0,255";
            description = ''
              Stroke width for rectangle annotation tool

              Type: Color
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
          textFont = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              Font for annotations

              Type: Font
            '';
          };
          textFontColor = mkOption {
            type = nullOr str;
            default = "0,0,0,255";
            description = ''
              Font color for annotations

              Type: Color
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
        };
      };
      default = {};
      description = "Annotations";
    };    
    "General" = with types; mkOption {
      type = submodule {
        options = { 
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
              Choices: 
                - PostScreenshotDoNothing
                - PostScreenshotCopyImage
                - PostScreenshotCopyLocation
            '';
          };
          onLaunchAction = mkOption {
            type = nullOr (either str (enum [ 
              "TakeFullscreenScreenshot"
              "UseLastUsedCapturemode"
              "DoNotTakeScreenshot"
            ]));
            default = "TakeFullscreenScreenshot";
            description = ''
              What to do when Spectacle is launched

              Type: Enum
              Choices: 
                - TakeFullscreenScreenshot
                - UseLastUsedCapturemode
                - DoNotTakeScreenshot
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
              Choices: 
                - TakeNewScreenshot
                - StartNewInstance
                - FocusWindow
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
              Choices: 
                - Never
                - Always
                - UntilSpectacleIsClosed
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
          showMagnifier = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Whether to show a magnifier in the region selection

              Type: Bool
            '';
          };
          useLightMaskColour = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Whether to use a light color mask in the region selection dialog

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
        };
      };
      default = {};
      description = "General";
    };    
    "GuiConfig" = with types; mkOption {
      type = submodule {
        options = { 
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
          cropRegion = mkOption {
            type = nullOr str;
            default = "QRect()";
            description = ''
              The last used region the user selected

              Type: Rect
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
          includePointer = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Whether the mouse cursor is included in the screenshot

              Type: Bool
            '';
          };
          onClickChecked = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Take screenshot on click

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
          transientOnly = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Only capture the current pop up menu

              Type: Bool
            '';
          };
        };
      };
      default = {};
      description = "GuiConfig";
    };    
    "Save" = with types; mkOption {
      type = submodule {
        options = { 
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
            type = nullOr str;
            default = "PNG";
            description = ''
              Default save image format

              Type: String
            '';
          };
          defaultSaveLocation = mkOption {
            type = nullOr str;
            default = null;
            defaultText = "Code: true";
            description = ''
              Default filename

              Type: Url
            '';
          };
          lastSaveAsLocation = mkOption {
            type = nullOr str;
            default = null;
            defaultText = "Code: true";
            description = ''
              Last path used for "save as" action

              Type: Url
            '';
          };
          lastSaveLocation = mkOption {
            type = nullOr str;
            default = null;
            defaultText = "Code: true";
            description = ''
              The path of the file saved last

              Type: Url
            '';
          };
          saveFilenameFormat = mkOption {
            type = nullOr str;
            default = "Screenshot_%Y%M%D_%H%m%S";
            description = ''
              The default filename used when saving

              Type: String
            '';
          };
        };
      };
      default = {};
      description = "Save";
    };    
  };
  config = mkIf (cfg.enable && moduleCfg.enable) {
    home.packages = mkIf (moduleCfg.package != false) [ moduleCfg.package ];
    programs.plasma.files."spectaclerc" = removeAttrs moduleCfg [ "enable" "package" ];
  };
}
