{ config, lib, ... }:
with lib;
let cfg = config.programs.plasma;
in {
  options.programs.plasma.haruna = { 
    "General" = with types; mkOption {
      type = submodule {
        options = { 
          OsdFontSize = mkOption {
            type = nullOr (either str int);
            default = 25;
            description = ''
              

              Type: Int
            '';
          };
          VolumeStep = mkOption {
            type = nullOr (either str int);
            default = 5;
            description = ''
              

              Type: Int
            '';
          };
          SeekSmallStep = mkOption {
            type = nullOr (either str int);
            default = 5;
            description = ''
              

              Type: Int
            '';
          };
          SeekMediumStep = mkOption {
            type = nullOr (either str int);
            default = 15;
            description = ''
              

              Type: Int
            '';
          };
          SeekBigStep = mkOption {
            type = nullOr (either str int);
            default = 30;
            description = ''
              

              Type: Int
            '';
          };
          ShowMenuBar = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: bool
            '';
          };
          ShowHeader = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: bool
            '';
          };
          ShowChapterMarkers = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: bool
            '';
          };
          ColorScheme = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              

              Type: String
            '';
          };
          UseBreezeIconTheme = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: bool
            '';
          };
          GuiStyle = mkOption {
            type = nullOr str;
            default = "Default";
            description = ''
              

              Type: String
            '';
          };
          Volume = mkOption {
            type = nullOr (either str int);
            default = 80;
            description = ''
              

              Type: Int
            '';
          };
          LastPlayedFile = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              

              Type: String
            '';
          };
          LastPlaylist = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              

              Type: String
            '';
          };
          FileDialogLocation = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              

              Type: String
            '';
          };
          FileDialogLastLocation = mkOption {
            type = nullOr str;
            default = "videoFolder";
            defaultText = "Code: true";
            description = ''
              

              Type: String
            '';
          };
          LastUrl = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              

              Type: String
            '';
          };
          MaxRecentFiles = mkOption {
            type = nullOr (either str int);
            default = 10;
            description = ''
              

              Type: Int
            '';
          };
          RememberWindowGeometry = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: bool
            '';
          };
        };
      };
      default = {};
      description = "General";
    };    
  };
  config = mkIf cfg.enable {
    programs.plasma.files."haruna/haruna.conf" = cfg.haruna;
  };
}
