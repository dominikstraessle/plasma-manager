{ config, lib, ... }:
with lib;
let cfg = config.programs.plasma;
in {
  options.programs.plasma.kwin = { 
    "$(TabBoxGroup)" = with types; mkOption {
      type = submodule {
        options = { 
          "DesktopMode" = mkOption {
            type = nullOr (either str int);
            default = "TabBoxConfig::defaultDesktopMode()";
            defaultText = "Code: true";
            description = ''
              

              Type: Int
            '';
          };
          "ActivitiesMode" = mkOption {
            type = nullOr (either str int);
            default = "TabBoxConfig::defaultActivitiesMode()";
            defaultText = "Code: true";
            description = ''
              

              Type: Int
            '';
          };
          "ApplicationsMode" = mkOption {
            type = nullOr (either str int);
            default = "TabBoxConfig::defaultApplicationsMode()";
            defaultText = "Code: true";
            description = ''
              

              Type: Int
            '';
          };
          "OrderMinimizedMode" = mkOption {
            type = nullOr (either str int);
            default = "TabBoxConfig::defaultOrderMinimizedMode()";
            defaultText = "Code: true";
            description = ''
              

              Type: Int
            '';
          };
          "MinimizedMode" = mkOption {
            type = nullOr (either str int);
            default = "TabBoxConfig::defaultMinimizedMode()";
            defaultText = "Code: true";
            description = ''
              

              Type: Int
            '';
          };
          "ShowDesktopMode" = mkOption {
            type = nullOr (either str int);
            default = "TabBoxConfig::defaultShowDesktopMode()";
            defaultText = "Code: true";
            description = ''
              

              Type: Int
            '';
          };
          "MultiScreenMode" = mkOption {
            type = nullOr (either str int);
            default = "TabBoxConfig::defaultMultiScreenMode()";
            defaultText = "Code: true";
            description = ''
              

              Type: Int
            '';
          };
          "SwitchingMode" = mkOption {
            type = nullOr (either str int);
            default = "TabBoxConfig::defaultSwitchingMode()";
            defaultText = "Code: true";
            description = ''
              

              Type: Int
            '';
          };
          "LayoutName" = mkOption {
            type = nullOr (either str str);
            default = "TabBoxConfig::defaultLayoutName()";
            defaultText = "Code: true";
            description = ''
              

              Type: String
            '';
          };
          "ShowTabBox" = mkOption {
            type = nullOr (either str bool);
            default = "TabBoxConfig::defaultShowTabBox()";
            defaultText = "Code: true";
            description = ''
              

              Type: Bool
            '';
          };
          "HighlightWindows" = mkOption {
            type = nullOr (either str bool);
            default = "TabBoxConfig::defaultHighlightWindow()";
            defaultText = "Code: true";
            description = ''
              

              Type: Bool
            '';
          };
        };
      };
      default = {};
      description = "$(TabBoxGroup)";
    };    
  };
  config = mkIf cfg.enable {
    programs.plasma.files."kwinrc" = cfg.kwin;
  };
}
