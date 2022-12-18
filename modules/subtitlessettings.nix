{ config, lib, ... }:
with lib;
let cfg = config.programs.plasma;
in {
  options.programs.plasma.haruna = { 
    "Subtitles" = with types; mkOption {
      type = submodule {
        options = { 
          SubtitlesFolders = mkOption {
            type = nullOr (either str (listOf str));
            default = "subs";
            description = ''
              

              Type: StringList
            '';
          };
          PreferredLanguage = mkOption {
            type = nullOr (either str str);
            default = "";
            description = ''
              

              Type: String
            '';
          };
          PreferredTrack = mkOption {
            type = nullOr (either str int);
            default = "";
            description = ''
              

              Type: Int
            '';
          };
          AllowOnBlackBorders = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          FontFamily = mkOption {
            type = nullOr (either str str);
            default = "Sans Serif";
            description = ''
              

              Type: String
            '';
          };
          FontSize = mkOption {
            type = nullOr (either str int);
            default = "";
            description = ''
              

              Type: Int
            '';
          };
          FontColor = mkOption {
            type = nullOr (either str str);
            default = "#FFFFFFFF";
            description = ''
              

              Type: String
            '';
          };
          ShadowColor = mkOption {
            type = nullOr (either str str);
            default = "#80F0F0F0";
            description = ''
              

              Type: String
            '';
          };
          ShadowOffset = mkOption {
            type = nullOr (either str int);
            default = 0;
            description = ''
              

              Type: Int
            '';
          };
          BorderColor = mkOption {
            type = nullOr (either str str);
            default = "#FF000000";
            description = ''
              

              Type: String
            '';
          };
          BorderSize = mkOption {
            type = nullOr (either str int);
            default = 3;
            description = ''
              

              Type: Int
            '';
          };
          IsBold = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          IsItalic = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
        };
      };
      default = {};
      description = "Subtitles";
    };    
  };
  config = mkIf cfg.enable {
    programs.plasma.files."haruna/haruna.conf" = cfg.haruna;
  };
}
