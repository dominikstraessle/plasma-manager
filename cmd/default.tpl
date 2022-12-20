{ lib, ... }:

{
  imports = [
    ./files.nix
    ./hotkeys.nix
    ./shortcuts.nix{{ range . }}
    ./{{.}}{{end}}
  ];

  options.programs.plasma.enable = lib.mkEnableOption ''
    Enable configuration management for KDE Plasma.
  '';
}
