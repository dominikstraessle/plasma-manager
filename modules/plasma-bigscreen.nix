{ config, lib, ... }:
with lib;
let
  cfg = config.programs.plasma;
  moduleCfg = config.programs.plasma.plasma-bigscreen;
in {
  options.programs.plasma.plasma-bigscreen = {
    enable = mkEnableOption ''
      Enable plasma-bigscreen
    '';
    package = mkOption {
      default = if (pkgs ? plasma-bigscreen) then
                        pkgs.plasma-bigscreen
                      else
                        (if pkgs.libsForQt5 ? plasma-bigscreen then pkgs.libsForQt5.plasma-bigscreen else false);
      defaultText = literalExpression "pkgs.plasma-bigscreen";
      type = either bool types.package;
      description = mdDoc "Package to use.";
    };
    "General" = with types; mkOption {
      type = submodule {
        options = { 
          coloredTiles = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          conversationview = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          dashboardview = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          enableRemoteSTT = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          enableRemoteTTS = mkOption {
            type = nullOr (either str bool);
            default = "";
            description = ''
              

              Type: Bool
            '';
          };
          expandingTiles = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          notifications = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          socketAddress = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              

              Type: String
            '';
          };
        };
      };
      default = {};
      description = "General";
    };    
  };
  config = mkIf (cfg.enable && moduleCfg.enable) {
    home.packages = mkIf moduleCfg.package [ moduleCfg.package ];
    programs.plasma.files."plasma-bigscreenrc" = removeAttrs moduleCfg [ "enable" "package" ];
  };
}
