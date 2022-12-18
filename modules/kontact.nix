{ config, lib, ... }:
with lib;
let cfg = config.programs.plasma;
in {
  options.programs.plasma.kontact = { 
    "View" = with types; mkOption {
      type = submodule {
        options = { 
          ActivePlugin = mkOption {
            type = nullOr str;
            default = "kontact_summaryplugin";
            description = ''
              

              Type: String
            '';
          };
          ForceStartupPlugin = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Always start with plugin:

              Type: Bool
            '';
          };
          ForcedStartupPlugin = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              

              Type: String
            '';
          };
          SideBarOpen = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Show the component sidebar

              Type: Bool
            '';
          };
          SidePaneSplitter = mkOption {
            type = nullOr (either str (listOf int));
            default = "1";
            description = ''
              

              Type: IntList
            '';
          };
          SidePaneIconSize = mkOption {
            type = nullOr (either str int);
            default = 32;
            description = ''
              

              Type: Int
            '';
          };
          SidePaneShowIcons = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          SidePaneShowText = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          LastVersionSeen = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              

              Type: String
            '';
          };
          "ShowMenuBar" = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
        };
      };
      default = {};
      description = "View";
    };    
  };
  config = mkIf cfg.enable {
    programs.plasma.files."kontactrc" = cfg.kontact;
  };
}
