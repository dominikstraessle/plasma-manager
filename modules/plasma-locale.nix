{ config, lib, pkgs, ... }:
with lib;
let
  cfg = config.programs.plasma;
  moduleCfg = config.programs.plasma.plasma-locale;
in {
  options.programs.plasma.plasma-locale = {
    enable = mkEnableOption ''
      Enable plasma-locale
    '';
    package = mkOption {
      default = if (pkgs ? plasma-locale) then
                        pkgs.plasma-locale
                      else
                        (if pkgs.libsForQt5 ? plasma-locale then pkgs.libsForQt5.plasma-locale else false);
      defaultText = literalExpression "pkgs.plasma-locale";
      type = with types; either bool package;
      description = mdDoc "Package to use.";
    };
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
  config = mkIf (cfg.enable && moduleCfg.enable) {
    home.packages = mkIf (moduleCfg.package != false) [ moduleCfg.package ];
    programs.plasma.files."plasma-localerc" = removeAttrs moduleCfg [ "enable" "package" ];
  };
}
