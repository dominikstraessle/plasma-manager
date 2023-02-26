{ config, lib, ... }:
with lib;
let
  cfg = config.programs.plasma;
  moduleCfg = config.programs.plasma.akonadi-contacts;
in {
  options.programs.plasma.akonadi-contacts = {
    enable = mkEnableOption ''
      Enable akonadi-contacts
    '';
    package = mkOption {
      default = if (pkgs ? akonadi-contacts) then
                        pkgs.akonadi-contacts
                      else
                        (if pkgs.libsForQt5 ? akonadi-contacts then pkgs.libsForQt5.akonadi-contacts else false);
      defaultText = literalExpression "pkgs.akonadi-contacts";
      type = either bool types.package;
      description = mdDoc "Package to use.";
    };
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
  config = mkIf (cfg.enable && moduleCfg.enable) {
    home.packages = mkIf moduleCfg.package [ moduleCfg.package ];
    programs.plasma.files."akonadi_contactrc" = removeAttrs moduleCfg [ "enable" "package" ];
  };
}
