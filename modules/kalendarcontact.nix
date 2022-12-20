{ config, lib, ... }:
with lib;
let cfg = config.programs.plasma;
in {
  options.programs.plasma.kalendarcontact = {
    "Editor" = with types;
      mkOption {
        type = submodule {
          options = {
            "lastUsedAddressBookCollection" = mkOption {
              type = nullOr (either str int);
              default = -1;
              description = ''
                The last used event collection used when creating a contact.

                Type: Int
              '';
            };
          };
        };
        default = { };
        description = "Editor";
      };
  };
  config = mkIf cfg.enable {
    programs.plasma.files."kalendarcontactrc" = cfg.kalendarcontact;
  };
}
