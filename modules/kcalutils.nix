{ config, lib, ... }:
with lib;
let
  cfg = config.programs.plasma;
  moduleCfg = config.programs.plasma.kcalutils;
in {
  options.programs.plasma.kcalutils = {
    enable = mkEnableOption ''
      Enable kcalutils
    '';
    package = mkOption {
      default = if (pkgs ? kcalutils) then
                        pkgs.kcalutils
                      else
                        (if pkgs.libsForQt5 ? kcalutils then pkgs.libsForQt5.kcalutils else false);
      defaultText = literalExpression "pkgs.kcalutils";
      type = with types; either bool package;
      description = mdDoc "Package to use.";
    };
    "$(application)-Events" = with types; mkOption {
      type = submodule {
        options = { 
          "Event View" = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Export events as list

              Type: Bool
            '';
          };
          "Export Attendees" = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Export attendees of the events

              Type: Bool
            '';
          };
          "Export Categories" = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Export categories of the events

              Type: Bool
            '';
          };
          "Export Location" = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Export location of the events

              Type: Bool
            '';
          };
          "Month View" = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Export in month view

              Type: Bool
            '';
          };
          Title = mkOption {
            type = nullOr str;
            default = ''QLatin1String("Calendar")'';
            defaultText = "Code: true";
            description = ''
              Title of the calendar

              Type: String
            '';
          };
          "Week View" = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Export in week view

              Type: Bool
            '';
          };
        };
      };
      default = {};
      description = "$(application)-Events";
    };    
    "$(application)-FreeBusy" = with types; mkOption {
      type = submodule {
        options = { 
          "Free/Busy Title" = mkOption {
            type = nullOr str;
            default = ''QLatin1String("Busy times")'';
            defaultText = "Code: true";
            description = ''
              Title of the free/busy list

              Type: String
            '';
          };
          "FreeBusy View" = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Export free/busy list

              Type: Bool
            '';
          };
        };
      };
      default = {};
      description = "$(application)-FreeBusy";
    };    
    "$(application)-General" = with types; mkOption {
      type = submodule {
        options = { 
          "Credit Name" = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              Creator application

              Type: String
            '';
          };
          "Credit URL" = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              Creator URL

              Type: String
            '';
          };
          "Date End" = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              Date end

              Type: DateTime
            '';
          };
          "Date Start" = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              Date start

              Type: DateTime
            '';
          };
          EMail = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              Email of the calendar owner

              Type: String
            '';
          };
          "Exclude Confidential" = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Exclude confidential incidences from the export

              Type: Bool
            '';
          };
          "Exclude Private" = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Exclude private incidences from the export

              Type: Bool
            '';
          };
          Name = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              Full name of the calendar owner

              Type: String
            '';
          };
          "Output File" = mkOption {
            type = nullOr str;
            default = "$HOME/calendar.html";
            description = ''
              Output filename

              Type: Path
            '';
          };
          "Page Title" = mkOption {
            type = nullOr str;
            default = ''QLatin1String("Calendar")'';
            defaultText = "Code: true";
            description = ''
              Page Title

              Type: String
            '';
          };
          "Style Sheet" = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              Style sheet

              Type: String
            '';
          };
        };
      };
      default = {};
      description = "$(application)-General";
    };    
    "$(application)-Journals" = with types; mkOption {
      type = submodule {
        options = { 
          "Journal Title" = mkOption {
            type = nullOr str;
            default = ''QLatin1String("Journals")'';
            defaultText = "Code: true";
            description = ''
              Title of the journal list

              Type: String
            '';
          };
          "Journal View" = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Export journals

              Type: Bool
            '';
          };
        };
      };
      default = {};
      description = "$(application)-Journals";
    };    
    "$(application)-Todos" = with types; mkOption {
      type = submodule {
        options = { 
          "Export Attendees" = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Export attendees of the to-dos

              Type: Bool
            '';
          };
          "Export Categories" = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Export categories of the to-dos

              Type: Bool
            '';
          };
          "Export Due Date" = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Export due dates of the to-dos

              Type: Bool
            '';
          };
          "Export Location" = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Export location of the to-dos

              Type: Bool
            '';
          };
          "Todo View" = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Export to-do list

              Type: Bool
            '';
          };
          "TodoList Title" = mkOption {
            type = nullOr str;
            default = ''QLatin1String("To-do List")'';
            defaultText = "Code: true";
            description = ''
              Title of the to-do list

              Type: String
            '';
          };
        };
      };
      default = {};
      description = "$(application)-Todos";
    };    
  };
  config = mkIf (cfg.enable && moduleCfg.enable) {
    home.packages = mkIf moduleCfg.package [ moduleCfg.package ];
    programs.plasma.files."libkcalutils_htmlexportrc" = removeAttrs moduleCfg [ "enable" "package" ];
  };
}
