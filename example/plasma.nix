{ ... }: {
    home.stateVersion = "22.11";

  programs.plasma = {
    enable = true;

    baloo = {
      "General" = {
        "dbVersion" = "2";
        "exclude filters" =
          "*~,*.part,*.o,*.la,*.lo,*.loT,*.moc,moc_*.cpp,qrc_*.cpp,ui_*.h,cmake_install.cmake,CMakeCache.txt,CTestTestfile.cmake,libtool,config.status,confdefs.h,autom4te,conftest,confstat,Makefile.am,*.gcode,.ninja_deps,.ninja_log,build.ninja,*.csproj,*.m4,*.rej,*.gmo,*.pc,*.omf,*.aux,*.tmp,*.po,*.vm*,*.nvram,*.rcore,*.swp,*.swap,lzo,litmain.sh,*.orig,.histfile.*,.xsession-errors*,*.map,*.so,*.a,*.db,*.qrc,*.ini,*.init,*.img,*.vdi,*.vbox*,vbox.log,*.qcow2,*.vmdk,*.vhd,*.vhdx,*.sql,*.sql.gz,*.ytdl,*.class,*.pyc,*.pyo,*.elc,*.qmlc,*.jsc,*.fastq,*.fq,*.gb,*.fasta,*.fna,*.gbff,*.faa,po,CVS,.svn,.git,_darcs,.bzr,.hg,CMakeFiles,CMakeTmp,CMakeTmpQmake,.moc,.obj,.pch,.uic,.npm,.yarn,.yarn-cache,__pycache__,node_modules,node_packages,nbproject,core-dumps,lost+found";
        "exclude filters version" = "8";
      };
    };
    dolphin = { IconsMode = { PreviewSize = 256; }; };
    elisa = { "PlayerSettings" = { "UseFavoriteStyleRatings" = "true"; }; };
    gwenview = {
      "General" = {
        "LastUsedVersion" = "210800";
        "SideBarPage" = "operations";
      };
      "SideBar" = {
        "IsVisible ViewMode" = "true";
        "SideBarSplitterSizes" = "213,1706";
      };
    };
    khotkeys = {
      "Data" = { "DataCount" = "1"; };
      "Data_1" = {
        "Comment" = "KMenuEdit Global Shortcuts";
        "DataCount" = "1";
        "Enabled" = "true";
        "Name" = "KMenuEdit";
        "SystemGroup" = "1";
        "Type" = "ACTION_DATA_GROUP";
      };
      "Data_1Conditions" = {
        "Comment" = "";
        "ConditionsCount" = "0";
      };
      "Data_1_1" = {
        "Comment" = "Comment";
        "Enabled" = "true";
        "Name" = "Search";
        "Type" = "SIMPLE_ACTION_DATA";
      };
      "Data_1_1Actions" = { "ActionsCount" = "1"; };
      "Data_1_1Actions0" = {
        "CommandURL" = "http://google.com";
        "Type" = "COMMAND_URL";
      };
      "Data_1_1Conditions" = {
        "Comment" = "";
        "ConditionsCount" = "0";
      };
      "Data_1_1Triggers" = {
        "Comment" = "Simple_action";
        "TriggersCount" = "1";
      };
      "Data_1_1Triggers0" = {
        "Key" = "";
        "Type" = "SHORTCUT";
        "Uuid" = "{d03619b6-9b3c-48cc-9d9c-a2aadb485550}";
      };
      "Gestures" = {
        "Disabled" = "true";
        "MouseButton" = "2";
        "Timeout" = "300";
      };
      "GesturesExclude" = {
        "Comment" = "";
        "WindowsCount" = "0";
      };
      "Main" = {
        "AlreadyImported" = "defaults,kde32b1,konqueror_gestures_kde321";
        "Disabled" = "false";
      };
      "Voice" = { "Shortcut" = ""; };
    };
    krunner = { "General" = { "FreeFloating" = "true"; }; };
    kwin = { "Effect-windowview" = { "BorderActivateAll" = "9"; }; };
    kxkb = {
      "Layout" = {
        "Options" = "terminate:ctrl_alt_bksp,compose:rwin";
        "ResetOldOptions" = "true";
      };
    };
    shortcuts = {
      "ActivityManager" = {
        "_k_friendly_name" = "Activity Manager";
        "switch-to-activity-e7cc1e9a-40ff-4a44-aa85-c8e00b358d51" =
          ''none,none,Switch to activity "Default"'';
      };
      "KDE Keyboard Layout Switcher" = {
        "Switch to Next Keyboard Layout" =
          "Meta+Alt+K,Meta+Alt+K,Switch to Next Keyboard Layout";
        "_k_friendly_name" = "Keyboard Layout Switcher";
      };
      "kaccess" = {
        "Toggle Screen Reader On and Off" =
          "Meta+Alt+S,Meta+Alt+S,Toggle Screen Reader On and Off";
        "_k_friendly_name" = "Accessibility";
      };
      "kcm_touchpad" = {
        "Disable Touchpad" = "Touchpad Off,Touchpad Off,Disable Touchpad";
        "Enable Touchpad" = "Touchpad On,Touchpad On,Enable Touchpad";
        "Toggle Touchpad" =
          "Touchpad Toggle,Touchpad Toggle	Meta+Ctrl+Zenkaku Hankaku,Toggle Touchpad";
        "_k_friendly_name" = "Touchpad";
      };
      "kded5" = {
        "Show System Activity" = "Ctrl+Esc,Ctrl+Esc,Show System Activity";
        "_k_friendly_name" = "KDE Daemon";
        "display" = "Display	Meta+P,Display	Meta+P,Switch Display";
      };
      "khotkeys" = {
        "_k_friendly_name" = "Custom Shortcuts Service";
        "{d03619b6-9b3c-48cc-9d9c-a2aadb485550}" = "none,none,Search";
      };
      "kmix" = {
        "_k_friendly_name" = "Audio Volume";
        "decrease_microphone_volume" =
          "Microphone Volume Down,Microphone Volume Down,Decrease Microphone Volume";
        "decrease_volume" = "Volume Down,Volume Down,Decrease Volume";
        "increase_microphone_volume" =
          "Microphone Volume Up,Microphone Volume Up,Increase Microphone Volume";
        "increase_volume" = "Volume Up,Volume Up,Increase Volume";
        "mic_mute" =
          "Microphone Mute	Meta+Volume Mute,Microphone Mute	Meta+Volume Mute,Mute Microphone";
        "mute" = "Volume Mute,Volume Mute,Mute";
      };
      "ksmserver" = {
        "Halt Without Confirmation" = "none,,Halt Without Confirmation";
        "Lock Session" = "Meta+L	Screensaver,Meta+L	Screensaver,Lock Session";
        "Log Out" = "Ctrl+Alt+Del,Ctrl+Alt+Del,Log Out";
        "Log Out Without Confirmation" = "none,,Log Out Without Confirmation";
        "Reboot Without Confirmation" = "none,,Reboot Without Confirmation";
        "_k_friendly_name" = "Session Management";
      };
      "kwin" = {
        "Activate Window Demanding Attention" =
          "Meta+Ctrl+A,Meta+Ctrl+A,Activate Window Demanding Attention";
        "Decrease Opacity" = "none,,Decrease Opacity of Active Window by 5 %";
        "Expose" = "Ctrl+F9,Ctrl+F9,Toggle Present Windows (Current desktop)";
        "ExposeAll" =
          "Ctrl+F10	Launch (C),Ctrl+F10	Launch (C),Toggle Present Windows (All desktops)";
        "ExposeClass" = "Ctrl+F7,Ctrl+F7,Toggle Present Windows (Window class)";
        "ExposeClassCurrentDesktop" =
          "none,none,Toggle Present Windows (Window class on current desktop)";
        "Increase Opacity" = "none,,Increase Opacity of Active Window by 5 %";
        "Invert Screen Colors" = "none,,Invert Screen Colors";
        "Kill Window" = "Meta+Ctrl+Esc,Meta+Ctrl+Esc,Kill Window";
        "MoveMouseToCenter" = "Meta+F6,Meta+F6,Move Mouse to Center";
        "MoveMouseToFocus" = "Meta+F5,Meta+F5,Move Mouse to Focus";
        "MoveZoomDown" = "none,none,Move Zoomed Area Downwards";
        "MoveZoomLeft" = "none,none,Move Zoomed Area to Left";
        "MoveZoomRight" = "none,none,Move Zoomed Area to Right";
        "MoveZoomUp" = "none,none,Move Zoomed Area Upwards";
        "Overview" = "Meta+W,Meta+W,Toggle Overview";
        "Setup Window Shortcut" = "none,,Setup Window Shortcut";
        "Show Desktop" = "Meta+D,Meta+D,Peek at Desktop";
        "ShowDesktopGrid" = "Meta+F8,Meta+F8,Show Desktop Grid";
        "Suspend Compositing" =
          "Alt+Shift+F12,Alt+Shift+F12,Suspend Compositing";
        "Switch One Desktop Down" =
          "none,Meta+Ctrl+Down,Switch One Desktop Down";
        "Switch One Desktop Up" = "none,Meta+Ctrl+Up,Switch One Desktop Up";
        "Switch One Desktop to the Left" =
          "none,Meta+Ctrl+Left,Switch One Desktop to the Left";
        "Switch One Desktop to the Right" =
          "none,Meta+Ctrl+Right,Switch One Desktop to the Right";
        "Switch Window Down" =
          "Meta+Alt+Down,Meta+Alt+Down,Switch to Window Below";
        "Switch Window Left" =
          "Meta+Alt+Left,Meta+Alt+Left,Switch to Window to the Left";
        "Switch Window Right" =
          "Meta+Alt+Right,Meta+Alt+Right,Switch to Window to the Right";
        "Switch Window Up" = "Meta+Alt+Up,Meta+Alt+Up,Switch to Window Above";
        "Switch to Desktop 1" = "Ctrl+F1,Ctrl+F1,Switch to Desktop 1";
        "Switch to Desktop 10" = "none,,Switch to Desktop 10";
        "Switch to Desktop 11" = "none,,Switch to Desktop 11";
        "Switch to Desktop 12" = "none,,Switch to Desktop 12";
        "Switch to Desktop 13" = "none,,Switch to Desktop 13";
        "Switch to Desktop 14" = "none,,Switch to Desktop 14";
        "Switch to Desktop 15" = "none,,Switch to Desktop 15";
        "Switch to Desktop 16" = "none,,Switch to Desktop 16";
        "Switch to Desktop 17" = "none,,Switch to Desktop 17";
        "Switch to Desktop 18" = "none,,Switch to Desktop 18";
        "Switch to Desktop 19" = "none,,Switch to Desktop 19";
        "Switch to Desktop 2" = "Ctrl+F2,Ctrl+F2,Switch to Desktop 2";
        "Switch to Desktop 20" = "none,,Switch to Desktop 20";
        "Switch to Desktop 3" = "Ctrl+F3,Ctrl+F3,Switch to Desktop 3";
        "Switch to Desktop 4" = "Ctrl+F4,Ctrl+F4,Switch to Desktop 4";
        "Switch to Desktop 5" = "none,,Switch to Desktop 5";
        "Switch to Desktop 6" = "none,,Switch to Desktop 6";
        "Switch to Desktop 7" = "none,,Switch to Desktop 7";
        "Switch to Desktop 8" = "none,,Switch to Desktop 8";
        "Switch to Desktop 9" = "none,,Switch to Desktop 9";
        "Switch to Next Desktop" = "none,,Switch to Next Desktop";
        "Switch to Next Screen" = "none,,Switch to Next Screen";
        "Switch to Previous Desktop" = "none,,Switch to Previous Desktop";
        "Switch to Previous Screen" = "none,,Switch to Previous Screen";
        "Switch to Screen 0" = "none,,Switch to Screen 0";
        "Switch to Screen 1" = "none,,Switch to Screen 1";
        "Switch to Screen 2" = "none,,Switch to Screen 2";
        "Switch to Screen 3" = "none,,Switch to Screen 3";
        "Switch to Screen 4" = "none,,Switch to Screen 4";
        "Switch to Screen 5" = "none,,Switch to Screen 5";
        "Switch to Screen 6" = "none,,Switch to Screen 6";
        "Switch to Screen 7" = "none,,Switch to Screen 7";
        "Toggle Night Color" = "none,none,Toggle Night Color";
        "Toggle Window Raise/Lower" = "none,,Toggle Window Raise/Lower";
        "Walk Through Desktop List" = "none,,Walk Through Desktop List";
        "Walk Through Desktop List (Reverse)" =
          "none,,Walk Through Desktop List (Reverse)";
        "Walk Through Desktops" = "none,,Walk Through Desktops";
        "Walk Through Desktops (Reverse)" =
          "none,,Walk Through Desktops (Reverse)";
        "Walk Through Windows" = "Alt+Tab,Alt+Tab,Walk Through Windows";
        "Walk Through Windows (Reverse)" =
          "Alt+Shift+Backtab,Alt+Shift+Backtab,Walk Through Windows (Reverse)";
        "Walk Through Windows Alternative" =
          "none,,Walk Through Windows Alternative";
        "Walk Through Windows Alternative (Reverse)" =
          "none,,Walk Through Windows Alternative (Reverse)";
        "Walk Through Windows of Current Application" =
          "Alt+`,Alt+`,Walk Through Windows of Current Application";
        "Walk Through Windows of Current Application (Reverse)" =
          "Alt+~,Alt+~,Walk Through Windows of Current Application (Reverse)";
        "Walk Through Windows of Current Application Alternative" =
          "none,,Walk Through Windows of Current Application Alternative";
        "Walk Through Windows of Current Application Alternative (Reverse)" =
          "none,,Walk Through Windows of Current Application Alternative (Reverse)";
        "Window Above Other Windows" = "none,,Keep Window Above Others";
        "Window Below Other Windows" = "none,,Keep Window Below Others";
        "Window Close" = "Alt+F4,Alt+F4,Close Window";
        "Window Fullscreen" = "none,,Make Window Fullscreen";
        "Window Grow Horizontal" = "none,,Expand Window Horizontally";
        "Window Grow Vertical" = "none,,Expand Window Vertically";
        "Window Lower" = "none,,Lower Window";
        "Window Maximize" = "Meta+PgUp	Meta+Home,Meta+PgUp,Maximize Window";
        "Window Maximize Horizontal" = "none,,Maximize Window Horizontally";
        "Window Maximize Vertical" = "none,,Maximize Window Vertically";
        "Window Minimize" = "Meta+End	Meta+PgDown,Meta+PgDown,Minimize Window";
        "Window Move" = "none,,Move Window";
        "Window Move Center" = "none,,Move Window to the Center";
        "Window No Border" = "none,,Hide Window Border";
        "Window On All Desktops" = "none,,Keep Window on All Desktops";
        "Window One Desktop Down" =
          "Meta+Ctrl+Shift+Down,Meta+Ctrl+Shift+Down,Window One Desktop Down";
        "Window One Desktop Up" =
          "Meta+Ctrl+Shift+Up,Meta+Ctrl+Shift+Up,Window One Desktop Up";
        "Window One Desktop to the Left" =
          "Meta+Ctrl+Shift+Left,Meta+Ctrl+Shift+Left,Window One Desktop to the Left";
        "Window One Desktop to the Right" =
          "Meta+Ctrl+Shift+Right,Meta+Ctrl+Shift+Right,Window One Desktop to the Right";
        "Window Operations Menu" = "Alt+F3,Alt+F3,Window Operations Menu";
        "Window Pack Down" = "none,,Move Window Down";
        "Window Pack Left" = "none,,Move Window Left";
        "Window Pack Right" = "none,,Move Window Right";
        "Window Pack Up" = "none,,Move Window Up";
        "Window Quick Tile Bottom" =
          "Meta+Down,Meta+Down,Quick Tile Window to the Bottom";
        "Window Quick Tile Bottom Left" =
          "none,,Quick Tile Window to the Bottom Left";
        "Window Quick Tile Bottom Right" =
          "none,,Quick Tile Window to the Bottom Right";
        "Window Quick Tile Left" =
          "Meta+Left,Meta+Left,Quick Tile Window to the Left";
        "Window Quick Tile Right" =
          "Meta+Right,Meta+Right,Quick Tile Window to the Right";
        "Window Quick Tile Top" =
          "Meta+Up,Meta+Up,Quick Tile Window to the Top";
        "Window Quick Tile Top Left" =
          "none,,Quick Tile Window to the Top Left";
        "Window Quick Tile Top Right" =
          "none,,Quick Tile Window to the Top Right";
        "Window Raise" = "none,,Raise Window";
        "Window Resize" = "none,,Resize Window";
        "Window Shade" = "none,,Shade Window";
        "Window Shrink Horizontal" = "none,,Shrink Window Horizontally";
        "Window Shrink Vertical" = "none,,Shrink Window Vertically";
        "Window to Desktop 1" = "none,,Window to Desktop 1";
        "Window to Desktop 10" = "none,,Window to Desktop 10";
        "Window to Desktop 11" = "none,,Window to Desktop 11";
        "Window to Desktop 12" = "none,,Window to Desktop 12";
        "Window to Desktop 13" = "none,,Window to Desktop 13";
        "Window to Desktop 14" = "none,,Window to Desktop 14";
        "Window to Desktop 15" = "none,,Window to Desktop 15";
        "Window to Desktop 16" = "none,,Window to Desktop 16";
        "Window to Desktop 17" = "none,,Window to Desktop 17";
        "Window to Desktop 18" = "none,,Window to Desktop 18";
        "Window to Desktop 19" = "none,,Window to Desktop 19";
        "Window to Desktop 2" = "none,,Window to Desktop 2";
        "Window to Desktop 20" = "none,,Window to Desktop 20";
        "Window to Desktop 3" = "none,,Window to Desktop 3";
        "Window to Desktop 4" = "none,,Window to Desktop 4";
        "Window to Desktop 5" = "none,,Window to Desktop 5";
        "Window to Desktop 6" = "none,,Window to Desktop 6";
        "Window to Desktop 7" = "none,,Window to Desktop 7";
        "Window to Desktop 8" = "none,,Window to Desktop 8";
        "Window to Desktop 9" = "none,,Window to Desktop 9";
        "Window to Next Desktop" = "none,,Window to Next Desktop";
        "Window to Next Screen" =
          "Meta+Shift+Right,Meta+Shift+Right,Window to Next Screen";
        "Window to Previous Desktop" = "none,,Window to Previous Desktop";
        "Window to Previous Screen" =
          "Meta+Shift+Left,Meta+Shift+Left,Window to Previous Screen";
        "Window to Screen 0" = "none,,Window to Screen 0";
        "Window to Screen 1" = "none,,Window to Screen 1";
        "Window to Screen 2" = "none,,Window to Screen 2";
        "Window to Screen 3" = "none,,Window to Screen 3";
        "Window to Screen 4" = "none,,Window to Screen 4";
        "Window to Screen 5" = "none,,Window to Screen 5";
        "Window to Screen 6" = "none,,Window to Screen 6";
        "Window to Screen 7" = "none,,Window to Screen 7";
        "_k_friendly_name" = "KWin";
        "view_actual_size" = "none,Meta+0,Zoom to Actual Size";
        "view_zoom_in" = "Meta+=,Meta++,Zoom In";
        "view_zoom_out" = "Meta+-,Meta+-,Zoom Out";
      };
      "mediacontrol" = {
        "_k_friendly_name" = "Media Controller";
        "mediavolumedown" = "none,,Media volume down";
        "mediavolumeup" = "none,,Media volume up";
        "nextmedia" = "Media Next,Media Next,Media playback next";
        "pausemedia" = "Media Pause,Media Pause,Pause media playback";
        "playmedia" = "none,,Play media playback";
        "playpausemedia" = "Media Play,Media Play,Play/Pause media playback";
        "previousmedia" =
          "Media Previous,Media Previous,Media playback previous";
        "stopmedia" = "Media Stop,Media Stop,Stop media playback";
      };
      "org.kde.dolphin.desktop" = {
        "_k_friendly_name" = "Dolphin";
        "_launch" = "Meta+E,Meta+E,Dolphin";
      };
      "org.kde.krunner.desktop" = {
        "RunClipboard" =
          "Alt+Shift+F2,Alt+Shift+F2,Run command on clipboard contents";
        "_k_friendly_name" = "KRunner";
        "_launch" = "Alt+Space	Alt+F2	Search,Alt+Space	Alt+F2	Search,KRunner";
      };
      "org.kde.plasma.emojier.desktop" = {
        "_k_friendly_name" = "Emoji Selector";
        "_launch" = "Meta+.,Meta+.,Emoji Selector";
      };
      "org.kde.spectacle.desktop" = {
        "ActiveWindowScreenShot" =
          "Meta+Print,Meta+Print,Capture Active Window";
        "CurrentMonitorScreenShot" = "none,none,Capture Current Monitor";
        "FullScreenScreenShot" =
          "Shift+Print,Shift+Print,Capture Entire Desktop";
        "OpenWithoutScreenshot" =
          "none,none,Launch Spectacle without capturing";
        "RectangularRegionScreenShot" =
          "Meta+Shift+Print,Meta+Shift+Print,Capture Rectangular Region";
        "WindowUnderCursorScreenShot" =
          "Meta+Ctrl+Print,Meta+Ctrl+Print,Capture Window Under Cursor";
        "_k_friendly_name" = "Spectacle";
        "_launch" = "Print,Print,Launch Spectacle";
      };
      "org_kde_powerdevil" = {
        "Decrease Keyboard Brightness" =
          "Keyboard Brightness Down,Keyboard Brightness Down,Decrease Keyboard Brightness";
        "Decrease Screen Brightness" =
          "Monitor Brightness Down,Monitor Brightness Down,Decrease Screen Brightness";
        "Hibernate" = "Hibernate,Hibernate,Hibernate";
        "Increase Keyboard Brightness" =
          "Keyboard Brightness Up,Keyboard Brightness Up,Increase Keyboard Brightness";
        "Increase Screen Brightness" =
          "Monitor Brightness Up,Monitor Brightness Up,Increase Screen Brightness";
        "PowerDown" = "Power Down,Power Down,Power Down";
        "PowerOff" = "Power Off,Power Off,Power Off";
        "Sleep" = "Sleep,Sleep,Suspend";
        "Toggle Keyboard Backlight" =
          "Keyboard Light On/Off,Keyboard Light On/Off,Toggle Keyboard Backlight";
        "Turn Off Screen" = "none,none,Turn Off Screen";
        "_k_friendly_name" = "Power Management";
      };
      "plasmashell" = {
        "_k_friendly_name" = "Plasma";
        "activate task manager entry 1" =
          "Meta+1,Meta+1,Activate Task Manager Entry 1";
        "activate task manager entry 10" =
          "Meta+0,Meta+0,Activate Task Manager Entry 10";
        "activate task manager entry 2" =
          "Meta+2,Meta+2,Activate Task Manager Entry 2";
        "activate task manager entry 3" =
          "Meta+3,Meta+3,Activate Task Manager Entry 3";
        "activate task manager entry 4" =
          "Meta+4,Meta+4,Activate Task Manager Entry 4";
        "activate task manager entry 5" =
          "Meta+5,Meta+5,Activate Task Manager Entry 5";
        "activate task manager entry 6" =
          "Meta+6,Meta+6,Activate Task Manager Entry 6";
        "activate task manager entry 7" =
          "Meta+7,Meta+7,Activate Task Manager Entry 7";
        "activate task manager entry 8" =
          "Meta+8,Meta+8,Activate Task Manager Entry 8";
        "activate task manager entry 9" =
          "Meta+9,Meta+9,Activate Task Manager Entry 9";
        "clear-history" = "none,,Clear Clipboard History";
        "clipboard_action" =
          "Meta+Ctrl+X,Meta+Ctrl+X,Automatic Action Popup Menu";
        "cycle-panels" =
          "Meta+Alt+P,Meta+Alt+P,Move keyboard focus between panels";
        "cycleNextAction" = "none,,Next History Item";
        "cyclePrevAction" = "none,,Previous History Item";
        "edit_clipboard" = "none,,Edit Contents…";
        "manage activities" = "Meta+Q,Meta+Q,Show Activity Switcher";
        "next activity" = "Meta+Tab,Meta+Tab,Walk through activities";
        "previous activity" =
          "Meta+Shift+Tab,Meta+Shift+Tab,Walk through activities (Reverse)";
        "repeat_action" =
          "Meta+Ctrl+R,Meta+Ctrl+R,Manually Invoke Action on Current Clipboard";
        "show dashboard" = "Ctrl+F12,Ctrl+F12,Show Desktop";
        "show-barcode" = "none,,Show Barcode…";
        "show-on-mouse-pos" = "Meta+V,Meta+V,Open Klipper at Mouse Position";
        "stop current activity" = "Meta+S,Meta+S,Stop Current Activity";
        "switch to next activity" = "none,,Switch to Next Activity";
        "switch to previous activity" = "none,,Switch to Previous Activity";
        "toggle do not disturb" = "none,,Toggle do not disturb";
      };
      "plasmawindowed" = {
        "_k_friendly_name" = "plasmawindowed";
        "clear-history" = "none,none,Clear Clipboard History";
        "clipboard_action" = "none,Meta+Ctrl+X,Automatic Action Popup Menu";
        "cycleNextAction" = "none,none,Next History Item";
        "cyclePrevAction" = "none,none,Previous History Item";
        "edit_clipboard" = "none,none,Edit Contents…";
        "repeat_action" =
          "none,Meta+Ctrl+R,Manually Invoke Action on Current Clipboard";
        "show-barcode" = "none,none,Show Barcode…";
        "show-on-mouse-pos" = "none,Meta+V,Open Klipper at Mouse Position";
      };
      "systemsettings.desktop" = {
        "_k_friendly_name" = "System Settings";
        "_launch" = "Tools,Tools,System Settings";
        "kcm-kscreen" = "none,none,Display Configuration";
        "kcm-lookandfeel" = "none,none,Global Theme";
        "kcm-users" = "none,none,Users";
        "powerdevilprofilesconfig" = "none,none,Energy Saving";
        "screenlocker" = "none,none,Screen Locking";
      };
    };
    spectacle = {
      "General" = { "onLaunchAction" = "DoNotTakeScreenshot"; };
      "GuiConfig" = { "captureMode" = "5"; };
      "Save" = {
        "lastSaveAsLocation" =
          "file:///home/fake/Downloads/Screenshot_20221213_170323.png";
        "lastSaveLocation" =
          "file:///home/fake/Downloads/Screenshot_20221213_170323.png";
      };
    };
  };
}
