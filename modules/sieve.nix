{ config, lib, ... }:
with lib;
let cfg = config.programs.plasma;
in {
  options.programs.plasma.sieve = {
    "Editor" = with types;
      mkOption {
        type = submodule {
          options = {
            "WrapText" = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''


                Type: Bool
              '';
            };
          };
        };
        default = { };
        description = "Editor";
      };
    "OutOfOffice" = with types;
      mkOption {
        type = submodule {
          options = {
            "AllowOutOfOfficeSettings" = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''
                Allow out-of-office settings to be changeable by the user.

                Type: Bool
              '';
            };
            "AllowOutOfOfficeUploadButNoSettings" = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''
                Allow users to upload out-of-office sieve scripts, but prevent them from changing any settings, such as the domain to react to or the spam reaction switch.

                Type: Bool
              '';
            };
            "CheckOutOfOfficeOnStartup" = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''
                Check if there is still an active out-of-office reply configured on startup.

                Type: Bool
              '';
            };
            "OutOfOfficeDomain" = mkOption {
              type = nullOr str;
              default = "";
              description = ''
                Send out-of-office replies to mails coming from this domain only.

                Type: String
              '';
            };
            "OutOfOfficeReactToSpam" = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''
                Allow out-of-office replies to be sent to messages marked as SPAM.

                Type: Bool
              '';
            };
          };
        };
        default = { };
        description = "OutOfOffice";
      };
  };
  config =
    mkIf cfg.enable { programs.plasma.files."vacationsettingsrc" = cfg.sieve; };
}
