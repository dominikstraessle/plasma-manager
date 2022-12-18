{ config, lib, ... }:
with lib;
let cfg = config.programs.plasma;
in {
  options.programs.plasma.kspread = { 
    "Parameters" = with types; mkOption {
      type = submodule {
        options = { 
          "Other list" = mkOption {
            type = nullOr (either str (listOf str));
            default = "";
            description = ''
              

              Type: StringList
            '';
          };
          "NbPage" = mkOption {
            type = nullOr (either str int);
            default = "";
            description = ''
              

              Type: Int
            '';
          };
          "Zoom" = mkOption {
            type = nullOr (either str int);
            default = "";
            description = ''
              

              Type: Int
            '';
          };
          "Horiz ScrollBar" = mkOption {
            type = nullOr (either str bool);
            default = "";
            description = ''
              

              Type: Bool
            '';
          };
          "Vert ScrollBar" = mkOption {
            type = nullOr (either str bool);
            default = "";
            description = ''
              

              Type: Bool
            '';
          };
          "Column Header" = mkOption {
            type = nullOr (either str bool);
            default = "";
            description = ''
              

              Type: Bool
            '';
          };
          "Row Header" = mkOption {
            type = nullOr (either str bool);
            default = "";
            description = ''
              

              Type: Bool
            '';
          };
          "Completion Mode" = mkOption {
            type = nullOr (either str int);
            default = "";
            description = ''
              

              Type: Int
            '';
          };
          "Move" = mkOption {
            type = nullOr (either str int);
            default = "";
            description = ''
              

              Type: Int
            '';
          };
          "Indent" = mkOption {
            type = nullOr (either str int);
            default = "";
            description = ''
              

              Type: Int
            '';
          };
          "Method of Calc" = mkOption {
            type = nullOr (either str int);
            default = "";
            description = ''
              

              Type: Int
            '';
          };
          "Tabbar" = mkOption {
            type = nullOr (either str bool);
            default = "";
            description = ''
              

              Type: Bool
            '';
          };
          "Msg error" = mkOption {
            type = nullOr (either str bool);
            default = "";
            description = ''
              

              Type: Bool
            '';
          };
          "Formula bar" = mkOption {
            type = nullOr (either str bool);
            default = "";
            description = ''
              

              Type: Bool
            '';
          };
          "Status bar" = mkOption {
            type = nullOr (either str bool);
            default = "";
            description = ''
              

              Type: Bool
            '';
          };
          "NbRecentFile" = mkOption {
            type = nullOr (either str int);
            default = "";
            description = ''
              

              Type: Int
            '';
          };
          "AutoSave" = mkOption {
            type = nullOr (either str int);
            default = "";
            description = ''
              

              Type: Int
            '';
          };
          "BackupFile" = mkOption {
            type = nullOr (either str bool);
            default = "";
            description = ''
              

              Type: Bool
            '';
          };
        };
      };
      default = {};
      description = "Parameters";
    };    
    "KSpell kspread" = with types; mkOption {
      type = submodule {
        options = { 
          "KSpell_IgnoreUppercaseWords" = mkOption {
            type = nullOr (either str bool);
            default = "";
            description = ''
              

              Type: Bool
            '';
          };
          "KSpell_IgnoreTitleCaseWords" = mkOption {
            type = nullOr (either str bool);
            default = "";
            description = ''
              

              Type: Bool
            '';
          };
          "KSpell_dont_check_upper_word" = mkOption {
            type = nullOr (either str bool);
            default = "";
            description = ''
              

              Type: Bool
            '';
          };
          "KSpell_dont_check_title_case" = mkOption {
            type = nullOr (either str bool);
            default = "";
            description = ''
              

              Type: Bool
            '';
          };
        };
      };
      default = {};
      description = "KSpell kspread";
    };    
    "KSpread Page Layout" = with types; mkOption {
      type = submodule {
        options = { 
          "Default unit page" = mkOption {
            type = nullOr (either str int);
            default = "";
            description = ''
              

              Type: Int
            '';
          };
          "Default size page" = mkOption {
            type = nullOr (either str int);
            default = "";
            description = ''
              

              Type: Int
            '';
          };
          "Default orientation page" = mkOption {
            type = nullOr (either str int);
            default = "";
            description = ''
              

              Type: Int
            '';
          };
        };
      };
      default = {};
      description = "KSpread Page Layout";
    };    
    "Misc" = with types; mkOption {
      type = submodule {
        options = { 
          "UndoRedo" = mkOption {
            type = nullOr (either str int);
            default = "";
            description = ''
              

              Type: Int
            '';
          };
        };
      };
      default = {};
      description = "Misc";
    };    
    "KSpread Color" = with types; mkOption {
      type = submodule {
        options = { 
          "GridColor" = mkOption {
            type = nullOr (either str str);
            default = "";
            description = ''
              

              Type: Color
            '';
          };
          "PageOutlineColor" = mkOption {
            type = nullOr (either str str);
            default = "";
            description = ''
              

              Type: Color
            '';
          };
        };
      };
      default = {};
      description = "KSpread Color";
    };    
    "Sheet-Style" = with types; mkOption {
      type = submodule {
        options = { 
          "XML" = mkOption {
            type = nullOr (either str str);
            default = "";
            description = ''
              

              Type: String
            '';
          };
          "Image" = mkOption {
            type = nullOr (either str str);
            default = "";
            description = ''
              

              Type: String
            '';
          };
          "Name" = mkOption {
            type = nullOr (either str str);
            default = "";
            description = ''
              

              Type: String
            '';
          };
        };
      };
      default = {};
      description = "Sheet-Style";
    };    
    "TTS" = with types; mkOption {
      type = submodule {
        options = { 
          "SpeakPointerWidget" = mkOption {
            type = nullOr (either str bool);
            default = "";
            description = ''
              

              Type: Bool
            '';
          };
          "SpeakFocusWidget" = mkOption {
            type = nullOr (either str bool);
            default = "";
            description = ''
              

              Type: Bool
            '';
          };
          "SpeakTooltips" = mkOption {
            type = nullOr (either str bool);
            default = "";
            description = ''
              

              Type: Bool
            '';
          };
          "SpeakWhatsThis" = mkOption {
            type = nullOr (either str bool);
            default = "";
            description = ''
              

              Type: Bool
            '';
          };
          "SpeakDisabled" = mkOption {
            type = nullOr (either str bool);
            default = "";
            description = ''
              

              Type: Bool
            '';
          };
          "SpeakAccelerators" = mkOption {
            type = nullOr (either str bool);
            default = "";
            description = ''
              

              Type: Bool
            '';
          };
          "AcceleratorPrefixWord" = mkOption {
            type = nullOr (either str str);
            default = "";
            description = ''
              

              Type: String
            '';
          };
          "PollingInterval" = mkOption {
            type = nullOr (either str int);
            default = "";
            description = ''
              

              Type: Int
            '';
          };
        };
      };
      default = {};
      description = "TTS";
    };    
  };
  config = mkIf cfg.enable {
    programs.plasma.files."kspreadrc" = cfg.kspread;
  };
}
