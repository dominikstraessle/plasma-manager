{ config, lib, pkgs, ... }:
with lib;
let
  cfg = config.programs.plasma;
  moduleCfg = config.programs.plasma.eventviews;
in {
  options.programs.plasma.eventviews = {
    enable = mkEnableOption ''
      Enable eventviews
    '';
    package = mkOption {
      default = if (pkgs ? eventviews) then
                        pkgs.eventviews
                      else
                        (if pkgs.libsForQt5 ? eventviews then pkgs.libsForQt5.eventviews else false);
      defaultText = literalExpression "pkgs.eventviews";
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
                - CategoryInsideResourceOutside: Category inside, calendar outside
                - ResourceInsideCategoryOutside: Calendar inside, category outside
                - CategoryOnly: Only category
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
            default = true;
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
    "Colors" = with types; mkOption {
      type = submodule {
        options = { 
          "Agenda MarcusBainsLine Line Color" = mkOption {
            type = nullOr str;
            default = "0,0,255";
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
              "No category" color (for "Only category" drawing schemes)

              Type: Color
            '';
          };
          ViewBackgroundBusyColor = mkOption {
            type = nullOr str;
            default = "136, 255, 219";
            description = ''
              Agenda/Month view background busy color

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
        };
      };
      default = {};
      description = "Fonts";
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
              To-dos use category colors

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
          "Use Groupware Communication" = mkOption {
            type = nullOr (either str bool);
            default = false;
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
          ColorMonthBusyDaysEnabled = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Color busy days with a different background color

              Type: Bool
            '';
          };
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
                - MonthItemCategoryInsideResourceOutside: Category inside, calendar outside
                - MonthItemResourceInsideCategoryOutside: Calendar inside, category outside
                - MonthItemCategoryOnly: Only category
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
          DefaultEmailAttachMethod = mkOption {
            type = nullOr (either str (enum [ 
              "Ask"
              "Link"
              "InlineFull"
              "InlineBody"
            ]));
            default = "Ask";
            description = ''
              Default Email Attachment Method

              Type: Enum
              Choices: 
                - Ask: Always ask
                - Link: Only attach link to message
                - InlineFull: Attach complete message
                - InlineBody: Attach message without attachments
            '';
          };
        };
      };
      default = {};
      description = "Personal Settings";
    };    
    "Save Settings" = with types; mkOption {
      type = submodule {
        options = { 
          "Auto Save" = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Enable automatic saving of manually opened calendar files

              Type: Bool
            '';
          };
          "Auto Save Interval" = mkOption {
            type = nullOr (either str int);
            default = 10;
            description = ''
              Save &interval in minutes

              Type: Int
              Min: 1
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
            ]));
            default = "askDestination";
            description = ''
              New Events, To-dos and Journal Entries Should

              Type: Enum
              Choices: 
                - standardDestination: Be added to the standard calendar
                - askDestination: Be asked which calendar to use
            '';
          };
          "Html With Save" = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Export to HTML with every save

              Type: Bool
            '';
          };
        };
      };
      default = {};
      description = "Save Settings";
    };    
    "System Tray" = with types; mkOption {
      type = submodule {
        options = { 
          ShowReminderDaemon = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Show Reminder Daemon in the System Tray

              Type: Bool
            '';
          };
        };
      };
      default = {};
      description = "System Tray";
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
          "Agenda CalendarItems ToDos DueToday Background Color" = mkOption {
            type = nullOr str;
            default = "255, 200, 50";
            description = ''
              To-do due today color

              Type: Color
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
          "Agenda CalendarItems ToDos Overdue Background Color" = mkOption {
            type = nullOr str;
            default = "255, 100, 100";
            description = ''
              To-do overdue color

              Type: Color
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
          "Agenda Grid WorkHours Background Color" = mkOption {
            type = nullOr str;
            default = "225, 225, 255";
            description = ''
              Working hours color

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
        };
      };
      default = {};
      description = "Theming";
    };    
    "Time & Date" = with types; mkOption {
      type = submodule {
        options = { 
          DayBegins = mkOption {
            type = nullOr str;
            default = "QDateTime(QDate(1752,1,1), QTime(7,0))";
            description = ''
              Day begins at

              Type: DateTime
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
            default = true;
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
  };
  config = mkIf (cfg.enable && moduleCfg.enable) {
    home.packages = mkIf (moduleCfg.package != false) [ moduleCfg.package ];
    programs.plasma.files."eventviewsrc" = removeAttrs moduleCfg [ "enable" "package" ];
  };
}
