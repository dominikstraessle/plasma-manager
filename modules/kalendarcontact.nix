{ config, lib, ... }:
with lib;
let
  cfg = config.programs.plasma;
  moduleCfg = config.programs.plasma.kalendarcontact;
in {
  options.programs.plasma.kalendarcontact = {
    enable = mkEnableOption ''
      Enable kalendarcontact
    '';
    package = mkOption {
      default = if (pkgs ? kalendarcontact) then
                        pkgs.kalendarcontact
                      else
                        (if pkgs.libsForQt5 ? kalendarcontact then pkgs.libsForQt5.kalendarcontact else false);
      defaultText = literalExpression "pkgs.kalendarcontact";
      type = either bool types.package;
      description = mdDoc "Package to use.";
    };
    "Editor" = with types; mkOption {
      type = submodule {
        options = { 
          lastUsedAddressBookCollection = mkOption {
            type = nullOr (either str int);
            default = -1;
            description = ''
              The last used event collection used when creating a contact.

              Type: Int
            '';
          };
        };
      };
      default = {};
      description = "Editor";
    };    
  };
  config = mkIf (cfg.enable && moduleCfg.enable) {
    home.packages = mkIf moduleCfg.package [ moduleCfg.package ];
    programs.plasma.files."kalendarcontactrc" = removeAttrs moduleCfg [ "enable" "package" ];
  };
}
