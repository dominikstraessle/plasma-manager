{ config, lib, pkgs, ... }:
with lib;
let
  cfg = config.programs.plasma;
  moduleCfg = config.programs.plasma.korganizer;
in {
  options.programs.plasma.korganizer = {
    enable = mkEnableOption ''
      Enable korganizer
    '';
    package = mkOption {
      default = if (pkgs ? korganizer) then
                        pkgs.korganizer
                      else
                        (if pkgs.libsForQt5 ? korganizer then pkgs.libsForQt5.korganizer else false);
      defaultText = literalExpression "pkgs.korganizer";
      type = with types; either bool package;
      description = mdDoc "Package to use.";
    };
    "Agenda View" = with types; mkOption {
      type = submodule {
        options = { 
          AgendaViewCalendarDisplay = mkOption {
            type = nullOr (either str (enum [ 
              "CalendarsMerged"
              "CalendarsSideBySide"
              "AllCalendarViews"
            ]));
            default = "CalendarsMerged";
            description = ''
              Multiple Calendar Display

              Type: Enum
              Choices: 
                - CalendarsMerged: Merge all calendars into one view
                - CalendarsSideBySide: Show calendars side by side
                - AllCalendarViews: Switch between views with tabs
            '';
          };
          AgendaViewColors = mkOption {
            type = nullOr (either str (enum [ 
              "CategoryInsideResourceOutside"
              "ResourceInsideCategoryOutside"
              "CategoryOnly"
              "ResourceOnly"
            ]));
            default = "CategoryInsideResourceOutside";
            description = ''
              Color Usage

              Type: Enum
              Choices: 
                - CategoryInsideResourceOutside: Tag inside, calendar outside
                - ResourceInsideCategoryOutside: Calendar inside, tag outside
                - CategoryOnly: Only tag
                - ResourceOnly: Only calendar
            '';
          };
          ColorBusyDaysEnabled = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Color busy days with a different background color

              Type: Bool
            '';
          };
          "Current-time line shows seconds" = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Show seconds on the current-time (Marcus Bains) line

              Type: Bool
            '';
          };
          "Hour Size" = mkOption {
            type = nullOr (either str int);
            default = 10;
            description = ''
              Hour size

              Type: Int
              Min: 4
              Max: 30
            '';
          };
          SelectionStartsEditor = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Time range selection in agenda view starts event editor

              Type: Bool
            '';
          };
          "Show Icons in Agenda View" = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Show icons in agenda view items

              Type: Bool
            '';
          };
          "Show current-time line" = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Show current-time (Marcus Bains) line

              Type: Bool
            '';
          };
          ShowTodosAgendaView = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Show to-dos

              Type: Bool
            '';
          };
        };
      };
      default = {};
      description = "Agenda View";
    };    
    "Archive Dialog" = with types; mkOption {
      type = submodule {
        options = { 
          "Archive Action" = mkOption {
            type = nullOr (either str (enum [ 
              "actionDelete"
              "actionArchive"
            ]));
            default = "actionArchive";
            description = ''
              What to do when archiving

              Type: Enum
              Choices: 
                - actionDelete: Delete old events
                - actionArchive: Archive old events to a separate file
            '';
          };
          "Archive Events" = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Archive events

              Type: Bool
            '';
          };
          "Archive File" = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              URL of the file where old events should be archived

              Type: String
            '';
          };
          "Archive Todos" = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Archive to-dos

              Type: Bool
            '';
          };
          "Auto Archive" = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Regularly archive events

              Type: Bool
            '';
          };
          "Expiry Time" = mkOption {
            type = nullOr (either str int);
            default = 1;
            description = ''
              If auto-archiving is enabled, events older than this amount will be archived. The unit of this value is specified in another field.

              Type: Int
            '';
          };
          "Expiry Unit" = mkOption {
            type = nullOr (either str (enum [ 
              "UnitDays"
              "UnitWeeks"
              "UnitMonths"
            ]));
            default = "UnitMonths";
            description = ''
              The unit in which the expiry time is expressed.

              Type: Enum
              Choices: 
                - UnitDays: In days
                - UnitWeeks: In weeks
                - UnitMonths: In months
            '';
          };
        };
      };
      default = {};
      description = "Archive Dialog";
    };    
    "Colors" = with types; mkOption {
      type = submodule {
        options = { 
          "Agenda Background Color" = mkOption {
            type = nullOr str;
            default = "255, 255, 255";
            description = ''
              Agenda view background color

              Type: Color
            '';
          };
          "Agenda MarcusBainsLine Line Color" = mkOption {
            type = nullOr str;
            default = "255,0,0";
            description = ''
              Agenda view current-time line color

              Type: Color
            '';
          };
          AgendaBackgroundColor = mkOption {
            type = nullOr str;
            default = "255, 255, 255";
            description = ''
              Agenda view background color

              Type: Color
            '';
          };
          "Highlight Color" = mkOption {
            type = nullOr str;
            default = "100, 100, 255";
            description = ''
              Highlight color

              Type: Color
            '';
          };
          "Holiday Color" = mkOption {
            type = nullOr str;
            default = "255, 100, 100";
            description = ''
              Holiday color

              Type: Color
            '';
          };
          "Todo due today Color" = mkOption {
            type = nullOr str;
            default = "255, 200, 50";
            description = ''
              To-do due today color

              Type: Color
            '';
          };
          "Todo overdue Color" = mkOption {
            type = nullOr str;
            default = "255, 100, 100";
            description = ''
              To-do overdue color

              Type: Color
            '';
          };
          "Unset Category Color" = mkOption {
            type = nullOr str;
            default = "151, 235, 121";
            description = ''
              "No tag" color (for "Only tag" drawing schemes)

              Type: Color
            '';
          };
          ViewBackgroundBusyColor = mkOption {
            type = nullOr str;
            default = "136, 255, 219";
            description = ''
              Busy days background color

              Type: Color
            '';
          };
          WorkingHoursColor = mkOption {
            type = nullOr str;
            default = "255, 235, 154";
            description = ''
              Working hours color

              Type: Color
            '';
          };
        };
      };
      default = {};
      description = "Colors";
    };    
    "Default Datetimes" = with types; mkOption {
      type = submodule {
        options = { 
          "Default Reminder Time" = mkOption {
            type = nullOr (either str int);
            default = 15;
            description = ''
              Default reminder time

              Type: Int
            '';
          };
          "Default Reminder Time Units" = mkOption {
            type = nullOr (either str int);
            default = 0;
            description = ''
              

              Type: Int
            '';
          };
          DefaultDuration = mkOption {
            type = nullOr str;
            default = "QDateTime(QDate(1752,1,1), QTime(1,0))";
            description = ''
              Default duration of new appointment (HH:MM)

              Type: DateTime
            '';
          };
          "Enable Default Audio File" = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Enable a default sound file for audio reminders

              Type: Bool
            '';
          };
          "Enable Event Reminders" = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Enable reminders for new Events

              Type: Bool
            '';
          };
          "Enable To-do Reminders" = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Enable reminders for new To-dos

              Type: Bool
            '';
          };
          "Reminder Audio File" = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              Default audio file

              Type: Path
            '';
          };
          StartTime = mkOption {
            type = nullOr str;
            default = "QDateTime(QDate(1752,1,1), QTime(10,0))";
            description = ''
              Default appointment time

              Type: DateTime
            '';
          };
        };
      };
      default = {};
      description = "Default Datetimes";
    };    
    "Email" = with types; mkOption {
      type = submodule {
        options = { 
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
        };
      };
      default = {};
      description = "Email";
    };    
    "Fonts" = with types; mkOption {
      type = submodule {
        options = { 
          "Agenda MarcusBainsLine Font" = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              Current-time line

              Type: Font
            '';
          };
          "Agenda TimeLabels Font" = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              Time bar

              Type: Font
            '';
          };
          "AgendaView Font" = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              Agenda view

              Type: Font
            '';
          };
          "MonthView Font" = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              Month view

              Type: Font
            '';
          };
          "TimeBar Font" = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              Time bar

              Type: Font
            '';
          };
        };
      };
      default = {};
      description = "Fonts";
    };    
    "General" = with types; mkOption {
      type = submodule {
        options = { 
          "Archive File" = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              

              Type: String
            '';
          };
          "Auto Save" = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Enable automatic saving of calendar

              Type: Bool
            '';
          };
          "Auto Save Interval" = mkOption {
            type = nullOr (either str int);
            default = 10;
            description = ''
              

              Type: Int
              Min: 0
              Max: 123
            '';
          };
          "Confirm Deletes" = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Confirm deletes

              Type: Bool
            '';
          };
          Destination = mkOption {
            type = nullOr (either str (enum [ 
              "standardDestination"
              "askDestination"
              "argl1"
              "argl2"
              "argl3"
            ]));
            default = "standardDestination";
            description = ''
              New Events/Todos Should

              Type: Enum
              Choices: 
                - standardDestination
                - askDestination
                - argl1: Argl1 Label
                - argl2
                - argl3: Argl3 Label
            '';
          };
        };
      };
      default = {};
      description = "General";
    };    
    "General View" = with types; mkOption {
      type = submodule {
        options = { 
          "Enable ToolTips" = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Enable tooltips for displaying summaries

              Type: Bool
            '';
          };
          "Highlight Journals" = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Show journals instead of events when in Journal View

              Type: Bool
            '';
          };
          "Highlight To-dos" = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Show to-dos instead of events when in Todo View

              Type: Bool
            '';
          };
          "Next X Days" = mkOption {
            type = nullOr (either str int);
            default = 3;
            description = ''
              Next x days

              Type: Int
            '';
          };
          "Show Daily Recurrences" = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Show items that recur daily

              Type: Bool
            '';
          };
          "Show Weekly Recurrences" = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Show items that recur weekly

              Type: Bool
            '';
          };
          TodosUseCategoryColors = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              To-dos use tag colors

              Type: Bool
            '';
          };
          "Week Numbers Show Work Week" = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Week numbers select a work week when in work week mode

              Type: Bool
            '';
          };
        };
      };
      default = {};
      description = "General View";
    };    
    "Group Scheduling" = with types; mkOption {
      type = submodule {
        options = { 
          AdditionalMails = mkOption {
            type = nullOr (either str (listOf str));
            default = "";
            description = ''
              

              Type: StringList
            '';
          };
          "Send Policy" = mkOption {
            type = nullOr (either str (enum [ 
              "InvitationPolicySend"
              "InvitationPolicyAsk"
              "InvitationPolicyDontSend"
            ]));
            default = "InvitationPolicySend";
            description = ''
              Default policy for invitations to other users:

              Type: Enum
              Choices: 
                - InvitationPolicySend: Send mails without asking.
                - InvitationPolicyAsk: Ask for every individual attendee what to do.
                - InvitationPolicyDontSend: Do not send invitation emails at all (this can break group scheduling for iTip compliant clients).
            '';
          };
          "Use Groupware Communication" = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Use Groupware communication

              Type: Bool
            '';
          };
        };
      };
      default = {};
      description = "Group Scheduling";
    };    
    "Hidden Options" = with types; mkOption {
      type = submodule {
        options = { 
          CompactDialogs = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          DefaultTodoAttachMethod = mkOption {
            type = nullOr (either str (enum [ 
              "TodoAttachAsk"
              "TodoAttachLink"
              "TodoAttachInlineFull"
            ]));
            default = "TodoAttachInlineFull";
            description = ''
              Default todo attachment method

              Type: Enum
              Choices: 
                - TodoAttachAsk: Always ask
                - TodoAttachLink: Only attach link to message
                - TodoAttachInlineFull: Attach complete message
            '';
          };
          "Quick Todo" = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

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
          ShowTimeZoneSelectorInIncidenceEditor = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Show timezone selectors in the event and todo editor dialog.

              Type: Bool
            '';
          };
          "Todo Quick Search" = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
        };
      };
      default = {};
      description = "Hidden Options";
    };    
    "Internal Settings" = with types; mkOption {
      type = submodule {
        options = { 
          ActiveDesignerFields = mkOption {
            type = nullOr (either str (listOf str));
            default = "";
            description = ''
              

              Type: StringList
            '';
          };
          AssignDefaultResourceColors = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          "Decorations At Agenda View Bottom" = mkOption {
            type = nullOr (either str (listOf str));
            default = "";
            description = ''
              

              Type: StringList
            '';
          };
          "Decorations At Agenda View Top" = mkOption {
            type = nullOr (either str (listOf str));
            default = "";
            description = ''
              

              Type: StringList
            '';
          };
          "Decorations At Month View Top" = mkOption {
            type = nullOr (either str (listOf str));
            default = "";
            description = ''
              

              Type: StringList
            '';
          };
          DefaultResourceColorSeed = mkOption {
            type = nullOr (either str int);
            default = 0;
            description = ''
              

              Type: Int
            '';
          };
          DefaultResourceColors = mkOption {
            type = nullOr (either str (listOf str));
            default = "#c1d4e7,#d0e7c1,#e3e7c1,#e7c1e6,#a1b1c1";
            description = ''
              

              Type: StringList
            '';
          };
          EventTemplates = mkOption {
            type = nullOr (either str (listOf str));
            default = "";
            description = ''
              

              Type: StringList
            '';
          };
          JournalTemplates = mkOption {
            type = nullOr (either str (listOf str));
            default = "";
            description = ''
              

              Type: StringList
            '';
          };
          TodoTemplates = mkOption {
            type = nullOr (either str (listOf str));
            default = "";
            description = ''
              

              Type: StringList
            '';
          };
          "Work Week Mask" = mkOption {
            type = nullOr (either str int);
            default = 31;
            description = ''
              

              Type: Int
            '';
          };
          "user_email" = mkOption {
            type = nullOr str;
            default = null;
            defaultText = ''i18n("nobody@nowhere")'';
            description = ''
              E&mail address

              Type: String
            '';
          };
          "user_name" = mkOption {
            type = nullOr str;
            default = null;
            defaultText = ''i18n("Anonymous")'';
            description = ''
              Full &name

              Type: String
            '';
          };
        };
      };
      default = {};
      description = "Internal Settings";
    };    
    "KOrganizer Plugins" = with types; mkOption {
      type = submodule {
        options = { 
          SelectedPlugins = mkOption {
            type = nullOr (either str (listOf str));
            default = "";
            description = ''
              

              Type: StringList
            '';
          };
        };
      };
      default = {};
      description = "KOrganizer Plugins";
    };    
    "Month View" = with types; mkOption {
      type = submodule {
        options = { 
          "Full View Month" = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Month view uses full window

              Type: Bool
            '';
          };
          MonthViewColors = mkOption {
            type = nullOr (either str (enum [ 
              "MonthItemCategoryInsideResourceOutside"
              "MonthItemResourceInsideCategoryOutside"
              "MonthItemCategoryOnly"
              "MonthItemResourceOnly"
            ]));
            default = "MonthItemCategoryInsideResourceOutside";
            description = ''
              Color Usage

              Type: Enum
              Choices: 
                - MonthItemCategoryInsideResourceOutside: Tag inside, calendar outside
                - MonthItemResourceInsideCategoryOutside: Calendar inside, tag outside
                - MonthItemCategoryOnly: Only tag
                - MonthItemResourceOnly: Only calendar
            '';
          };
          "Show Icons in Month View" = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Show icons in month view items

              Type: Bool
            '';
          };
          "Show time in Month View" = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Show time in month view items

              Type: Bool
            '';
          };
          ShowJournalsMonthView = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Show journals

              Type: Bool
            '';
          };
          ShowTodosMonthView = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Show to-dos

              Type: Bool
            '';
          };
        };
      };
      default = {};
      description = "Month View";
    };    
    "Personal Settings" = with types; mkOption {
      type = submodule {
        options = { 
          "Use Control Center Email" = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Use email settings from System Settings

              Type: Bool
            '';
          };
        };
      };
      default = {};
      description = "Personal Settings";
    };    
    "QueueRates" = with types; mkOption {
      type = submodule {
        options = { 
          "EmptyingRate $(QueueIndex)" = mkOption {
            type = nullOr (either str (listOf int));
            default = null;
            defaultText = "defaultRate[2]";
            description = ''
              

              Type: IntList
            '';
          };
          ShowQueueTuner = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
        };
      };
      default = {};
      description = "QueueRates";
    };    
    "Save Settings" = with types; mkOption {
      type = submodule {
        options = { 
          "Confirm Deletes" = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Confirm deletes

              Type: Bool
            '';
          };
          Destination = mkOption {
            type = nullOr (either str (enum [ 
              "standardDestination"
              "askDestination"
            ]));
            default = "askDestination";
            description = ''
              New Events, To-dos and Journal Entries Should

              Type: Enum
              Choices: 
                - standardDestination: Be added to the default calendar
                - askDestination: Be asked which calendar to use
            '';
          };
        };
      };
      default = {};
      description = "Save Settings";
    };    
    "Theme/Month view" = with types; mkOption {
      type = submodule {
        options = { 
          "Month CalendarItems Background Color" = mkOption {
            type = nullOr str;
            default = "255, 100, 100";
            description = ''
              

              Type: Color
            '';
          };
          "Month CalendarItems Background Image" = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              

              Type: String
            '';
          };
          "Month CalendarItems Events Background Color" = mkOption {
            type = nullOr str;
            default = "151, 235, 121";
            description = ''
              Default event color

              Type: Color
            '';
          };
          "Month CalendarItems Events Background Image" = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              

              Type: String
            '';
          };
          "Month CalendarItems Events Font" = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              

              Type: Font
            '';
          };
          "Month CalendarItems Events Frame Color" = mkOption {
            type = nullOr str;
            default = "255, 100, 100";
            description = ''
              

              Type: Color
            '';
          };
          "Month CalendarItems Events Icon" = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              

              Type: String
            '';
          };
          "Month CalendarItems Font" = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              

              Type: Font
            '';
          };
          "Month CalendarItems Frame Color" = mkOption {
            type = nullOr str;
            default = "255, 100, 100";
            description = ''
              

              Type: Color
            '';
          };
          "Month CalendarItems Icon" = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              

              Type: String
            '';
          };
          "Month CalendarItems ToDos Background Color" = mkOption {
            type = nullOr str;
            default = "255, 100, 100";
            description = ''
              

              Type: Color
            '';
          };
          "Month CalendarItems ToDos Background Image" = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              

              Type: String
            '';
          };
          "Month CalendarItems ToDos DueToday Background Image" = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              

              Type: String
            '';
          };
          "Month CalendarItems ToDos DueToday Font" = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              

              Type: Font
            '';
          };
          "Month CalendarItems ToDos DueToday Frame Color" = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              

              Type: Color
            '';
          };
          "Month CalendarItems ToDos DueToday Icon" = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              

              Type: String
            '';
          };
          "Month CalendarItems ToDos DueTodayBackground Color" = mkOption {
            type = nullOr str;
            default = "255, 200, 50";
            description = ''
              To-do due today color

              Type: Color
            '';
          };
          "Month CalendarItems ToDos Font" = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              

              Type: Font
            '';
          };
          "Month CalendarItems ToDos Frame Color" = mkOption {
            type = nullOr str;
            default = "255, 100, 100";
            description = ''
              

              Type: Color
            '';
          };
          "Month CalendarItems ToDos Icon" = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              

              Type: String
            '';
          };
          "Month CalendarItems ToDos Overdue Background Color" = mkOption {
            type = nullOr str;
            default = "255, 100, 100";
            description = ''
              To-do overdue color

              Type: Color
            '';
          };
          "Month CalendarItems ToDos Overdue Background Image" = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              

              Type: String
            '';
          };
          "Month CalendarItems ToDos Overdue Font" = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              

              Type: Font
            '';
          };
          "Month CalendarItems ToDos Overdue Frame Color" = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              

              Type: Color
            '';
          };
          "Month CalendarItems ToDos Overdue Icon" = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              

              Type: String
            '';
          };
          "Month Grid Background Color" = mkOption {
            type = nullOr str;
            default = "255, 255, 255";
            description = ''
              Month view background color

              Type: Color
            '';
          };
          "Month Grid Background Image" = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              

              Type: String
            '';
          };
          "Month Grid Highlight Color" = mkOption {
            type = nullOr str;
            default = "100, 100, 255";
            description = ''
              Highlight color

              Type: Color
            '';
          };
          "Month Grid WorkHours Background Color" = mkOption {
            type = nullOr str;
            default = "225, 225, 255";
            description = ''
              Working hours color

              Type: Color
            '';
          };
          "Month Grid WorkHours Background Image" = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              

              Type: String
            '';
          };
          "Month Holidays Background Color" = mkOption {
            type = nullOr str;
            default = "255, 100, 100";
            description = ''
              Holiday color

              Type: Color
            '';
          };
          "Month Holidays Background Image" = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              

              Type: String
            '';
          };
        };
      };
      default = {};
      description = "Theme/Month view";
    };    
    "Theming" = with types; mkOption {
      type = submodule {
        options = { 
          "Agenda CalendarItems Background Color" = mkOption {
            type = nullOr str;
            default = "255, 100, 100";
            description = ''
              

              Type: Color
            '';
          };
          "Agenda CalendarItems Background Image" = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              

              Type: String
            '';
          };
          "Agenda CalendarItems Events Background Image" = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              

              Type: String
            '';
          };
          "Agenda CalendarItems Events Font" = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              

              Type: Font
            '';
          };
          "Agenda CalendarItems Events Frame Color" = mkOption {
            type = nullOr str;
            default = "255, 100, 100";
            description = ''
              

              Type: Color
            '';
          };
          "Agenda CalendarItems Events Icon" = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              

              Type: String
            '';
          };
          "Agenda CalendarItems Font" = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              

              Type: Font
            '';
          };
          "Agenda CalendarItems Frame Color" = mkOption {
            type = nullOr str;
            default = "255, 100, 100";
            description = ''
              

              Type: Color
            '';
          };
          "Agenda CalendarItems Icon" = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              

              Type: String
            '';
          };
          "Agenda CalendarItems ToDos Background Color" = mkOption {
            type = nullOr str;
            default = "255, 100, 100";
            description = ''
              

              Type: Color
            '';
          };
          "Agenda CalendarItems ToDos Background Image" = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              

              Type: String
            '';
          };
          "Agenda CalendarItems ToDos DueToday Background Image" = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              

              Type: String
            '';
          };
          "Agenda CalendarItems ToDos DueToday Font" = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              

              Type: Font
            '';
          };
          "Agenda CalendarItems ToDos DueToday Frame Color" = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              

              Type: Color
            '';
          };
          "Agenda CalendarItems ToDos DueToday Icon" = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              

              Type: String
            '';
          };
          "Agenda CalendarItems ToDos Font" = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              

              Type: Font
            '';
          };
          "Agenda CalendarItems ToDos Frame Color" = mkOption {
            type = nullOr str;
            default = "255, 100, 100";
            description = ''
              

              Type: Color
            '';
          };
          "Agenda CalendarItems ToDos Icon" = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              

              Type: String
            '';
          };
          "Agenda CalendarItems ToDos Overdue Background Image" = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              

              Type: String
            '';
          };
          "Agenda CalendarItems ToDos Overdue Font" = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              

              Type: Font
            '';
          };
          "Agenda CalendarItems ToDos Overdue Frame Color" = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              

              Type: Color
            '';
          };
          "Agenda CalendarItems ToDos Overdue Icon" = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              

              Type: String
            '';
          };
          "Agenda Grid Background Color" = mkOption {
            type = nullOr str;
            default = "255, 255, 255";
            description = ''
              Agenda view background color

              Type: Color
            '';
          };
          "Agenda Grid Background Image" = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              

              Type: String
            '';
          };
          "Agenda Grid Highlight Color" = mkOption {
            type = nullOr str;
            default = "100, 100, 255";
            description = ''
              Highlight color

              Type: Color
            '';
          };
          "Agenda Grid WorkHours Background Image" = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              

              Type: String
            '';
          };
          "Agenda Holidays Background Color" = mkOption {
            type = nullOr str;
            default = "255, 100, 100";
            description = ''
              Holiday color

              Type: Color
            '';
          };
          "Agenda Holidays Background Image" = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              

              Type: String
            '';
          };
          "Use System Color" = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Use system color

              Type: Bool
            '';
          };
        };
      };
      default = {};
      description = "Theming";
    };    
    "Time & Date" = with types; mkOption {
      type = submodule {
        options = { 
          ColorMonthBusyDaysEnabled = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Color busy days with a different background color

              Type: Bool
            '';
          };
          DayBegins = mkOption {
            type = nullOr str;
            default = "QDateTime(QDate(1752,1,1), QTime(7,0))";
            description = ''
              Day begins at

              Type: DateTime
            '';
          };
          "Exclude Holidays" = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Exclude holidays

              Type: Bool
            '';
          };
          Holidays = mkOption {
            type = nullOr (either str (listOf str));
            default = "";
            description = ''
              Use holiday regions:

              Type: StringList
            '';
          };
          TimeZoneId = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              

              Type: String
            '';
          };
          WeekStartDay = mkOption {
            type = nullOr (either str (enum [ 
            ]));
            default = "QLocale().firstDayOfWeek()-1";
            description = ''
              Weekly start day:

              Type: Enum
            '';
          };
          WorkingHoursEnd = mkOption {
            type = nullOr str;
            default = "QDateTime(QDate(1752,1,1), QTime(17,0))";
            description = ''
              Daily ending hour

              Type: DateTime
            '';
          };
          WorkingHoursStart = mkOption {
            type = nullOr str;
            default = "QDateTime(QDate(1752,1,1), QTime(8,0))";
            description = ''
              Daily starting hour

              Type: DateTime
            '';
          };
        };
      };
      default = {};
      description = "Time & Date";
    };    
    "Todo View" = with types; mkOption {
      type = submodule {
        options = { 
          "Flat List Todo" = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Display to-dos in a flat list

              Type: Bool
            '';
          };
          "Full View Todo" = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              To-do list view uses full window

              Type: Bool
            '';
          };
          "Record Todos In Journals" = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Record completed to-dos in journal entries

              Type: Bool
            '';
          };
          "Sort Completed Todos Separately" = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Always display completed to-dos at the bottom of the list

              Type: Bool
            '';
          };
        };
      };
      default = {};
      description = "Todo View";
    };    
    "Views" = with types; mkOption {
      type = submodule {
        options = { 
          "Hour Size" = mkOption {
            type = nullOr (either str int);
            default = 10;
            description = ''
              

              Type: Int
            '';
          };
          SelectionStartsEditor = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Time range selection in agenda view starts event editor

              Type: Bool
            '';
          };
        };
      };
      default = {};
      description = "Views";
    };    
  };
  config = mkIf (cfg.enable && moduleCfg.enable) {
    home.packages = mkIf (moduleCfg.package != false) [ moduleCfg.package ];
    programs.plasma.files."korganizerrc" = removeAttrs moduleCfg [ "enable" "package" ];
  };
}
