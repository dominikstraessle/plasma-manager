{ config, lib, ... }:
with lib;
let cfg = config.programs.plasma;
in {
  options.programs.plasma.akonadi_newmailnotifier = { 
    "General" = with types; mkOption {
      type = submodule {
        options = { 
          enabled = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          excludeEmailsFromMe = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          keepPersistentNotification = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          replyMail = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          replyMailType = mkOption {
            type = nullOr (either str int);
            default = 0;
            description = ''
              

              Type: Int
            '';
          };
          showButtonToDisplayMail = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          showFolder = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          showFrom = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          showPhoto = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          showSubject = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          textToSpeak = mkOption {
            type = nullOr str;
            default = ''i18nc("%f is a variable for agent. Do not change it", "A message was received from %f")'';
            defaultText = "Code: true";
            description = ''
              

              Type: String
            '';
          };
          textToSpeakEnabled = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          verboseNotification = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

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
    programs.plasma.files."akonadi_newmailnotifier_agentrc" = cfg.akonadi_newmailnotifier;
  };
}
