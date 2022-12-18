{ config, lib, ... }:
with lib;
let cfg = config.programs.plasma;
in {
  options.programs.plasma.kwin = { 
    "Effect-DesktopGrid" = with types; mkOption {
      type = submodule {
        options = { 
          "BorderActivate" = mkOption {
            type = nullOr (either str (listOf int));
            default = "ElectricNone";
            description = ''
              

              Type: IntList
            '';
          };
        };
      };
      default = {};
      description = "Effect-DesktopGrid";
    };    
    "Effect-Overview" = with types; mkOption {
      type = submodule {
        options = { 
          "BorderActivate" = mkOption {
            type = nullOr (either str (listOf int));
            default = "ElectricNone";
            description = ''
              

              Type: IntList
            '';
          };
        };
      };
      default = {};
      description = "Effect-Overview";
    };    
    "Effect-windowview" = with types; mkOption {
      type = submodule {
        options = { 
          "BorderActivateAll" = mkOption {
            type = nullOr (either str (listOf int));
            default = "ElectricTopLeft";
            description = ''
              

              Type: IntList
            '';
          };
          "BorderActivate" = mkOption {
            type = nullOr (either str (listOf int));
            default = "ElectricNone";
            description = ''
              

              Type: IntList
            '';
          };
          "BorderActivateClass" = mkOption {
            type = nullOr (either str (listOf int));
            default = "ElectricNone";
            description = ''
              

              Type: IntList
            '';
          };
        };
      };
      default = {};
      description = "Effect-windowview";
    };    
    "ElectricBorders" = with types; mkOption {
      type = submodule {
        options = { 
          "Top" = mkOption {
            type = nullOr str;
            default = "None";
            description = ''
              

              Type: String
            '';
          };
          "TopRight" = mkOption {
            type = nullOr str;
            default = "None";
            description = ''
              

              Type: String
            '';
          };
          "Right" = mkOption {
            type = nullOr str;
            default = "None";
            description = ''
              

              Type: String
            '';
          };
          "BottomRight" = mkOption {
            type = nullOr str;
            default = "None";
            description = ''
              

              Type: String
            '';
          };
          "Bottom" = mkOption {
            type = nullOr str;
            default = "None";
            description = ''
              

              Type: String
            '';
          };
          "BottomLeft" = mkOption {
            type = nullOr str;
            default = "None";
            description = ''
              

              Type: String
            '';
          };
          "Left" = mkOption {
            type = nullOr str;
            default = "None";
            description = ''
              

              Type: String
            '';
          };
          "TopLeft" = mkOption {
            type = nullOr str;
            default = "None";
            description = ''
              

              Type: String
            '';
          };
        };
      };
      default = {};
      description = "ElectricBorders";
    };    
    "ScreenEdges" = with types; mkOption {
      type = submodule {
        options = { 
          RemainActiveOnFullscreen = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
        };
      };
      default = {};
      description = "ScreenEdges";
    };    
    "TabBox" = with types; mkOption {
      type = submodule {
        options = { 
          "BorderActivate" = mkOption {
            type = nullOr (either str (listOf int));
            default = "ElectricNone";
            description = ''
              

              Type: IntList
            '';
          };
          "BorderAlternativeActivate" = mkOption {
            type = nullOr (either str (listOf int));
            default = "ElectricNone";
            description = ''
              

              Type: IntList
            '';
          };
        };
      };
      default = {};
      description = "TabBox";
    };    
    "Windows" = with types; mkOption {
      type = submodule {
        options = { 
          "ElectricBorders" = mkOption {
            type = nullOr (either str int);
            default = 0;
            description = ''
              

              Type: Int
            '';
          };
          "ElectricBorderDelay" = mkOption {
            type = nullOr (either str int);
            default = 150;
            description = ''
              

              Type: Int
            '';
          };
          "ElectricBorderCooldown" = mkOption {
            type = nullOr (either str int);
            default = 350;
            description = ''
              

              Type: Int
            '';
          };
          "ElectricBorderMaximize" = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          "ElectricBorderTiling" = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          "ElectricBorderCornerRatio" = mkOption {
            type = nullOr (either str float);
            default = 0.25;
            description = ''
              

              Type: Double
            '';
          };
        };
      };
      default = {};
      description = "Windows";
    };    
  };
  config = mkIf cfg.enable {
    programs.plasma.files."kwinrc" = cfg.kwin;
  };
}
