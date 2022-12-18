{ config, lib, ... }:
with lib;
let cfg = config.programs.plasma;
in {
  options.programs.plasma.okular = { 
    "Contents" = with types; mkOption {
      type = submodule {
        options = { 
          "ContentsSearchCaseSensitive" = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          "ContentsSearchRegularExpression" = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
        };
      };
      default = {};
      description = "Contents";
    };    
    "Debugging Options" = with types; mkOption {
      type = submodule {
        options = { 
          "DebugDrawBoundaries" = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          "DebugDrawAnnotationRect" = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
        };
      };
      default = {};
      description = "Debugging Options";
    };    
    "Dlg Accessibility" = with types; mkOption {
      type = submodule {
        options = { 
          "HighlightImages" = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          "HighlightLinks" = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          "RecolorForeground" = mkOption {
            type = nullOr str;
            default = "0x600000";
            defaultText = "Code: true";
            description = ''
              

              Type: Color
            '';
          };
          "RecolorBackground" = mkOption {
            type = nullOr str;
            default = "0xF0F0F0";
            defaultText = "Code: true";
            description = ''
              

              Type: Color
            '';
          };
          "BWThreshold" = mkOption {
            type = nullOr (either str int);
            default = 127;
            description = ''
              

              Type: UInt
              Min: 2
              Max: 253
            '';
          };
          "BWContrast" = mkOption {
            type = nullOr (either str int);
            default = 2;
            description = ''
              

              Type: UInt
              Min: 2
              Max: 6
            '';
          };
        };
      };
      default = {};
      description = "Dlg Accessibility";
    };    
    "Dlg Performance" = with types; mkOption {
      type = submodule {
        options = { 
          "EnableCompositing" = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
        };
      };
      default = {};
      description = "Dlg Performance";
    };    
    "Dlg Presentation" = with types; mkOption {
      type = submodule {
        options = { 
          "SlidesBackgroundColor" = mkOption {
            type = nullOr str;
            default = "Qt::black";
            defaultText = "Code: true";
            description = ''
              

              Type: Color
            '';
          };
          "SlidesTransition" = mkOption {
            type = nullOr (either str (enum [ 
              "NoTransitions"
              "Replace"
              "Random"
              "BlindsHorizontal"
              "BlindsVertical"
              "BoxIn"
              "BoxOut"
              "Dissolve"
              "Fade"
              "GlitterDown"
              "GlitterRight"
              "GlitterRightDown"
              "SplitHorizontalIn"
              "SplitHorizontalOut"
              "SplitVerticalIn"
              "SplitVerticalOut"
              "WipeDown"
              "WipeRight"
              "WipeLeft"
              "WipeUp"
            ]));
            default = "Replace";
            description = ''
              

              Type: Enum
              Choices: 
                - NoTransitions
                - Replace
                - Random
                - BlindsHorizontal
                - BlindsVertical
                - BoxIn
                - BoxOut
                - Dissolve
                - Fade
                - GlitterDown
                - GlitterRight
                - GlitterRightDown
                - SplitHorizontalIn
                - SplitHorizontalOut
                - SplitVerticalIn
                - SplitVerticalOut
                - WipeDown
                - WipeRight
                - WipeLeft
                - WipeUp
            '';
          };
          "SlidesCursor" = mkOption {
            type = nullOr (either str (enum [ 
              "HiddenDelay"
              "Visible"
              "Hidden"
            ]));
            default = "HiddenDelay";
            description = ''
              

              Type: Enum
              Choices: 
                - HiddenDelay
                - Visible
                - Hidden
            '';
          };
          "SlidesShowProgress" = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          "SlidesShowSummary" = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          "SlidesScreen" = mkOption {
            type = nullOr (either str int);
            default = -2;
            description = ''
              

              Type: Int
              Min: -2
              Max: 20
            '';
          };
        };
      };
      default = {};
      description = "Dlg Presentation";
    };    
    "General" = with types; mkOption {
      type = submodule {
        options = { 
          "ShellOpenFileInTabs" = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          "SwitchToTabIfOpen" = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          "ShowOSD" = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          "ShowEmbeddedContentMessages" = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          "DisplayDocumentTitle" = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          "rtlReadingDirection" = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          "DisplayDocumentNameOrPath" = mkOption {
            type = nullOr (either str (enum [ 
              "Name"
              "Path"
            ]));
            default = "Name";
            description = ''
              

              Type: Enum
              Choices: 
                - Name
                - Path
            '';
          };
          "UseTTS" = mkOption {
            type = nullOr (either str bool);
            default = "";
            description = ''
              

              Type: Bool
            '';
          };
          "ttsEngine" = mkOption {
            type = nullOr str;
            default = "speechd";
            description = ''
              

              Type: String
            '';
          };
          "ttsVoice" = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              

              Type: String
            '';
          };
          "WatchFile" = mkOption {
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
    "Identity" = with types; mkOption {
      type = submodule {
        options = { 
          "IdentityAuthor" = mkOption {
            type = nullOr str;
            default = "userString";
            defaultText = "Code: true";
            description = ''
              

              Type: String
            '';
          };
        };
      };
      default = {};
      description = "Identity";
    };    
    "Layers" = with types; mkOption {
      type = submodule {
        options = { 
          "LayersSearchCaseSensitive" = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          "LayersSearchRegularExpression" = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
        };
      };
      default = {};
      description = "Layers";
    };    
    "Main View" = with types; mkOption {
      type = submodule {
        options = { 
          "ShowLeftPanel" = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          "SplitterSizes" = mkOption {
            type = nullOr (either str (listOf int));
            default = "";
            description = ''
              

              Type: IntList
            '';
          };
          "ShowBottomBar" = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
        };
      };
      default = {};
      description = "Main View";
    };    
    "Nav Panel" = with types; mkOption {
      type = submodule {
        options = { 
          "CurrentPageOnly" = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          "GroupByAuthor" = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          "GroupByPage" = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          "FilterBookmarks" = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          "SyncThumbnailsViewport" = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          "TocPageColumn" = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          "SidebarShowText" = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          "SidebarIconSize" = mkOption {
            type = nullOr (either str int);
            default = 48;
            description = ''
              

              Type: UInt
            '';
          };
        };
      };
      default = {};
      description = "Nav Panel";
    };    
    "PageView" = with types; mkOption {
      type = submodule {
        options = { 
          "EditToolBarPlacement" = mkOption {
            type = nullOr (either str int);
            default = 0;
            description = ''
              

              Type: Int
            '';
          };
          "SmoothScrolling" = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          "ShowScrollBars" = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          "ScrollOverlap" = mkOption {
            type = nullOr (either str int);
            default = 0;
            description = ''
              

              Type: UInt
              Min: 0
              Max: 50
            '';
          };
          "ViewColumns" = mkOption {
            type = nullOr (either str int);
            default = 3;
            description = ''
              

              Type: UInt
              Min: 1
              Max: 8
            '';
          };
          "TrimMargins" = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          "ViewContinuous" = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          "DragBeyondScreenEdges" = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          "PrimaryAnnotationToolBar" = mkOption {
            type = nullOr (either str (enum [ 
              "FullAnnotationToolBar"
              "QuickAnnotationToolBar"
            ]));
            default = "FullAnnotationToolBar";
            description = ''
              

              Type: Enum
              Choices: 
                - FullAnnotationToolBar
                - QuickAnnotationToolBar
            '';
          };
          "ViewMode" = mkOption {
            type = nullOr (either str (enum [ 
              "Single"
              "Facing"
              "FacingFirstCentered"
              "Summary"
            ]));
            default = "Single";
            description = ''
              

              Type: Enum
              Choices: 
                - Single
                - Facing
                - FacingFirstCentered
                - Summary
            '';
          };
          "TrimMode" = mkOption {
            type = nullOr (either str (enum [ 
              "None"
              "Margins"
              "Selection"
            ]));
            default = "None";
            description = ''
              

              Type: Enum
              Choices: 
                - None
                - Margins
                - Selection
            '';
          };
          "MouseMode" = mkOption {
            type = nullOr (either str (enum [ 
              "Browse"
              "Zoom"
              "RectSelect"
              "TextSelect"
              "TableSelect"
              "Magnifier"
              "TrimSelect"
            ]));
            default = "Browse";
            description = ''
              

              Type: Enum
              Choices: 
                - Browse
                - Zoom
                - RectSelect
                - TextSelect
                - TableSelect
                - Magnifier
                - TrimSelect
            '';
          };
          "ShowSourceLocationsGraphically" = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          "UseCustomBackgroundColor" = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          "BackgroundColor" = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              

              Type: Color
            '';
          };
        };
      };
      default = {};
      description = "PageView";
    };    
    "Reviews" = with types; mkOption {
      type = submodule {
        options = { 
          "ReviewsSearchCaseSensitive" = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          "ReviewsSearchRegularExpression" = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          "DrawingTools" = mkOption {
            type = nullOr (either str (listOf str));
            default = "drawingTools";
            defaultText = "Code: true";
            description = ''
              

              Type: StringList
            '';
          };
          "BuiltinAnnotationTools" = mkOption {
            type = nullOr (either str (listOf str));
            default = "builtinAnnotationTools";
            defaultText = "Code: true";
            description = ''
              

              Type: StringList
            '';
          };
          "QuickAnnotationTools" = mkOption {
            type = nullOr (either str (listOf str));
            default = "quickAnnotationTools";
            defaultText = "Code: true";
            description = ''
              

              Type: StringList
            '';
          };
          "AnnotationContinuousMode" = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          "QuickAnnotationDefaultAction" = mkOption {
            type = nullOr (either str int);
            default = 0;
            description = ''
              

              Type: UInt
            '';
          };
        };
      };
      default = {};
      description = "Reviews";
    };    
    "Search" = with types; mkOption {
      type = submodule {
        options = { 
          "SearchCaseSensitive" = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          "SearchFromCurrentPage" = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          "FindAsYouType" = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
        };
      };
      default = {};
      description = "Search";
    };    
    "Zoom" = with types; mkOption {
      type = submodule {
        options = { 
          "ZoomMode" = mkOption {
            type = nullOr (either str int);
            default = 1;
            description = ''
              

              Type: UInt
              Max: 3
            '';
          };
        };
      };
      default = {};
      description = "Zoom";
    };    
  };
  config = mkIf cfg.enable {
    programs.plasma.files."okularrc" = cfg.okular;
  };
}
