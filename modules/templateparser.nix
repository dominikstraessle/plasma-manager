{ config, lib, ... }:
with lib;
let cfg = config.programs.plasma;
in {
  options.programs.plasma.templateparser = { 
    "TemplateParser" = with types; mkOption {
      type = submodule {
        options = { 
          CustomTemplates = mkOption {
            type = nullOr (either str (listOf str));
            default = "";
            description = ''
              

              Type: StringList
            '';
          };
          QuoteString = mkOption {
            type = nullOr str;
            default = "DefaultTemplates::defaultQuoteString()";
            defaultText = "Code: true";
            description = ''
              Quote characters

              Type: String
            '';
          };
          StripSignature = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Remove the signature when replying

              Type: Bool
            '';
          };
          TemplateForward = mkOption {
            type = nullOr str;
            default = "DefaultTemplates::defaultForward()";
            defaultText = "Code: true";
            description = ''
              Message template for forward

              Type: String
            '';
          };
          TemplateNewMessage = mkOption {
            type = nullOr str;
            default = "DefaultTemplates::defaultNewMessage()";
            defaultText = "Code: true";
            description = ''
              Message template for new message

              Type: String
            '';
          };
          TemplateReply = mkOption {
            type = nullOr str;
            default = "DefaultTemplates::defaultReply()";
            defaultText = "Code: true";
            description = ''
              Message template for reply

              Type: String
            '';
          };
          TemplateReplyAll = mkOption {
            type = nullOr str;
            default = "DefaultTemplates::defaultReplyAll()";
            defaultText = "Code: true";
            description = ''
              Message template for reply to all

              Type: String
            '';
          };
          replyUsingVisualFormat = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Reply or forward using the same visual format as the original message (plain text or HTML)

              Type: Bool
            '';
          };
          "smart-quote" = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Use smart &quoting

              Type: Bool
            '';
          };
        };
      };
      default = {};
      description = "TemplateParser";
    };    
  };
  config = mkIf cfg.enable {
    programs.plasma.files."templateparserrc" = cfg.templateparser;
  };
}
