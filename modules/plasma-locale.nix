{ config, lib, ... }:
with lib;
let cfg = config.programs.plasma;
in {
  options.programs.plasma.plasma-locale = { 
    "Formats" = with types; mkOption {
      type = submodule {
        options = { 
          LANG = mkOption {
            type = nullOr str;
            default = "lang";
            defaultText = "Code: true";
            description = ''
              

              Type: String
            '';
          };
          "LC_ADDRESS" = mkOption {
            type = nullOr str;
            default = ''i18n("Inherit Language")'';
            defaultText = "Code: true";
            description = ''
              

              Type: String
            '';
          };
          "LC_CTYPE" = mkOption {
            type = nullOr str;
            default = ''i18n("Inherit Language")'';
            defaultText = "Code: true";
            description = ''
              

              Type: String
            '';
          };
          "LC_MEASUREMENT" = mkOption {
            type = nullOr str;
            default = ''i18n("Inherit Language")'';
            defaultText = "Code: true";
            description = ''
              

              Type: String
            '';
          };
          "LC_MONETARY" = mkOption {
            type = nullOr str;
            default = ''i18n("Inherit Language")'';
            defaultText = "Code: true";
            description = ''
              

              Type: String
            '';
          };
          "LC_NAME" = mkOption {
            type = nullOr str;
            default = ''i18n("Inherit Language")'';
            defaultText = "Code: true";
            description = ''
              

              Type: String
            '';
          };
          "LC_NUMERIC" = mkOption {
            type = nullOr str;
            default = ''i18n("Inherit Language")'';
            defaultText = "Code: true";
            description = ''
              

              Type: String
            '';
          };
          "LC_PAGE" = mkOption {
            type = nullOr str;
            default = ''i18n("Inherit Language")'';
            defaultText = "Code: true";
            description = ''
              

              Type: String
            '';
          };
          "LC_TELEPHONE" = mkOption {
            type = nullOr str;
            default = ''i18n("Inherit Language")'';
            defaultText = "Code: true";
            description = ''
              

              Type: String
            '';
          };
          "LC_TIME" = mkOption {
            type = nullOr str;
            default = ''i18n("Inherit Language")'';
            defaultText = "Code: true";
            description = ''
              

              Type: String
            '';
          };
        };
      };
      default = {};
      description = "Formats";
    };    
    "Translations" = with types; mkOption {
      type = submodule {
        options = { 
          LANGUAGE = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              

              Type: String
            '';
          };
        };
      };
      default = {};
      description = "Translations";
    };    
  };
  config = mkIf cfg.enable {
    programs.plasma.files."plasma-localerc" = cfg.plasma-locale;
  };
}
