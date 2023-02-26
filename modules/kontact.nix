{ config, lib, ... }:
with lib;
let
  cfg = config.programs.plasma;
  moduleCfg = config.programs.plasma.kontact;
in {
  options.programs.plasma.kontact = {
    enable = mkEnableOption ''
      Enable kontact
    '';
    package = mkOption {
      default = if (pkgs ? kontact) then
                        pkgs.kontact
                      else
                        (if pkgs.libsForQt5 ? kontact then pkgs.libsForQt5.kontact else false);
      defaultText = literalExpression "pkgs.kontact";
      type = either bool types.package;
      description = mdDoc "Package to use.";
    };
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
          LastVersionSeen = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              

              Type: String
            '';
          };
          ShowMenuBar = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
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
          SidePaneSplitter = mkOption {
            type = nullOr (either str (listOf int));
            default = "1";
            description = ''
              

              Type: IntList
            '';
          };
        };
      };
      default = {};
      description = "View";
    };    
  };
  config = mkIf (cfg.enable && moduleCfg.enable) {
    home.packages = mkIf moduleCfg.package [ moduleCfg.package ];
    programs.plasma.files."kontactrc" = removeAttrs moduleCfg [ "enable" "package" ];
  };
}
