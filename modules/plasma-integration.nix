{ config, lib, ... }:
with lib;
let
  cfg = config.programs.plasma;
  moduleCfg = config.programs.plasma.plasma-integration;
in {
  options.programs.plasma.plasma-integration = {
    enable = mkEnableOption ''
      Enable plasma-integration
    '';
    package = mkOption {
      default = if (pkgs ? plasma-integration) then
                        pkgs.plasma-integration
                      else
                        (if pkgs.libsForQt5 ? plasma-integration then pkgs.libsForQt5.plasma-integration else false);
      defaultText = literalExpression "pkgs.plasma-integration";
      type = either bool types.package;
      description = mdDoc "Package to use.";
    };
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
  config = mkIf (cfg.enable && moduleCfg.enable) {
    home.packages = mkIf moduleCfg.package [ moduleCfg.package ];
    programs.plasma.files."plasma-integrationrc" = removeAttrs moduleCfg [ "enable" "package" ];
  };
}
