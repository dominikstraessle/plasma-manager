{ config, lib, pkgs, ... }:
with lib;
let
  cfg = config.programs.plasma;
  moduleCfg = config.programs.plasma.kconfig;
in {
  options.programs.plasma.kconfig = {
    enable = mkEnableOption ''
      Enable kconfig
    '';
    package = mkOption {
      default = if (pkgs ? kconfig) then
                        pkgs.kconfig
                      else
                        (if pkgs.libsForQt5 ? kconfig then pkgs.libsForQt5.kconfig else false);
      defaultText = literalExpression "pkgs.kconfig";
      type = with types; either bool package;
      description = mdDoc "Package to use.";
    };
    "$(AnotherSubGroup)" = with types; mkOption {
      type = submodule {
        options = { 
          Baz = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
        };
      };
      default = {};
      description = "$(AnotherSubGroup)";
    };    
    "$(SubGroup)" = with types; mkOption {
      type = submodule {
        options = { 
          Foo = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
        };
      };
      default = {};
      description = "$(SubGroup)";
    };    
    "Appearance" = with types; mkOption {
      type = submodule {
        options = { 
          emoticonRequireSpace = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Use strict mode in emoticon parsing.

              Type: Bool
            '';
          };
          emoticonTheme = mkOption {
            type = nullOr str;
            default = "Default";
            description = ''
              Current emoticon theme.

              Type: String
            '';
          };
          stylePath = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              Absolute path to a directory containing a Adium/Kopete chat window style.

              Type: String
            '';
          };
          styleVariant = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              Relative path to a CSS variant for the current style.

              Type: String
            '';
          };
          useEmoticon = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Enable emoticon support in Kopete.

              Type: Bool
            '';
          };
        };
      };
      default = {};
      description = "Appearance";
    };    
    "Bar$(Number)" = with types; mkOption {
      type = submodule {
        options = { 
          Age = mkOption {
            type = nullOr (either str int);
            default = 35;
            description = ''
              

              Type: Int
              Min: 8
              Max: 88
            '';
          };
          "foo bar" = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              

              Type: String
            '';
          };
        };
      };
      default = {};
      description = "Bar$(Number)";
    };    
    "Blah" = with types; mkOption {
      type = submodule {
        options = { 
          BlahBlah = mkOption {
            type = nullOr str;
            default = "a string";
            description = ''
              

              Type: String
            '';
          };
          Blubb = mkOption {
            type = nullOr (either str int);
            default = 10;
            description = ''
              

              Type: Int
            '';
          };
          MyPassword = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              

              Type: Password
            '';
          };
        };
      };
      default = {};
      description = "Blah";
    };    
    "Foo" = with types; mkOption {
      type = submodule {
        options = { 
          "$(Button)_mouse_action" = mkOption {
            type = nullOr (either str (enum [ 
              "Encrypt"
              "Decrypt"
              "CrashNBurn"
              "PumpNDump"
            ]));
            default = "PumpNDump";
            description = ''
              Mouse actions.

              Type: Enum
              Choices: 
                - Encrypt
                - Decrypt
                - CrashNBurn
                - PumpNDump
            '';
          };
          Age = mkOption {
            type = nullOr (either str int);
            default = 35;
            description = ''
              

              Type: Int
              Min: 8
              Max: 88
            '';
          };
          "bar foo" = mkOption {
            type = nullOr (either str (listOf str));
            default = "";
            description = ''
              

              Type: StringList
            '';
          };
          "color #$(Number)" = mkOption {
            type = nullOr str;
            default = "red";
            description = ''
              Block colors.

              Type: Color
            '';
          };
          "color string #$(Number)" = mkOption {
            type = nullOr str;
            default = "
      QString::number($(Number))
      ";
            defaultText = "Code: true";
            description = ''
              Gray colors as string.

              Type: String
            '';
          };
          "foo bar" = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              

              Type: String
            '';
          };
          "gray color #$(Number)" = mkOption {
            type = nullOr str;
            default = "
      QColor::fromRgbF($(Number) / 10.0, $(Number) / 10.0, $(Number) / 10.0)
      ";
            defaultText = "Code: true";
            description = ''
              Gray colors.

              Type: Color
            '';
          };
        };
      };
      default = {};
      description = "Foo";
    };    
    "General" = with types; mkOption {
      type = submodule {
        options = { 
          "Auto Save" = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Enable automatic saving of calendar

              Type: Bool
            '';
          };
          SomeStateData = mkOption {
            type = nullOr (either str int);
            default = 0;
            description = ''
              

              Type: Int
            '';
          };
        };
      };
      default = {};
      description = "General";
    };    
    "General-$(folder)" = with types; mkOption {
      type = submodule {
        options = { 
          "Another Option" = mkOption {
            type = nullOr (either str int);
            default = 5;
            description = ''
              Another option

              Type: Int
            '';
          };
          ListOption = mkOption {
            type = nullOr (either str (enum [ 
              "One"
              "Two"
              "Three"
            ]));
            default = "One";
            description = ''
              This is some funky option

              Type: Enum
              Choices: 
                - One
                - Two
                - Three
            '';
          };
          OneOption = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              One option

              Type: Bool
            '';
          };
        };
      };
      default = {};
      description = "General-$(folder)";
    };    
    "Group" = with types; mkOption {
      type = submodule {
        options = { 
          Font = mkOption {
            type = nullOr str;
            default = "QFont()";
            defaultText = "Code: true";
            description = ''
              

              Type: Font
            '';
          };
          TitleFont = mkOption {
            type = nullOr str;
            default = "QFont()";
            defaultText = "Code: true";
            description = ''
              

              Type: Font
            '';
          };
        };
      };
      default = {};
      description = "Group";
    };    
    "Group8b1" = with types; mkOption {
      type = submodule {
        options = { 
          Something = mkOption {
            type = nullOr (either str int);
            default = 60;
            description = ''
              

              Type: UInt
            '';
          };
        };
      };
      default = {};
      description = "Group8b1";
    };    
    "Group8b2" = with types; mkOption {
      type = submodule {
        options = { 
          FooBoo = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          Port = mkOption {
            type = nullOr (either str int);
            default = 1000;
            description = ''
              

              Type: UInt
            '';
          };
        };
      };
      default = {};
      description = "Group8b2";
    };    
    "MyOptions" = with types; mkOption {
      type = submodule {
        options = { 
          "Another Option" = mkOption {
            type = nullOr (either str int);
            default = 10;
            description = ''
              Another option

              Type: Int
            '';
          };
          "List-$(transport)-$(folder)" = mkOption {
            type = nullOr (either str int);
            default = 1;
            description = ''
              List Number

              Type: Int
            '';
          };
          MyPath = mkOption {
            type = nullOr str;
            default = ''QDir::homePath()+QString::fromLatin1(".hidden_file")'';
            defaultText = "Code: true";
            description = ''
              This is a path

              Type: Path
            '';
          };
          MyString = mkOption {
            type = nullOr str;
            default = "Default String";
            description = ''
              This is a string

              Type: String
            '';
          };
          MyStringList = mkOption {
            type = nullOr (either str (listOf str));
            default = "up,down";
            description = ''
              

              Type: StringList
            '';
          };
          MyStringListHidden = mkOption {
            type = nullOr (either str (listOf str));
            default = "up,down";
            description = ''
              

              Type: StringList
            '';
          };
        };
      };
      default = {};
      description = "MyOptions";
    };    
    "MyOptionsXX" = with types; mkOption {
      type = submodule {
        options = { 
          MyPathList = mkOption {
            type = nullOr (either str (listOf str));
            default = "/home,~";
            description = ''
              This is a list of paths

              Type: PathList
            '';
          };
          "MyPathsList2" = mkOption {
            type = nullOr (either str (listOf str));
            default = ''QStringList(QString::fromLatin1("/usr/bin")) << QDir::homePath()'';
            defaultText = "Code: true";
            description = ''
              This is an additional test for PathList

              Type: PathList
            '';
          };
          MyStringList = mkOption {
            type = nullOr (either str (listOf str));
            default = "up,down";
            description = ''
              

              Type: StringList
            '';
          };
        };
      };
      default = {};
      description = "MyOptionsXX";
    };    
    "SimpleGroup" = with types; mkOption {
      type = submodule {
        options = { 
          Foobar = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
        };
      };
      default = {};
      description = "SimpleGroup";
    };    
    "Something" = with types; mkOption {
      type = submodule {
        options = { 
          bar = mkOption {
            type = nullOr (either str int);
            default = 42;
            description = ''
              

              Type: Int
              Min: 36
              Max: 102
            '';
          };
          foo = mkOption {
            type = nullOr str;
            default = "default";
            description = ''
              

              Type: String
            '';
          };
          "foo_#$(myparam)" = mkOption {
            type = nullOr (either str float);
            default = 1.23;
            description = ''
              

              Type: double
              Min: 0.01
              Max: 89898.23
            '';
          };
        };
      };
      default = {};
      description = "Something";
    };    
    "kamoso" = with types; mkOption {
      type = submodule {
        options = { 
          StartsWithUppercase = mkOption {
            type = nullOr (either str bool);
            default = "";
            description = ''
              

              Type: bool
            '';
          };
          brightness = mkOption {
            type = nullOr (either str float);
            default = "";
            description = ''
              

              Type: double
            '';
          };
          picturesDir = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              

              Type: Url
            '';
          };
        };
      };
      default = {};
      description = "kamoso";
    };    
    "kconfigloadertest" = with types; mkOption {
      type = submodule {
        options = { 
          DefaultBoolItem = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          DefaultColorItem = mkOption {
            type = nullOr str;
            default = "#00FF00";
            description = ''
              

              Type: Color
            '';
          };
          DefaultDateTimeItem = mkOption {
            type = nullOr str;
            default = "Thu Sep 09 2010";
            description = ''
              

              Type: DateTime
            '';
          };
          DefaultDoubleItem = mkOption {
            type = nullOr (either str float);
            default = 13.37;
            description = ''
              

              Type: Double
            '';
          };
          DefaultEnumItem = mkOption {
            type = nullOr (either str (enum [ 
            ]));
            default = "3";
            description = ''
              

              Type: Enum
            '';
          };
          DefaultFontItem = mkOption {
            type = nullOr str;
            default = "DejaVu Sans";
            description = ''
              

              Type: Font
            '';
          };
          DefaultIntItem = mkOption {
            type = nullOr (either str int);
            default = 27;
            description = ''
              

              Type: Int
            '';
          };
          DefaultIntListItem = mkOption {
            type = nullOr (either str (listOf int));
            default = "1,1,2,3,5,8";
            description = ''
              

              Type: IntList
            '';
          };
          DefaultLongLongItem = mkOption {
            type = nullOr (either str int);
            default = -9211372036854775808;
            description = ''
              

              Type: Int
            '';
          };
          DefaultPasswordItem = mkOption {
            type = nullOr str;
            default = "h4x.";
            description = ''
              

              Type: Password
            '';
          };
          DefaultPathItem = mkOption {
            type = nullOr str;
            default = "/dev/null";
            description = ''
              

              Type: Path
            '';
          };
          DefaultPointItem = mkOption {
            type = nullOr str;
            default = "185,857";
            description = ''
              

              Type: Point
            '';
          };
          DefaultRectItem = mkOption {
            type = nullOr str;
            default = "3,7,951,358";
            description = ''
              

              Type: Rect
            '';
          };
          DefaultSizeItem = mkOption {
            type = nullOr str;
            default = "640,480";
            description = ''
              

              Type: Size
            '';
          };
          DefaultStringItem = mkOption {
            type = nullOr str;
            default = "TestString";
            description = ''
              

              Type: String
            '';
          };
          DefaultStringListItem = mkOption {
            type = nullOr (either str (listOf str));
            default = "One,Two,Three,Four,Five";
            description = ''
              

              Type: StringList
            '';
          };
          DefaultUIntItem = mkOption {
            type = nullOr (either str int);
            default = 7;
            description = ''
              

              Type: UInt
            '';
          };
          DefaultULongLongItem = mkOption {
            type = nullOr (either str int);
            default = 9223372036854775806;
            description = ''
              

              Type: UInt
            '';
          };
          DefaultUrlItem = mkOption {
            type = nullOr str;
            default = "http://kde.org";
            description = ''
              

              Type: Url
            '';
          };
          EmptyDefaultIntListItem = mkOption {
            type = nullOr (either str (listOf int));
            default = "";
            description = ''
              

              Type: IntList
            '';
          };
        };
      };
      default = {};
      description = "kconfigloadertest";
    };    
    "muon" = with types; mkOption {
      type = submodule {
        options = { 
          RnRSource = mkOption {
            type = nullOr (either str (listOf str));
            default = "http://kde.org";
            description = ''
              

              Type: StringList
            '';
          };
        };
      };
      default = {};
      description = "muon";
    };    
    "other" = with types; mkOption {
      type = submodule {
        options = { 
          Bar = mkOption {
            type = nullOr (either str int);
            default = 42;
            description = ''
              

              Type: Int
            '';
          };
        };
      };
      default = {};
      description = "other";
    };    
    "test_group" = with types; mkOption {
      type = submodule {
        options = { 
          PowerButtonAction = mkOption {
            type = nullOr (either str (enum [ 
              "NoneMode"
              "ToRamMode"
              "ToDiskMode"
              "SuspendHybridMode"
              "ShutdownMode"
              "LogoutDialogMode"
              "LockScreenMode"
              "TurnOffScreenMode"
              "ToggleScreenOnOffMode"
            ]));
            default = "0";
            description = ''
              

              Type: Enum
              Choices: 
                - NoneMode
                - ToRamMode
                - ToDiskMode
                - SuspendHybridMode
                - ShutdownMode
                - LogoutDialogMode
                - LockScreenMode
                - TurnOffScreenMode
                - ToggleScreenOnOffMode
            '';
          };
        };
      };
      default = {};
      description = "test_group";
    };    
  };
  config = mkIf (cfg.enable && moduleCfg.enable) {
    home.packages = mkIf moduleCfg.package [ moduleCfg.package ];
    programs.plasma.files."kconfigrc" = removeAttrs moduleCfg [ "enable" "package" ];
  };
}
