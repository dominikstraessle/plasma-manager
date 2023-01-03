{ config, lib, ... }:
with lib;
let cfg = config.programs.plasma;
in {
  options.programs.plasma.akonadi-contacts = { 
    "Phone Dial Settings" = with types; mkOption {
      type = submodule {
        options = { 
          DialPhoneNumberAction = mkOption {
            type = nullOr (either str (enum [ 
              "UseSkype"
              "UseExternalPhoneApplication"
              "UseSflPhone"
              "UseEkiga"
              "UseSystemDefault"
            ]));
            default = "UseSystemDefault";
            description = ''
              

              Type: Enum
              Choices: 
                - UseSkype
                - UseExternalPhoneApplication
                - UseSflPhone
                - UseEkiga
                - UseSystemDefault
            '';
          };
          PhoneCommand = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              Phone Command

              Type: String
            '';
          };
        };
      };
      default = {};
      description = "Phone Dial Settings";
    };    
    "Send SMS Settings" = with types; mkOption {
      type = submodule {
        options = { 
          SendSmsAction = mkOption {
            type = nullOr (either str (enum [ 
              "UseSkypeSms"
              "UseExternalSmsApplication"
              "UseSflPhoneSms"
              "UseSystemDefaultSms"
            ]));
            default = "UseSystemDefaultSms";
            description = ''
              

              Type: Enum
              Choices: 
                - UseSkypeSms
                - UseExternalSmsApplication
                - UseSflPhoneSms
                - UseSystemDefaultSms
            '';
          };
          SmsCommand = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              SMS Command

              Type: String
            '';
          };
        };
      };
      default = {};
      description = "Send SMS Settings";
    };    
  };
  config = mkIf cfg.enable {
    programs.plasma.files."akonadi_contactrc" = cfg.akonadi-contacts;
  };
}
