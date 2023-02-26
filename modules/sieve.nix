{ config, lib, pkgs, ... }:
with lib;
let
  cfg = config.programs.plasma;
  moduleCfg = config.programs.plasma.sieve;
in {
  options.programs.plasma.sieve = {
    enable = mkEnableOption ''
      Enable sieve
    '';
    package = mkOption {
      default = if (pkgs ? sieve) then
                        pkgs.sieve
                      else
                        (if pkgs.libsForQt5 ? sieve then pkgs.libsForQt5.sieve else false);
      defaultText = literalExpression "pkgs.sieve";
      type = with types; either bool package;
      description = mdDoc "Package to use.";
    };
    "Editor" = with types; mkOption {
      type = submodule {
        options = { 
          WrapText = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
        };
      };
      default = {};
      description = "Editor";
    };    
    "OutOfOffice" = with types; mkOption {
      type = submodule {
        options = { 
          AllowOutOfOfficeSettings = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Allow out-of-office settings to be changeable by the user.

              Type: Bool
            '';
          };
          AllowOutOfOfficeUploadButNoSettings = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Allow users to upload out-of-office sieve scripts, but prevent them from changing any settings, such as the domain to react to or the spam reaction switch.

              Type: Bool
            '';
          };
          CheckOutOfOfficeOnStartup = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Check if there is still an active out-of-office reply configured on startup.

              Type: Bool
            '';
          };
          OutOfOfficeDomain = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              Send out-of-office replies to mails coming from this domain only.

              Type: String
            '';
          };
          OutOfOfficeReactToSpam = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Allow out-of-office replies to be sent to messages marked as SPAM.

              Type: Bool
            '';
          };
        };
      };
      default = {};
      description = "OutOfOffice";
    };    
  };
  config = mkIf (cfg.enable && moduleCfg.enable) {
    home.packages = mkIf (moduleCfg.package != false) [ moduleCfg.package ];
    programs.plasma.files."vacationsettingsrc" = removeAttrs moduleCfg [ "enable" "package" ];
  };
}
