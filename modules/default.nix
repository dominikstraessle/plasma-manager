{ lib, ... }:

{
  imports = [
    ./files.nix
    ./hotkeys.nix
    ./shortcuts.nix
    ./AutomounterSettingsBase.nix
    ./GitKlientSettings.nix
    ./TellySkoutSettings.nix
    ./akregator.nix
    ./ark.nix
    ./breezesettingsdata.nix
    ./bytetableviewsettings.nix
    ./calligrasheets.nix
    ./camerasettings.nix
    ./config.nix
    ./contactconfig.nix
    ./fieldingconfig.nix
    ./generalsettings.nix
    ./infoviewsettings.nix
    ./kalendarconfig.nix
    ./kalzium.nix
    ./klipper.nix
    ./konsole.nix
    ./kontact.nix
    ./konversation.nix
    ./krunnersettingsbase.nix
    ./kstars.nix
    ./kwin.nix
#    ./kwincompositing_setting.nix
    ./kwindecorationsettings.nix
    ./kwinoptions_kdeglobals_settings.nix
#    ./kwinoptions_settings.nix
    ./kwinpluginssettings.nix
    ./kwinscreenedgeeffectsettings.nix
    ./kwinscreenedgescriptsettings.nix
#    ./kwinscreenedgesettings.nix
    ./kwinswitcheffectsettings.nix
    ./kwintabboxsettings.nix
#    ./kwintouchscreenedgeeffectsettings.nix
#    ./kwintouchscreenscriptsettings.nix
#    ./kwintouchscreensettings.nix
#    ./kwinxwaylandsettings.nix
    ./languageconfig.nix
    ./neochatconfig.nix
    ./nightcolorsettings.nix
    ./okular.nix
    ./org.kde.initialsystemsetup.license.nix
    ./pimcommonautocorrection.nix
    ./skanpage_config.nix
#    ./skanpage_state.nix
    ./smserversettings.nix
    ./spectacle.nix
    ./subtitlessettings.nix
    ./terminalsettings.nix
#    ./virtualdesktopssettings.nix
#    ./virtualkeyboardsettings.nix
#    ./workspaceoptions_kwinsettings.nix
  ];

  options.programs.plasma.enable = lib.mkEnableOption ''
    Enable configuration management for KDE Plasma.
  '';
}
