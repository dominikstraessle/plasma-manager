{ config, lib, ... }:
with lib;
let
  cfg = config.programs.plasma;
  moduleCfg = config.programs.plasma.koko;
in {
  options.programs.plasma.koko = {
    enable = mkEnableOption ''
      Enable koko
    '';
    package = mkOption {
      default = if (pkgs ? koko) then
                        pkgs.koko
                      else
                        (if pkgs.libsForQt5 ? koko then pkgs.libsForQt5.koko else false);
      defaultText = literalExpression "pkgs.koko";
      type = with types; either bool package;
      description = mdDoc "Package to use.";
    };
    "Backend" = with types; mkOption {
      type = submodule {
        options = { 
          InitialRun = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Initial Run

              Type: Bool
            '';
          };
        };
      };
      default = {};
      description = "Backend";
    };    
    "General" = with types; mkOption {
      type = submodule {
        options = { 
          IconSize = mkOption {
            type = nullOr (either str int);
            default = 64;
            description = ''
              Thumbnail Size

              Type: Int
            '';
          };
          ImageViewPreview = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Show a thumbnail carousel in image view

              Type: Bool
            '';
          };
          SavedFolders = mkOption {
            type = nullOr (either str (listOf str));
            default = "";
            description = ''
              List of saved folders.

              Type: PathList
            '';
          };
        };
      };
      default = {};
      description = "General";
    };    
    "Slideshow" = with types; mkOption {
      type = submodule {
        options = { 
          LoopImages = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Loop Slideshow

              Type: Bool
            '';
          };
          NextImageInterval = mkOption {
            type = nullOr (either str int);
            default = 5;
            description = ''
              Interval until next image

              Type: Int
            '';
          };
          RandomizeImages = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Randomize Slideshow

              Type: Bool
            '';
          };
        };
      };
      default = {};
      description = "Slideshow";
    };    
    "WindowState" = with types; mkOption {
      type = submodule {
        options = { 
          ControlsVisible = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Last saved state for Kirigami AbstractApplicationWindow::controlsVisible

              Type: Bool
            '';
          };
          Height = mkOption {
            type = nullOr (either str int);
            default = -1;
            description = ''
              Last saved state for QWindow::height

              Type: Int
            '';
          };
          Visibility = mkOption {
            type = nullOr (either str (enum [ 
              "Hidden"
              "AutomaticVisibility"
              "Windowed"
              "Minimized"
              "Maximized"
              "FullScreen"
            ]));
            default = "AutomaticVisibility";
            description = ''
              Last saved state for QWindow::visibility

              Type: Enum
              Choices: 
                - Hidden
                - AutomaticVisibility
                - Windowed
                - Minimized
                - Maximized
                - FullScreen
            '';
          };
          Width = mkOption {
            type = nullOr (either str int);
            default = -1;
            description = ''
              Last saved state for QWindow::width

              Type: Int
            '';
          };
        };
      };
      default = {};
      description = "WindowState";
    };    
  };
  config = mkIf (cfg.enable && moduleCfg.enable) {
    home.packages = mkIf moduleCfg.package [ moduleCfg.package ];
    programs.plasma.files."kokorc" = removeAttrs moduleCfg [ "enable" "package" ];
  };
}
