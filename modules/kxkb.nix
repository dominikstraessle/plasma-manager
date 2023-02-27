{ config, lib, pkgs, ... }:
with lib;
let
  cfg = config.programs.plasma;
  moduleCfg = config.programs.plasma.kxkb;
in {
  options.programs.plasma.kxkb = {
    enable = mkEnableOption ''
      Enable kxkb
    '';
    package = mkOption {
      default = if (pkgs ? kxkb) then
                        pkgs.kxkb
                      else
                        (if pkgs.libsForQt5 ? kxkb then pkgs.libsForQt5.kxkb else false);
      defaultText = literalExpression "pkgs.kxkb";
      type = with types; either bool package;
      description = mdDoc "Package to use.";
    };
    "Layout" = with types; mkOption {
      type = submodule {
        options = { 
          DisplayNames = mkOption {
            type = nullOr (either str (listOf str));
            default = null;
            defaultText = "QStringList()";
            description = ''
              

              Type: StringList
            '';
          };
          LayoutList = mkOption {
            type = nullOr (either str (listOf str));
            default = null;
            defaultText = "QStringList()";
            description = ''
              

              Type: StringList
            '';
          };
          LayoutLoopCount = mkOption {
            type = nullOr (either str int);
            default = -1;
            description = ''
              

              Type: Int
            '';
          };
          Model = mkOption {
            type = nullOr str;
            default = "pc104";
            description = ''
              

              Type: String
            '';
          };
          Options = mkOption {
            type = nullOr (either str (listOf str));
            default = null;
            defaultText = "QStringList()";
            description = ''
              

              Type: StringList
            '';
          };
          ResetOldOptions = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          SwitchMode = mkOption {
            type = nullOr str;
            default = "Global";
            description = ''
              

              Type: String
            '';
          };
          Use = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          VariantList = mkOption {
            type = nullOr (either str (listOf str));
            default = null;
            defaultText = "QStringList()";
            description = ''
              

              Type: StringList
            '';
          };
        };
      };
      default = {};
      description = "Layout";
    };    
  };
  config = mkIf (cfg.enable && moduleCfg.enable) {
    home.packages = mkIf (moduleCfg.package != false) [ moduleCfg.package ];
    programs.plasma.files."kxkbrc" = removeAttrs moduleCfg [ "enable" "package" ];
  };
}
