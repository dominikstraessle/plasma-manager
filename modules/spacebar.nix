{ config, lib, ... }:
with lib;
let cfg = config.programs.plasma;
in {
  options.programs.plasma.spacebar = { 
    "Appearance" = with types; mkOption {
      type = submodule {
        options = { 
          customMessageColors = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Use custom colors for messages

              Type: Bool
            '';
          };
          incomingMessageColor = mkOption {
            type = nullOr str;
            default = "#f6f5f4";
            description = ''
              Incoming message color

              Type: Color
            '';
          };
          messageFontSize = mkOption {
            type = nullOr (either str int);
            default = 0;
            description = ''
              Adjusts the font size for messages

              Type: Int
            '';
          };
          outgoingMessageColor = mkOption {
            type = nullOr str;
            default = "#fff4a2";
            description = ''
              Outgoing message color

              Type: Color
            '';
          };
        };
      };
      default = {};
      description = "Appearance";
    };    
    "Multimedia messages" = with types; mkOption {
      type = submodule {
        options = { 
          autoCreateSmil = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Auto create SMIL for outgoing messages containting multiple attachments

              Type: Bool
            '';
          };
          autoDownload = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Auto download messages

              Type: Bool
            '';
          };
          autoDownloadContactsOnly = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Existing contacts only

              Type: Bool
            '';
          };
          groupConversation = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Send messages as group conversations by default

              Type: Bool
            '';
          };
          maxAttachments = mkOption {
            type = nullOr (either str int);
            default = 15;
            description = ''
              Max attachments

              Type: Int
            '';
          };
          mmsPort = mkOption {
            type = nullOr (either str int);
            default = 8080;
            description = ''
              MMS port

              Type: int
            '';
          };
          mmsProxy = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              MMS proxy

              Type: String
            '';
          };
          mmsc = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              MMSC URL

              Type: String
            '';
          };
          requestDeliveryReports = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Request delivery reports

              Type: Bool
            '';
          };
          requestReadReports = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Request read reports

              Type: Bool
            '';
          };
          shareDeliveryStatus = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Share delivery status

              Type: Bool
            '';
          };
          shareReadStatus = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Share read status

              Type: Bool
            '';
          };
          totalMaxAttachmentSize = mkOption {
            type = nullOr (either str int);
            default = 500;
            description = ''
              Max message size

              Type: Int
            '';
          };
        };
      };
      default = {};
      description = "Multimedia messages";
    };    
    "Notifications" = with types; mkOption {
      type = submodule {
        options = { 
          ignoreTapbacks = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Ignore tapbacks

              Type: Bool
            '';
          };
          showAttachments = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Show attachment previews

              Type: Bool
            '';
          };
          showMessageContent = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Show a preview of the message content

              Type: Bool
            '';
          };
          showSenderInfo = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Show sender name / number

              Type: Bool
            '';
          };
        };
      };
      default = {};
      description = "Notifications";
    };    
  };
  config = mkIf cfg.enable {
    programs.plasma.files."spacebarrc" = cfg.spacebar;
  };
}
