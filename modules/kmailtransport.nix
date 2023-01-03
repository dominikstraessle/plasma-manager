{ config, lib, ... }:
with lib;
let cfg = config.programs.plasma;
in {
  options.programs.plasma.kmailtransport = { 
    "Transport $(transportId)" = with types; mkOption {
      type = submodule {
        options = { 
          auth = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Server requires authentication

              Type: Bool
            '';
          };
          authtype = mkOption {
            type = nullOr (either str (enum [ 
              "LOGIN"
              "PLAIN"
              "CRAM_MD5"
              "DIGEST_MD5"
              "GSSAPI"
              "NTLM"
              "APOP"
              "CLEAR"
              "ANONYMOUS"
              "XOAUTH2"
            ]));
            default = "PLAIN";
            description = ''
              Authentication method

              Type: Enum
              Choices: 
                - LOGIN
                - PLAIN
                - CRAM_MD5
                - DIGEST_MD5
                - GSSAPI
                - NTLM
                - APOP
                - CLEAR
                - ANONYMOUS
                - XOAUTH2
            '';
          };
          encryption = mkOption {
            type = nullOr (either str (enum [ 
              "None"
              "SSL"
              "TLS"
            ]));
            default = "";
            description = ''
              Encryption method used for communication

              Type: Enum
              Choices: 
                - None: No encryption
                - SSL: SSL encryption
                - TLS: TLS encryption
            '';
          };
          host = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              Host name of the server

              Type: String
            '';
          };
          id = mkOption {
            type = nullOr (either str int);
            default = 0;
            description = ''
              Unique identifier

              Type: Int
            '';
          };
          identifier = mkOption {
            type = nullOr str;
            default = "SMTP";
            description = ''
              

              Type: String
            '';
          };
          localHostname = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              

              Type: String
            '';
          };
          name = mkOption {
            type = nullOr str;
            default = ''i18n("Unnamed")'';
            defaultText = "Code: true";
            description = ''
              User-visible transport name

              Type: String
            '';
          };
          options = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              Options added to mailtransport method

              Type: String
            '';
          };
          port = mkOption {
            type = nullOr (either str int);
            default = 25;
            description = ''
              Port number of the server

              Type: UInt
            '';
          };
          precommand = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              Command to execute before sending a mail

              Type: String
            '';
          };
          senderOverwriteAddress = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              

              Type: String
            '';
          };
          specifyHostname = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          specifySenderOverwriteAddress = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          storepass = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Store password

              Type: Bool
            '';
          };
          useProxy = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Connect using the system proxy settings

              Type: Bool
            '';
          };
          user = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              User name needed for login

              Type: String
            '';
          };
        };
      };
      default = {};
      description = "Transport $(transportId)";
    };    
  };
  config = mkIf cfg.enable {
    programs.plasma.files."mailtransports" = cfg.kmailtransport;
  };
}
