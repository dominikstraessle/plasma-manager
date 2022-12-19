{ config, lib, ... }:
with lib;
let cfg = config.programs.plasma;
in {
  options.programs.plasma.baloo = { 
    "Basic Settings" = with types; mkOption {
      type = submodule {
        options = { 
          "Indexing-Enabled" = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Indexing-Enabled

              Type: Bool
            '';
          };
        };
      };
      default = {};
      description = "Basic Settings";
    };    
    "General" = with types; mkOption {
      type = submodule {
        options = { 
          dbVersion = mkOption {
            type = nullOr (either str int);
            default = 0;
            description = ''
              db version

              Type: Int
            '';
          };
          "disable initial update" = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              disable initial update (deprecated)

              Type: Bool
            '';
          };
          "exclude filters" = mkOption {
            type = nullOr (either str (listOf str));
            default = "Baloo::defaultExcludeFilterList()";
            defaultText = "Code: true";
            description = ''
              exclude filters

              Type: StringList
            '';
          };
          "exclude filters version" = mkOption {
            type = nullOr (either str int);
            default = 0;
            description = ''
              exclude filters version

              Type: Int
            '';
          };
          "exclude folders" = mkOption {
            type = nullOr (either str (listOf str));
            default = "QStringList()";
            defaultText = "Code: true";
            description = ''
              exclude folders

              Type: PathList
            '';
          };
          "exclude mimetypes" = mkOption {
            type = nullOr (either str (listOf str));
            default = "Baloo::defaultExcludeMimetypes()";
            defaultText = "Code: true";
            description = ''
              exclude mimetypes

              Type: StringList
            '';
          };
          folders = mkOption {
            type = nullOr (either str (listOf str));
            default = "QStringList() << QDir::homePath()";
            defaultText = "Code: true";
            description = ''
              folders

              Type: PathList
            '';
          };
          "index hidden folders" = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              index hidden folders

              Type: Bool
            '';
          };
          "only basic indexing" = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              only basic indexing

              Type: Bool
            '';
          };
        };
      };
      default = {};
      description = "General";
    };    
  };
  config = mkIf cfg.enable {
    programs.plasma.files."baloofilerc" = cfg.baloo;
  };
}
