{ config, lib, ... }:
with lib;
let
  cfg = config.programs.plasma;
  moduleCfg = config.programs.plasma.incidenceeditor;
in {
  options.programs.plasma.incidenceeditor = {
    enable = mkEnableOption ''
      Enable incidenceeditor
    '';
    package = mkOption {
      default = if (pkgs ? incidenceeditor) then
                        pkgs.incidenceeditor
                      else
                        (if pkgs.libsForQt5 ? incidenceeditor then pkgs.libsForQt5.incidenceeditor else false);
      defaultText = literalExpression "pkgs.incidenceeditor";
      type = with types; either bool package;
      description = mdDoc "Package to use.";
    };
    "AttachmentHandling" = with types; mkOption {
      type = submodule {
        options = { 
          DefaultEmailAttachMethod = mkOption {
            type = nullOr (either str (enum [ 
              "Ask"
              "Link"
              "InlineFull"
              "InlineBody"
            ]));
            default = "Ask";
            description = ''
              Default Email Attachment Method

              Type: Enum
              Choices: 
                - Ask: Always ask
                - Link: Only attach link to message
                - InlineFull: Attach complete message
                - InlineBody: Attach message without attachments
            '';
          };
        };
      };
      default = {};
      description = "AttachmentHandling";
    };    
  };
  config = mkIf (cfg.enable && moduleCfg.enable) {
    home.packages = mkIf moduleCfg.package [ moduleCfg.package ];
    programs.plasma.files."incidenceeditorrc" = removeAttrs moduleCfg [ "enable" "package" ];
  };
}
