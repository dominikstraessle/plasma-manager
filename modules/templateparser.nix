{ config, lib, pkgs, ... }:
with lib;
let
  cfg = config.programs.plasma;
  moduleCfg = config.programs.plasma.templateparser;
in {
  options.programs.plasma.templateparser = {
    enable = mkEnableOption ''
      Enable templateparser
    '';
    package = mkOption {
      default = if (pkgs ? templateparser) then
                        pkgs.templateparser
                      else
                        (if pkgs.libsForQt5 ? templateparser then pkgs.libsForQt5.templateparser else false);
      defaultText = literalExpression "pkgs.templateparser";
      type = with types; either bool package;
      description = mdDoc "Package to use.";
    };
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
            default = null;
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
            default = null;
            defaultText = "Code: true";
            description = ''
              Message template for forward

              Type: String
            '';
          };
          TemplateNewMessage = mkOption {
            type = nullOr str;
            default = null;
            defaultText = "Code: true";
            description = ''
              Message template for new message

              Type: String
            '';
          };
          TemplateReply = mkOption {
            type = nullOr str;
            default = null;
            defaultText = "Code: true";
            description = ''
              Message template for reply

              Type: String
            '';
          };
          TemplateReplyAll = mkOption {
            type = nullOr str;
            default = null;
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
  config = mkIf (cfg.enable && moduleCfg.enable) {
    home.packages = mkIf (moduleCfg.package != false) [ moduleCfg.package ];
    programs.plasma.files."templateparserrc" = removeAttrs moduleCfg [ "enable" "package" ];
  };
}
