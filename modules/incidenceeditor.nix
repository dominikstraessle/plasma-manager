{ config, lib, ... }:
with lib;
let cfg = config.programs.plasma;
in {
  options.programs.plasma.incidenceeditor = { 
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
  config = mkIf cfg.enable {
    programs.plasma.files."incidenceeditorrc" = cfg.incidenceeditor;
  };
}
