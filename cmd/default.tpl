{ lib, ... }:

{
  imports = [
    ./files.nix
    ./hotkeys.nix
    ./shortcuts.nix{{ range . }}
    ./{{.}}.nix{{end}}
  ];

  options.programs.plasma.enable = lib.mkEnableOption ''
    Enable configuration management for KDE Plasma.
  '';
}
