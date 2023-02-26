{ config, lib, ... }:
with lib;
let
  cfg = config.programs.plasma;
  moduleCfg = config.programs.plasma.GitKlientSettings;
in {
  options.programs.plasma.GitKlientSettings = {
    enable = mkEnableOption ''
      Enable GitKlientSettings
    '';
    package = mkOption {
      default = if (pkgs ? GitKlientSettings) then
                        pkgs.GitKlientSettings
                      else
                        (if pkgs.libsForQt5 ? GitKlientSettings then pkgs.libsForQt5.GitKlientSettings else false);
      defaultText = literalExpression "pkgs.GitKlientSettings";
      type = either bool types.package;
      description = mdDoc "Package to use.";
    };
    "Preferences" = with types; mkOption {
      type = submodule {
        options = { 
          calendarType = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              

              Type: String
            '';
          };
          calendarTypeIndex = mkOption {
            type = nullOr (either str int);
            default = "";
            description = ''
              

              Type: int
            '';
          };
          colorForeground = mkOption {
            type = nullOr str;
            default = "yellow";
            description = ''
              color of the foreground

              Type: Color
            '';
          };
          diffAddedColor = mkOption {
            type = nullOr str;
            default = "green";
            description = ''
              Added color

              Type: Color
            '';
          };
          diffModifiedColor = mkOption {
            type = nullOr str;
            default = "blue";
            description = ''
              Modified color

              Type: Color
            '';
          };
          diffRemovedColor = mkOption {
            type = nullOr str;
            default = "red";
            description = ''
              Removed color

              Type: Color
            '';
          };
          gitBinPath = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              age of the project

              Type: String
            '';
          };
          openLastRepo = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Open last repo at startup

              Type: Bool
            '';
          };
          registerDiffTool = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          registerMergeTool = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
        };
      };
      default = {};
      description = "Preferences";
    };    
  };
  config = mkIf (cfg.enable && moduleCfg.enable) {
    home.packages = mkIf moduleCfg.package [ moduleCfg.package ];
    programs.plasma.files."GitKlientSettings" = removeAttrs moduleCfg [ "enable" "package" ];
  };
}
