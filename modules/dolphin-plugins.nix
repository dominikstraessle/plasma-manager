{ config, lib, ... }:
with lib;
let
  cfg = config.programs.plasma;
  moduleCfg = config.programs.plasma.dolphin-plugins;
in {
  options.programs.plasma.dolphin-plugins = {
    enable = mkEnableOption ''
      Enable dolphin-plugins
    '';
    package = mkOption {
      default = if (pkgs ? dolphin-plugins) then
                        pkgs.dolphin-plugins
                      else
                        (if pkgs.libsForQt5 ? dolphin-plugins then pkgs.libsForQt5.dolphin-plugins else false);
      defaultText = literalExpression "pkgs.dolphin-plugins";
      type = with types; either bool package;
      description = mdDoc "Package to use.";
    };
    "BackoutDialogSettings" = with types; mkOption {
      type = submodule {
        options = { 
          backoutDialogHeight = mkOption {
            type = nullOr (either str int);
            default = 346;
            description = ''
              Dialog height

              Type: Int
            '';
          };
          backoutDialogWidth = mkOption {
            type = nullOr (either str int);
            default = 537;
            description = ''
              Dialog width

              Type: Int
            '';
          };
        };
      };
      default = {};
      description = "BackoutDialogSettings";
    };    
    "BundleDialogSettings" = with types; mkOption {
      type = submodule {
        options = { 
          bundleDialogHeight = mkOption {
            type = nullOr (either str int);
            default = 550;
            description = ''
              Dialog height

              Type: Int
            '';
          };
          bundleDialogWidth = mkOption {
            type = nullOr (either str int);
            default = 900;
            description = ''
              Dialog width

              Type: Int
            '';
          };
        };
      };
      default = {};
      description = "BundleDialogSettings";
    };    
    "CloneDialogSettings" = with types; mkOption {
      type = submodule {
        options = { 
          cloneDialogHeight = mkOption {
            type = nullOr (either str int);
            default = 550;
            description = ''
              Dialog height

              Type: Int
            '';
          };
          cloneDialogWidth = mkOption {
            type = nullOr (either str int);
            default = 900;
            description = ''
              Dialog width

              Type: Int
            '';
          };
        };
      };
      default = {};
      description = "CloneDialogSettings";
    };    
    "CommitDialogSettings" = with types; mkOption {
      type = submodule {
        options = { 
          commitDialogHeight = mkOption {
            type = nullOr (either str int);
            default = 300;
            description = ''
              Dialog height

              Type: Int
              Min: 50
            '';
          };
          commitDialogWidth = mkOption {
            type = nullOr (either str int);
            default = 500;
            description = ''
              Dialog width

              Type: Int
              Min: 50
            '';
          };
          horizontalSplitterSizes = mkOption {
            type = nullOr (either str (listOf int));
            default = "100,350";
            description = ''
              Divides commit editor and diff editor

              Type: IntList
            '';
          };
          verticalSplitterSizes = mkOption {
            type = nullOr (either str (listOf int));
            default = "200,700";
            description = ''
              Divides file list and editors with commit details

              Type: IntList
            '';
          };
        };
      };
      default = {};
      description = "CommitDialogSettings";
    };    
    "ConfigDialogSettings" = with types; mkOption {
      type = submodule {
        options = { 
          configDialogHeight = mkOption {
            type = nullOr (either str int);
            default = 550;
            description = ''
              Dialog height

              Type: Int
              Min: 400
            '';
          };
          configDialogWidth = mkOption {
            type = nullOr (either str int);
            default = 900;
            description = ''
              Dialog width

              Type: Int
              Min: 500
            '';
          };
        };
      };
      default = {};
      description = "ConfigDialogSettings";
    };    
    "ExportDialogSettings" = with types; mkOption {
      type = submodule {
        options = { 
          exportDialogHeight = mkOption {
            type = nullOr (either str int);
            default = 550;
            description = ''
              Dialog height

              Type: Int
            '';
          };
          exportDialogWidth = mkOption {
            type = nullOr (either str int);
            default = 900;
            description = ''
              Dialog width

              Type: Int
            '';
          };
        };
      };
      default = {};
      description = "ExportDialogSettings";
    };    
    "General" = with types; mkOption {
      type = submodule {
        options = { 
          showUpdates = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Show updates

              Type: bool
            '';
          };
        };
      };
      default = {};
      description = "General";
    };    
    "ImportDialogSettings" = with types; mkOption {
      type = submodule {
        options = { 
          importDialogHeight = mkOption {
            type = nullOr (either str int);
            default = 540;
            description = ''
              Dialog height

              Type: Int
            '';
          };
          importDialogWidth = mkOption {
            type = nullOr (either str int);
            default = 500;
            description = ''
              Dialog width

              Type: Int
            '';
          };
        };
      };
      default = {};
      description = "ImportDialogSettings";
    };    
    "MergeDialogSettings" = with types; mkOption {
      type = submodule {
        options = { 
          mergeDialogHeight = mkOption {
            type = nullOr (either str int);
            default = 550;
            description = ''
              Dialog height

              Type: Int
            '';
          };
          mergeDialogWidth = mkOption {
            type = nullOr (either str int);
            default = 900;
            description = ''
              Dialog width

              Type: Int
            '';
          };
        };
      };
      default = {};
      description = "MergeDialogSettings";
    };    
    "PullDialogSettings" = with types; mkOption {
      type = submodule {
        options = { 
          pullDialogBigHeight = mkOption {
            type = nullOr (either str int);
            default = 550;
            description = ''
              Dialog height

              Type: Int
            '';
          };
          pullDialogBigWidth = mkOption {
            type = nullOr (either str int);
            default = 900;
            description = ''
              Dialog width

              Type: Int
            '';
          };
        };
      };
      default = {};
      description = "PullDialogSettings";
    };    
    "PushDialogSettings" = with types; mkOption {
      type = submodule {
        options = { 
          pushDialogBigHeight = mkOption {
            type = nullOr (either str int);
            default = 550;
            description = ''
              Dialog height

              Type: Int
            '';
          };
          pushDialogBigWidth = mkOption {
            type = nullOr (either str int);
            default = 900;
            description = ''
              Dialog width

              Type: Int
            '';
          };
        };
      };
      default = {};
      description = "PushDialogSettings";
    };    
    "ServeDialogSettings" = with types; mkOption {
      type = submodule {
        options = { 
          serveDialogHeight = mkOption {
            type = nullOr (either str int);
            default = 600;
            description = ''
              Dialog height

              Type: Int
            '';
          };
          serveDialogWidth = mkOption {
            type = nullOr (either str int);
            default = 500;
            description = ''
              Dialog width

              Type: Int
            '';
          };
        };
      };
      default = {};
      description = "ServeDialogSettings";
    };    
  };
  config = mkIf (cfg.enable && moduleCfg.enable) {
    home.packages = mkIf moduleCfg.package [ moduleCfg.package ];
    programs.plasma.files."fileviewgitpluginrc" = removeAttrs moduleCfg [ "enable" "package" ];
  };
}
