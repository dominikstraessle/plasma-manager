{ config, lib, ... }:
with lib;
let cfg = config.programs.plasma;
in {
  options.programs.plasma.ark = { 
    "General" = with types; mkOption {
      type = submodule {
        options = { 
          showEncryptionWarning = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Whether to show a warning when creating zip archives with AES encryption.

              Type: Bool
            '';
          };
          defaultOpenAction = mkOption {
            type = nullOr (either str (enum [ 
              "Preview"
              "Open"
            ]));
            default = "Preview";
            description = ''
              Default action when opening archive entries.

              Type: Enum
              Choices: 
                - Preview
                - Open
            '';
          };
        };
      };
      default = {};
      description = "General";
    };    
    "Extraction" = with types; mkOption {
      type = submodule {
        options = { 
          openDestinationFolderAfterExtraction = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Open destination folder after extraction.

              Type: Bool
            '';
          };
          closeAfterExtraction = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Close Ark after extraction.

              Type: Bool
            '';
          };
          preservePaths = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Preserve paths when extracting.

              Type: Bool
            '';
          };
          extractToSubfolder = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Extract to a subfolder if the archive has more than one top-level entry.

              Type: Bool
            '';
          };
        };
      };
      default = {};
      description = "Extraction";
    };    
    "MainWindow" = with types; mkOption {
      type = submodule {
        options = { 
          splitterSizes = mkOption {
            type = nullOr (either str (listOf int));
            default = "200,100";
            description = ''
              How the main window is divided.

              Type: IntList
            '';
          };
          showInfoPanel = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Whether to show the information panel.

              Type: Bool
            '';
          };
        };
      };
      default = {};
      description = "MainWindow";
    };    
    "Plugins" = with types; mkOption {
      type = submodule {
        options = { 
          disabledPlugins = mkOption {
            type = nullOr (either str (listOf str));
            default = "";
            description = ''
              

              Type: StringList
            '';
          };
        };
      };
      default = {};
      description = "Plugins";
    };    
    "Preview" = with types; mkOption {
      type = submodule {
        options = { 
          limitPreviewFileSize = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Whether to limit the preview according to file size.

              Type: Bool
            '';
          };
          previewFileSizeLimit = mkOption {
            type = nullOr (either str int);
            default = 200;
            description = ''
              Preview file size limit in megabytes.

              Type: Int
            '';
          };
        };
      };
      default = {};
      description = "Preview";
    };    
  };
  config = mkIf cfg.enable {
    programs.plasma.files."arkrc" = cfg.ark;
  };
}
