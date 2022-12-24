# Global keyboard khotkeys:
{ config, lib, ... }:

let
  cfg = config.programs.plasma;

  # Convert one hotkey into a settings attribute set.
  hotkeyToNameValuePair = _action: skey:
    let
      # Keys are expected to be a list:
      keys = if builtins.isList skey then
        (if builtins.length skey == 0 then [ "none" ] else skey)
      else
        [ skey ];

      # Don't allow un-escaped commas:
      escape = lib.escape [ "," ];
    in lib.concatStringsSep "," [
      (lib.concatStringsSep "	" (map escape keys))
      "" # List of default keys, not needed.
      "" # Display string, not needed.
    ];

  khotkeysToSettings = groups:
    lib.mapAttrs (group: attrs:
      (lib.mapAttrs hotkeyToNameValuePair attrs) // {
        # Some hotkey groups have a dot in their name so we
        # explicitly set the group nesting to only one level deep:
        configGroupNesting = [ group ];
      }) groups;
in {
  options.programs.plasma.khotkeys = lib.mkOption {
    type = with lib.types; attrsOf (attrsOf (oneOf [ (listOf str) str int bool ]));
    default = { };
    description = ''
      An attribute set where the keys are application groups and the
      values are khotkeys.
    '';
  };

  config = lib.mkIf (cfg.enable && builtins.attrNames cfg.khotkeys != 0) {
    programs.plasma.files."khotkeysrc" =
      khotkeysToSettings cfg.khotkeys;
  };
}
