{ lib, ... }:

{
  imports = [
    ./files.nix
    ./hotkeys.nix
    ./shortcuts.nix
    ./GitKlientSettings.nix
    ./akregator.nix
    ./ark.nix
    ./baloo.nix
    ./breeze.nix
    ./bytetableviewsettings.nix
    ./dolphin.nix
    ./elisa.nix
    ./ffmpegthumbs.nix
    ./fieldingconfig.nix
    ./haruna.nix
    ./infoviewsettings.nix
    ./kalendar.nix
    ./kalendarcontact.nix
    ./kalzium.nix
    ./kded_device_automounter.nix
    ./kdeglobals.nix
    ./kdevelop.nix
    ./klipper.nix
    ./konsole.nix
    ./kontact.nix
    ./konversation.nix
    ./krunner.nix
    ./kscreenlocker.nix
    ./ksmserver.nix
    ./kspread.nix
    ./kstars.nix
    ./kwin.nix
    ./neochat.nix
    ./okular.nix
    ./org_kde_initialsystemsetup_license.nix
    ./pimcommon.nix
    ./plasmacamera.nix
    ./qmlkonsole.nix
    ./skanpage.nix
    ./spectacle.nix
    ./tellyskout.nix
  ];

  options.programs.plasma.enable = lib.mkEnableOption ''
    Enable configuration management for KDE Plasma.
  '';
}
