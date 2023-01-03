{ config, lib, ... }:
with lib;
let cfg = config.programs.plasma;
in {
  options.programs.plasma.kdeclarative = { 
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
  config = mkIf cfg.enable {
    programs.plasma.files."kdeclarativerc" = cfg.kdeclarative;
  };
}
