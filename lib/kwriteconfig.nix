{ pkgs, lib }:

let

  ##############################################################################
  # Convert a Nix value into a command line argument to kwriteconfig.
  toKdeValue = with builtins;
    v:
    if v == null then
      "--delete"
    else if isString v then
      lib.escapeShellArg v
    else if isBool v then
      "--type bool " + lib.boolToString v
    else if isInt v then
      toString v
    else if isFloat v then
      toString v
    else if isList v then
      concatStringsSep "," (toString v)
    else if isEnum v then
      toString v
    else
      abort ("Unknown value type: " ++ xtoString v);

  ##############################################################################
  # Generate a series of shell commands that will update a
  # configuration value.
  #
  # The given file name should be relative to XDG_CONFIG_HOME.
  #
  # The group names are used to generate a nested path to the group
  # containing the settings in the attribute set.
  #
  # The attribute set is the settings and values to set.
  #
  # Type: string -> [string] -> AttrSet -> string
  kWriteConfig = file: group: attrs:
    lib.concatStringsSep "\n" (lib.mapAttrsToList (key: value: ''
      ${pkgs.libsForQt5.kconfig}/bin/kwriteconfig5 \
        --file ''${XDG_CONFIG_HOME:-$HOME/.config}/${lib.escapeShellArg file} \
        --group ${lib.escapeShellArg group} \
        --key ${lib.escapeShellArg key} \
        ${toKdeValue value}
    '') attrs);
in { inherit kWriteConfig; }
