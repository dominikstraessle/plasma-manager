{ config, lib, pkgs, ... }:
with lib;
let
  cfg = config.programs.plasma;
  moduleCfg = config.programs.plasma.ark;
in {
  options.programs.plasma.ark = {
    enable = mkEnableOption ''
      Enable ark
    '';
    package = mkOption {
      default = if (pkgs ? ark) then
                        pkgs.ark
                      else
                        (if pkgs.libsForQt5 ? ark then pkgs.libsForQt5.ark else false);
      defaultText = literalExpression "pkgs.ark";
      type = with types; either bool package;
      description = mdDoc "Package to use.";
    };
    "Extraction" = with types; mkOption {
      type = submodule {
        options = { 
          closeAfterExtraction = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Close Ark after extraction.

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
          openDestinationFolderAfterExtraction = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Open destination folder after extraction.

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
        };
      };
      default = {};
      description = "Extraction";
    };    
    "General" = with types; mkOption {
      type = submodule {
        options = { 
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
          showEncryptionWarning = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Whether to show a warning when creating zip archives with AES encryption.

              Type: Bool
            '';
          };
        };
      };
      default = {};
      description = "General";
    };    
    "MainWindow" = with types; mkOption {
      type = submodule {
        options = { 
          showInfoPanel = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Whether to show the information panel.

              Type: Bool
            '';
          };
          splitterSizes = mkOption {
            type = nullOr (either str (listOf int));
            default = "200,100";
            description = ''
              How the main window is divided.

              Type: IntList
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
  config = mkIf (cfg.enable && moduleCfg.enable) {
    home.packages = mkIf moduleCfg.package [ moduleCfg.package ];
    programs.plasma.files."arkrc" = removeAttrs moduleCfg [ "enable" "package" ];
  };
}
