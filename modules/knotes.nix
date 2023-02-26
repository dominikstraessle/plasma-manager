{ config, lib, ... }:
with lib;
let
  cfg = config.programs.plasma;
  moduleCfg = config.programs.plasma.knotes;
in {
  options.programs.plasma.knotes = {
    enable = mkEnableOption ''
      Enable knotes
    '';
    package = mkOption {
      default = if (pkgs ? knotes) then
                        pkgs.knotes
                      else
                        (if pkgs.libsForQt5 ? knotes then pkgs.libsForQt5.knotes else false);
      defaultText = literalExpression "pkgs.knotes";
      type = either bool types.package;
      description = mdDoc "Package to use.";
    };
    "Actions" = with types; mkOption {
      type = submodule {
        options = { 
          MailAction = mkOption {
            type = nullOr str;
            default = "kmail --subject %t --body %f";
            description = ''
              

              Type: String
            '';
          };
        };
      };
      default = {};
      description = "Actions";
    };    
    "Alarms" = with types; mkOption {
      type = submodule {
        options = { 
          AlarmsLastChecked = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              

              Type: DateTime
            '';
          };
          CheckInterval = mkOption {
            type = nullOr (either str int);
            default = 60;
            description = ''
              

              Type: UInt
            '';
          };
        };
      };
      default = {};
      description = "Alarms";
    };    
    "Display" = with types; mkOption {
      type = submodule {
        options = { 
          RememberDesktop = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          bgcolor = mkOption {
            type = nullOr str;
            default = "Qt::yellow";
            defaultText = "Code: true";
            description = ''
              

              Type: Color
            '';
          };
          fgcolor = mkOption {
            type = nullOr str;
            default = "Qt::black";
            defaultText = "Code: true";
            description = ''
              

              Type: Color
            '';
          };
          height = mkOption {
            type = nullOr (either str int);
            default = 300;
            description = ''
              

              Type: UInt
            '';
          };
          width = mkOption {
            type = nullOr (either str int);
            default = 300;
            description = ''
              

              Type: UInt
            '';
          };
        };
      };
      default = {};
      description = "Display";
    };    
    "Editor" = with types; mkOption {
      type = submodule {
        options = { 
          ReadOnly = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          autoindent = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          font = mkOption {
            type = nullOr str;
            default = "QFontDatabase::systemFont(QFontDatabase::GeneralFont)";
            defaultText = "Code: true";
            description = ''
              

              Type: Font
            '';
          };
          richtext = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          tabsize = mkOption {
            type = nullOr (either str int);
            default = 4;
            description = ''
              

              Type: UInt
            '';
          };
          titlefont = mkOption {
            type = nullOr str;
            default = "QFontDatabase::systemFont(QFontDatabase::TitleFont)";
            defaultText = "Code: true";
            description = ''
              

              Type: Font
            '';
          };
        };
      };
      default = {};
      description = "Editor";
    };    
    "General" = with types; mkOption {
      type = submodule {
        options = { 
          AutoCreateResourceOnStart = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          Path = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              Path to maildir

              Type: Path
            '';
          };
          ReadOnly = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Do not change the actual backend data.

              Type: Bool
            '';
          };
          TopLevelIsContainer = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Path points to a folder containing Maildirs instead of to a maildir itself.

              Type: Bool
            '';
          };
          enabled = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
        };
      };
      default = {};
      description = "General";
    };    
    "Misc" = with types; mkOption {
      type = submodule {
        options = { 
          SystemTrayShowNotes = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
        };
      };
      default = {};
      description = "Misc";
    };    
    "Network" = with types; mkOption {
      type = submodule {
        options = { 
          KnownHosts = mkOption {
            type = nullOr (either str (listOf str));
            default = "";
            description = ''
              

              Type: StringList
            '';
          };
          NoteHostDialogSize = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              

              Type: Size
            '';
          };
          Port = mkOption {
            type = nullOr (either str int);
            default = 24837;
            description = ''
              The port will listen on and send notes to.

              Type: UInt
            '';
          };
          ReceiveNotes = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          SenderID = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              

              Type: String
            '';
          };
        };
      };
      default = {};
      description = "Network";
    };    
    "Note" = with types; mkOption {
      type = submodule {
        options = { 
          DefaultTitle = mkOption {
            type = nullOr str;
            default = "%d %t";
            description = ''
              

              Type: String
            '';
          };
        };
      };
      default = {};
      description = "Note";
    };    
    "Printing" = with types; mkOption {
      type = submodule {
        options = { 
          Theme = mkOption {
            type = nullOr str;
            default = null;
            description = ''
              

              Type: String
            '';
          };
        };
      };
      default = {};
      description = "Printing";
    };    
    "SelectNoteFolder" = with types; mkOption {
      type = submodule {
        options = { 
          DefaultFolder = mkOption {
            type = nullOr (either str int);
            default = -1;
            description = ''
              

              Type: Int
            '';
          };
        };
      };
      default = {};
      description = "SelectNoteFolder";
    };    
    "WindowDisplay" = with types; mkOption {
      type = submodule {
        options = { 
          HideNote = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          KeepAbove = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          KeepBelow = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          ShowInTaskbar = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          desktop = mkOption {
            type = nullOr (either str int);
            default = -10;
            description = ''
              

              Type: Int
            '';
          };
          position = mkOption {
            type = nullOr str;
            default = "QPoint( -10000, -10000 )";
            defaultText = "Code: true";
            description = ''
              

              Type: Point
            '';
          };
        };
      };
      default = {};
      description = "WindowDisplay";
    };    
  };
  config = mkIf (cfg.enable && moduleCfg.enable) {
    home.packages = mkIf moduleCfg.package [ moduleCfg.package ];
    programs.plasma.files."akonadi_sendlater_agentrc" = removeAttrs moduleCfg [ "enable" "package" ];
  };
}
