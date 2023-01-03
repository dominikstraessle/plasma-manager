{ config, lib, ... }:
with lib;
let cfg = config.programs.plasma;
in {
  options.programs.plasma.plasma-bigscreen = { 
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
  config = mkIf cfg.enable {
    programs.plasma.files."plasma-bigscreenrc" = cfg.plasma-bigscreen;
  };
}
