{ config, lib, ... }:
with lib;
let cfg = config.programs.plasma;
in {
  options.programs.plasma.kalarm = { 
    "Defaults" = with types; mkOption {
      type = submodule {
        options = { 
          AutoClose = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Auto-close window after late-cancellation time

              Type: Bool
            '';
          };
          CmdLogType = mkOption {
            type = nullOr (either str (enum [ 
              "Discard"
              "File"
              "Terminal"
            ]));
            default = "Discard";
            description = ''
              Command output

              Type: Enum
              Choices: 
                - Discard: Discard Output
                - File: Log To File
                - Terminal: Execute in terminal window
            '';
          };
          CmdScript = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Enter script

              Type: Bool
            '';
          };
          ConfirmAck = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Confirm acknowledgement

              Type: Bool
            '';
          };
          CopyKOrg = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Show in KOrganizer

              Type: Bool
            '';
          };
          DisplayMethod = mkOption {
            type = nullOr (either str (enum [ 
              "Window"
              "Notification"
            ]));
            default = "Window";
            description = ''
              Alarm message display method

              Type: Enum
              Choices: 
                - Window
                - Notification
            '';
          };
          EmailBcc = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Copy email to self

              Type: Bool
            '';
          };
          "Feb29Recur" = mkOption {
            type = nullOr (either str (enum [ 
              "Feb28"
              "Mar1"
              "None"
            ]));
            default = "Mar1";
            description = ''
              In non-leap years, repeat yearly February 29th alarms on:

              Type: Enum
              Choices: 
                - Feb28: February 28th
                - Mar1: March 1st
                - None: Do not repeat
            '';
          };
          LateCancel = mkOption {
            type = nullOr (either str int);
            default = 0;
            description = ''
              Cancel if late (minutes)

              Type: Int
              Min: 0
            '';
          };
          LogFile = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              Log file

              Type: Path
            '';
          };
          PostAction = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              Post-alarm action

              Type: String
            '';
          };
          PreAction = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              Pre-alarm action

              Type: String
            '';
          };
          PreActionErrCancel = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Cancel alarm on pre-alarm action error

              Type: Bool
            '';
          };
          PreActionErrDontShow = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Do not notify pre-alarm action errors

              Type: Bool
            '';
          };
          PreActionExecDefer = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Execute pre-alarm action for deferred alarms

              Type: Bool
            '';
          };
          RecurPeriod = mkOption {
            type = nullOr (either str (enum [ 
              "None"
              "Login"
              "SubDaily"
              "Daily"
              "Weekly"
              "Monthly"
              "Yearly"
            ]));
            default = "None";
            description = ''
              Recurrence period

              Type: Enum
              Choices: 
                - None: No recurrence
                - Login: At login
                - SubDaily: Hourly/minutely
                - Daily
                - Weekly
                - Monthly
                - Yearly
            '';
          };
          RemindUnits = mkOption {
            type = nullOr (either str (enum [ 
              "Minutes"
              "HoursMinutes"
            ]));
            default = "HoursMinutes";
            description = ''
              Reminder units

              Type: Enum
              Choices: 
                - Minutes
                - HoursMinutes: Hours/Minutes
            '';
          };
          SoundFile = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              Sound file

              Type: Path
            '';
          };
          SoundRepeat = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Repeat sound file

              Type: Bool
            '';
          };
          SoundType = mkOption {
            type = nullOr (either str (enum [ 
              "None"
              "Beep"
              "File"
              "Speak"
            ]));
            default = "None";
            description = ''
              Sound

              Type: Enum
              Choices: 
                - None
                - Beep
                - File: Play File
                - Speak
            '';
          };
          SoundVolume = mkOption {
            type = nullOr (either str int);
            default = -1;
            description = ''
              Sound volume

              Type: Int
              Min: -1
              Max: 100
            '';
          };
        };
      };
      default = {};
      description = "Defaults";
    };    
    "General" = with types; mkOption {
      type = submodule {
        options = { 
          AskResource = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Prompt for which calendar to store in

              Type: Bool
            '';
          };
          AutoHideSystemTray = mkOption {
            type = nullOr (either str int);
            default = 1440;
            description = ''
              Auto-hide in system tray if no alarms due within period

              Type: Int
            '';
          };
          AutoStart = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Start at login

              Type: Bool
            '';
          };
          Backend = mkOption {
            type = nullOr (either str (enum [ 
              "Kresources"
              "Akonadi"
              "FileResources"
            ]));
            default = "";
            description = ''
              Data storage backend

              Type: Enum
              Choices: 
                - Kresources: KResources
                - Akonadi: Akonadi
                - FileResources: File Resources
            '';
          };
          CmdXTerm = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              Terminal for command alarms

              Type: String
            '';
          };
          DeferTime = mkOption {
            type = nullOr (either str int);
            default = 5;
            description = ''
              Default defer time interval

              Type: Int
            '';
          };
          DisabledColour = mkOption {
            type = nullOr str;
            default = "KColorScheme(QPalette::Disabled).foreground(KColorScheme::InactiveText).color()";
            defaultText = "Code: true";
            description = ''
              Disabled alarm color

              Type: Color
            '';
          };
          EmailBccAddress = mkOption {
            type = nullOr str;
            default = ''QLatin1String("@SystemSettings")'';
            defaultText = "Code: true";
            description = ''
              'Bcc' email address

              Type: String
            '';
          };
          EmailClient = mkOption {
            type = nullOr (either str (enum [ 
              "sendmail"
              "kmail"
            ]));
            default = "kmail";
            description = ''
              Email client

              Type: Enum
              Choices: 
                - sendmail: Sendmail
                - kmail: KMail
            '';
          };
          EmailCopyToKMail = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Whether to copy sent emails into KMail's Sent folder.

              Type: Bool
            '';
          };
          EmailFrom = mkOption {
            type = nullOr str;
            default = ''KAlarmCal::Identities::identitiesExist() ? QLatin1String("@KMail") : QLatin1String("@SystemSettings")'';
            defaultText = "Code: true";
            description = ''
              'From' email address

              Type: String
            '';
          };
          ExpiredColour = mkOption {
            type = nullOr str;
            default = "KColorScheme(QPalette::Active).foreground(KColorScheme::VisitedText).color()";
            defaultText = "Code: true";
            description = ''
              Archived alarm color

              Type: Color
            '';
          };
          ExpiredKeepDays = mkOption {
            type = nullOr (either str int);
            default = 7;
            description = ''
              Days to keep expired alarms

              Type: Int
            '';
          };
          HolidayRegion = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              Holiday region

              Type: String
            '';
          };
          KOrgEventDuration = mkOption {
            type = nullOr (either str int);
            default = 0;
            description = ''
              KOrganizer event duration

              Type: Int
            '';
          };
          MessageBackgroundColour = mkOption {
            type = nullOr str;
            default = "KColorScheme(QPalette::Active).background(KColorScheme::NegativeBackground).color()";
            defaultText = "Code: true";
            description = ''
              Background color

              Type: Color
            '';
          };
          MessageButtonDelay = mkOption {
            type = nullOr (either str int);
            default = 0;
            description = ''
              Delay before message window buttons are enabled

              Type: Int
              Min: -1
              Max: 10
            '';
          };
          MessageFont = mkOption {
            type = nullOr str;
            default = "QFont(QFontDatabase::systemFont(QFontDatabase::GeneralFont).family(), 16, QFont::Bold)";
            defaultText = "Code: true";
            description = ''
              Message font

              Type: Font
            '';
          };
          MessageForegroundColour = mkOption {
            type = nullOr str;
            default = "KColorScheme(QPalette::Active).foreground().color()";
            defaultText = "Code: true";
            description = ''
              Foreground color

              Type: Color
            '';
          };
          ModalMessages = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Message windows have a title bar and take keyboard focus

              Type: Bool
            '';
          };
          NoAutoHideSystemTrayDesktops = mkOption {
            type = nullOr (either str (listOf str));
            default = "Unity";
            description = ''
              Desktops without auto-hide in system tray

              Type: StringList
            '';
          };
          NoAutoStart = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Suppress autostart at login

              Type: Bool
            '';
          };
          ShowInSystemTray = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Show in system tray

              Type: Bool
            '';
          };
          ShowMenuBar = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          ShowTooltipAlarmTime = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Show alarm times in system tray tooltip

              Type: Bool
            '';
          };
          ShowTooltipTimeToAlarm = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Show time to alarms in system tray tooltip

              Type: Bool
            '';
          };
          StartOfDay = mkOption {
            type = nullOr str;
            default = "QDateTime(QDate(1900,1,1),QTime(0,0))";
            description = ''
              Start of day for date-only alarms

              Type: DateTime
            '';
          };
          TimeZone = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              Time zone

              Type: String
            '';
          };
          TooltipAlarmCount = mkOption {
            type = nullOr (either str int);
            default = 5;
            description = ''
              Number of alarms to show in system tray tooltip

              Type: Int
            '';
          };
          TooltipTimeToPrefix = mkOption {
            type = nullOr str;
            default = ''QLatin1String("+")'';
            defaultText = "Code: true";
            description = ''
              Time-to-alarm prefix in system tray tooltip

              Type: String
            '';
          };
          UseAkonadiIfAvailable = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Enable Akonadi plugin

              Type: Bool
            '';
          };
          UseAlarmName = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Enable alarm names

              Type: Bool
            '';
          };
          Version = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              KAlarm version

              Type: String
            '';
          };
          WakeFromSuspendAdvance = mkOption {
            type = nullOr (either str int);
            default = 2;
            description = ''
              Number of minutes before alarm to wake from suspend

              Type: Int
            '';
          };
          WorkDayEnd = mkOption {
            type = nullOr str;
            default = "QDateTime(QDate(1900,1,1),QTime(17,0))";
            description = ''
              End time of working day

              Type: DateTime
            '';
          };
          WorkDayStart = mkOption {
            type = nullOr str;
            default = "QDateTime(QDate(1900,1,1),QTime(8,0))";
            description = ''
              Start time of working day

              Type: DateTime
            '';
          };
          WorkDays = mkOption {
            type = nullOr (either str int);
            default = "Locale::defaultWorkDays()";
            defaultText = "Code: true";
            description = ''
              Working days

              Type: UInt
            '';
          };
        };
      };
      default = {};
      description = "General";
    };    
    "Notification Messages" = with types; mkOption {
      type = submodule {
        options = { 
          ConfirmAlarmDeletion = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Confirm alarm deletions

              Type: Bool
            '';
          };
          EmailQueuedNotify = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Notify when remote emails are queued

              Type: Bool
            '';
          };
          QuitWarn = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Warn before quitting

              Type: Bool
            '';
          };
        };
      };
      default = {};
      description = "Notification Messages";
    };    
  };
  config = mkIf cfg.enable {
    programs.plasma.files."kalarmrc" = cfg.kalarm;
  };
}
