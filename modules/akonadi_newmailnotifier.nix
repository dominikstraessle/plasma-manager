{ config, lib, pkgs, ... }:
with lib;
let
  cfg = config.programs.plasma;
  moduleCfg = config.programs.plasma.akonadi_newmailnotifier;
in {
  options.programs.plasma.akonadi_newmailnotifier = {
    enable = mkEnableOption ''
      Enable akonadi_newmailnotifier
    '';
    package = mkOption {
      default = if (pkgs ? akonadi_newmailnotifier) then
                        pkgs.akonadi_newmailnotifier
                      else
                        (if pkgs.libsForQt5 ? akonadi_newmailnotifier then pkgs.libsForQt5.akonadi_newmailnotifier else false);
      defaultText = literalExpression "pkgs.akonadi_newmailnotifier";
      type = with types; either bool package;
      description = mdDoc "Package to use.";
    };
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
            default = null;
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
  config = mkIf (cfg.enable && moduleCfg.enable) {
    home.packages = mkIf (moduleCfg.package != false) [ moduleCfg.package ];
    programs.plasma.files."akonadi_newmailnotifier_agentrc" = removeAttrs moduleCfg [ "enable" "package" ];
  };
}
