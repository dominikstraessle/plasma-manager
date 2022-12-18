{ lib, ... }:

{
  imports = [
    ./files.nix
    ./hotkeys.nix
    ./shortcuts.nix
    ./kalendarcontact.nix
    ./klipper.nix
    ./okular.nix
    ./org_kde_initialsystemsetup_license.nix
    ./qmlkonsole.nix
    ./ark.nix
    ./plasmacamera.nix
    ./config.nix
    ./breeze.nix
    ./haruna.nix
    ./kalzium.nix
    ./krunner.nix
    ./neochat.nix
    ./ksmserver.nix
    ./kded_device_automounter.nix
    ./tellyskout.nix
    ./fieldingconfig.nix
    ./kdevelop.nix
    ./kalendar.nix
    ./kontact.nix
    ./kwin.nix
    ./skanpage.nix
    ./bytetableviewsettings.nix
    ./konsole.nix
    ./kdeglobals.nix
    ./pimcommon.nix
    ./spectacle.nix
    ./infoviewsettings.nix
    ./konversation.nix
    ./kstars.nix
    ./GitKlientSettings.nix
    ./akregator.nix
    ./kspread.nix
  ];

  options.programs.plasma.enable = lib.mkEnableOption ''
    Enable configuration management for KDE Plasma.
  '';
}
