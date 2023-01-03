{ config, lib, ... }:
with lib;
let cfg = config.programs.plasma;
in {
  options.programs.plasma.plasma-integration = { 
    "QtQuickRendererSettings" = with types; mkOption {
      type = submodule {
        options = { 
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
    programs.plasma.files."plasma-integrationrc" = cfg.plasma-integration;
  };
}
