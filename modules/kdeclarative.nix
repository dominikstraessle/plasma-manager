{ config, lib, ... }:
with lib;
let
  cfg = config.programs.plasma;
  moduleCfg = config.programs.plasma.kdeclarative;
in {
  options.programs.plasma.kdeclarative = {
    enable = mkEnableOption ''
      Enable kdeclarative
    '';
    package = mkOption {
      default = if (pkgs ? kdeclarative) then
                        pkgs.kdeclarative
                      else
                        (if pkgs.libsForQt5 ? kdeclarative then pkgs.libsForQt5.kdeclarative else false);
      defaultText = literalExpression "pkgs.kdeclarative";
      type = either bool types.package;
      description = mdDoc "Package to use.";
    };
    "QtQuickRendererSettings" = with types; mkOption {
      type = submodule {
        options = { 
          ForceGlCoreProfile = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          GraphicsResetNotifications = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          RenderLoop = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              

              Type: String
            '';
          };
          SceneGraphBackend = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              

              Type: String
            '';
          };
        };
      };
      default = {};
      description = "QtQuickRendererSettings";
    };    
  };
  config = mkIf (cfg.enable && moduleCfg.enable) {
    home.packages = mkIf moduleCfg.package [ moduleCfg.package ];
    programs.plasma.files."kdeclarativerc" = removeAttrs moduleCfg [ "enable" "package" ];
  };
}
