{ config, lib, ... }:
with lib;
let cfg = config.programs.plasma;
in {
  options.programs.plasma.kalendar = {
    "General" = with types;
      mkOption {
        type = submodule {
          options = {
            showMenubar = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''
                Show the Menubar.

                Type: Bool
              '';
            };
            forceCollapsedMainDrawer = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''
                Always have mainDrawer.collapsed.

                Type: Bool
              '';
            };
            enableMaps = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''
                Enable maps. NOTE: may cause crashing on some systems.

                Type: Bool
              '';
            };
            enableMailIntegration = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''
                Enable mail integration

                Type: Bool
              '';
            };
            locationMarker = mkOption {
              type = nullOr (either str (enum [ "Circle" "Pin" ]));
              default = "Pin";
              description = ''
                Type of marker for showing a place's location.

                Type: Enum
                Choices: 
                  - Circle: Left
                  - Pin: Center
              '';
            };
            lastOpenedView = mkOption {
              type = nullOr (either str (enum [
                "MonthView"
                "ScheduleView"
                "TodoView"
                "WeekView"
                "ThreeDayView"
                "DayView"
                "ContactView"
                "MailView"
              ]));
              default = "-1";
              description = ''
                Remember the last opened view.

                Type: Enum
                Choices: 
                  - MonthView
                  - ScheduleView
                  - TodoView
                  - WeekView
                  - ThreeDayView
                  - DayView
                  - ContactView
                  - MailView
              '';
            };
            incidenceInfoDrawerDrawerWidth = mkOption {
              type = nullOr (either str int);
              default = -1;
              description = ''
                Width of the incidence drawer

                Type: Int
              '';
            };
          };
        };
        default = { };
        description = "General";
      };
    "MainDrawer" = with types;
      mkOption {
        type = submodule {
          options = {
            tagsSectionExpanded = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''
                Whether the "Tags" section of the mainDrawer is expanded.

                Type: Bool
              '';
            };
            collectionsSectionExpanded = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''
                Whether the "Calendar" or "Contacts" section of the mainDrawer is expanded.

                Type: Bool
              '';
            };
          };
        };
        default = { };
        description = "MainDrawer";
      };
    "Editor" = with types;
      mkOption {
        type = submodule {
          options = {
            lastUsedEventCollection = mkOption {
              type = nullOr (either str int);
              default = -1;
              description = ''
                The last used event collection used when creating a event.

                Type: Int
              '';
            };
            lastUsedTodoCollection = mkOption {
              type = nullOr (either str int);
              default = -1;
              description = ''
                The last used todo collection used when creating a todo.

                Type: Int
              '';
            };
          };
        };
        default = { };
        description = "Editor";
      };
    "GeneralView" = with types;
      mkOption {
        type = submodule {
          options = {
            useIncidenceInfoPopup = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''
                Use a popup to view incidence information instead of a drawer.

                Type: Bool
              '';
            };
            showTodosInCalendarViews = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''
                Show Tasks in the calendar views (e.g. month, schedule, etc. views).

                Type: Bool
              '';
            };
            showSubtodosInCalendarViews = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''
                Show subtasks in the calendar views (e.g. month, schedule, etc. views).

                Type: Bool
              '';
            };
          };
        };
        default = { };
        description = "GeneralView";
      };
    "MonthView" = with types;
      mkOption {
        type = submodule {
          options = {
            monthGridMode = mkOption {
              type = nullOr
                (either str (enum [ "SwipeableMonthGrid" "BasicMonthGrid" ]));
              default = "SwipeableMonthGrid";
              description = ''
                Type of day grid view to be used internally in the month view"

                Type: Enum
                Choices: 
                  - SwipeableMonthGrid: Swipeable month grid
                  - BasicMonthGrid: Basic month grid
              '';
            };
            weekdayLabelAlignment = mkOption {
              type = nullOr (either str (enum [ "Left" "Center" "Right" ]));
              default = "Right";
              description = ''
                Alignment of week day header in month view.

                Type: Enum
                Choices: 
                  - Left: Left
                  - Center: Center
                  - Right: Right
              '';
            };
            weekdayLabelLength = mkOption {
              type =
                nullOr (either str (enum [ "Full" "Abbreviated" "Letter" ]));
              default = "Full";
              description = ''
                Format of weekday name.

                Type: Enum
                Choices: 
                  - Full: Full
                  - Abbreviated: Abbreviated
                  - Letter: Letter
              '';
            };
            showWeekNumbers = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''
                Show week numbers to the side of the month grid.

                Type: Bool
              '';
            };
            monthGridBorderWidth = mkOption {
              type = nullOr (either str int);
              default = 1;
              description = ''
                Set the width of the month grid's borders in pixels.

                Type: Int
              '';
            };
          };
        };
        default = { };
        description = "MonthView";
      };
    "WeekView" = with types;
      mkOption {
        type = submodule {
          options = {
            hourlyViewMode = mkOption {
              type = nullOr (either str (enum [
                "SwipeableInternalHourlyView"
                "BasicInternalHourlyView"
              ]));
              default = "SwipeableMonthGrid";
              description = ''
                Type of day grid view to be used internally in the month view"

                Type: Enum
                Choices: 
                  - SwipeableInternalHourlyView: Swipeable internal week view
                  - BasicInternalHourlyView: Basic internal week view
              '';
            };
            weekViewAllDayHeaderHeight = mkOption {
              type = nullOr (either str int);
              default = -1;
              description = ''
                Set the height of the all-day header at the top of the week view."

                Type: Int
              '';
            };
          };
        };
        default = { };
        description = "WeekView";
      };
    "ScheduleView" = with types;
      mkOption {
        type = submodule {
          options = {
            monthListMode = mkOption {
              type = nullOr
                (either str (enum [ "SwipeableMonthList" "BasicMonthList" ]));
              default = "SwipeableMonthList";
              description = ''
                Type of day list view to be used internally in the schedule view"

                Type: Enum
                Choices: 
                  - SwipeableMonthList: Swipeable internal month list view
                  - BasicMonthList: Basic internal month list view
              '';
            };
            showWeekHeaders = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''
                Show week headers in schedule view.

                Type: Bool
              '';
            };
          };
        };
        default = { };
        description = "ScheduleView";
      };
    "TaskView" = with types;
      mkOption {
        type = submodule {
          options = {
            sort = mkOption {
              type = nullOr
                (either str (enum [ "DueTime" "Alphabetically" "Priority" ]));
              default = "DueTime";
              description = ''
                Sorting of the taskview.

                Type: Enum
                Choices: 
                  - DueTime: Sort by due time
                  - Alphabetically: Sort alphabetically
                  - Priority: Sort by priority
              '';
            };
            ascendingOrder = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''
                Sort order

                Type: Bool
              '';
            };
            showCompletedSubtodos = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''
                Show all completed subtasks even if the parent task is incomplete

                Type: Bool
              '';
            };
            pastEventsTransparencyLevel = mkOption {
              type = nullOr (either str float);
              default = 0.0;
              description = ''
                Dimmer

                Type: Double
              '';
            };
          };
        };
        default = { };
        description = "TaskView";
      };
  };
  config =
    mkIf cfg.enable { programs.plasma.files."kalendarrc" = cfg.kalendar; };
}