{ config, lib, pkgs, ... }:
with lib;
let
  cfg = config.programs.plasma;
  moduleCfg = config.programs.plasma.kdevelop;
in {
  options.programs.plasma.kdevelop = {
    enable = mkEnableOption ''
      Enable kdevelop
    '';
    package = mkOption {
      default = if (pkgs ? kdevelop) then
                        pkgs.kdevelop
                      else
                        (if pkgs.libsForQt5 ? kdevelop then pkgs.libsForQt5.kdevelop else false);
      defaultText = literalExpression "pkgs.kdevelop";
      type = with types; either bool package;
      description = mdDoc "Package to use.";
    };
    "" = with types; mkOption {
      type = submodule {
        options = { 
          example = mkOption {
            type = nullOr str;
            default = "Default Value";
            description = ''
              Example

              Type: String
            '';
          };
        };
      };
      default = {};
      description = "";
    };    
    "A Group" = with types; mkOption {
      type = submodule {
        options = { 
          "bool_option" = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              A Bool

              Type: Bool
            '';
          };
          "enum_option" = mkOption {
            type = nullOr (either str (enum [ 
              "First"
              "Second"
              "Last"
            ]));
            default = "Second";
            description = ''
              Bb Enum

              Type: Enum
              Choices: 
                - First
                - Second
                - Last
            '';
          };
          "string_option" = mkOption {
            type = nullOr str;
            default = "Test";
            description = ''
              Zzz String

              Type: String
            '';
          };
        };
      };
      default = {};
      description = "A Group";
    };    
    "Android" = with types; mkOption {
      type = submodule {
        options = { 
          abi = mkOption {
            type = nullOr str;
            default = "armeabi-v7a";
            description = ''
              

              Type: String
            '';
          };
          api = mkOption {
            type = nullOr str;
            default = "14";
            description = ''
              

              Type: String
            '';
          };
          arch = mkOption {
            type = nullOr str;
            default = "arm";
            description = ''
              

              Type: String
            '';
          };
          buildtools = mkOption {
            type = nullOr str;
            default = "21.1.1";
            description = ''
              

              Type: String
            '';
          };
          cmakeToolchain = mkOption {
            type = nullOr str;
            default = null;
            defaultText = "Code: true";
            description = ''
              

              Type: Path
            '';
          };
          gcc = mkOption {
            type = nullOr str;
            default = "4.9";
            description = ''
              

              Type: String
            '';
          };
          ndk = mkOption {
            type = nullOr str;
            default = null;
            defaultText = "Code: true";
            description = ''
              

              Type: Path
            '';
          };
          sdk = mkOption {
            type = nullOr str;
            default = null;
            defaultText = "Code: true";
            description = ''
              

              Type: Path
            '';
          };
          toolchain = mkOption {
            type = nullOr str;
            default = "arm-linux-androideabi";
            description = ''
              

              Type: String
            '';
          };
        };
      };
      default = {};
      description = "Android";
    };    
    "Background Parser" = with types; mkOption {
      type = submodule {
        options = { 
          Delay = mkOption {
            type = nullOr (either str int);
            default = 500;
            description = ''
              

              Type: Int
            '';
          };
          Enabled = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          "Number of Threads" = mkOption {
            type = nullOr (either str int);
            default = 2;
            description = ''
              

              Type: Int
            '';
          };
        };
      };
      default = {};
      description = "Background Parser";
    };    
    "Bb Group" = with types; mkOption {
      type = submodule {
        options = { 
          "b_option" = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              B Bool

              Type: Bool
            '';
          };
        };
      };
      default = {};
      description = "Bb Group";
    };    
    "CMakeBuilder" = with types; mkOption {
      type = submodule {
        options = { 
          cmakeExe = mkOption {
            type = nullOr str;
            default = null;
            defaultText = "Code: true";
            description = ''
              

              Type: Url
            '';
          };
          generator = mkOption {
            type = nullOr (either str int);
            default = 0;
            description = ''
              

              Type: Int
            '';
          };
        };
      };
      default = {};
      description = "CMakeBuilder";
    };    
    "Clang Settings" = with types; mkOption {
      type = submodule {
        options = { 
          forwardDeclare = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          lookAhead = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          macros = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
        };
      };
      default = {};
      description = "Clang Settings";
    };    
    "ClangTidy" = with types; mkOption {
      type = submodule {
        options = { 
          AdditionalParameters = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              

              Type: String
            '';
          };
          CheckSetSelection = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              

              Type: String
            '';
          };
          CheckSystemHeaders = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          EnabledChecks = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              

              Type: String
            '';
          };
          ExecutablePath = mkOption {
            type = nullOr str;
            default = null;
            defaultText = "Code: true";
            description = ''
              

              Type: Path
            '';
          };
          HeaderFilter = mkOption {
            type = nullOr str;
            default = ".*";
            description = ''
              

              Type: String
            '';
          };
          UseConfigFile = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          parallelJobsAutoCount = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          parallelJobsEnabled = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          parallelJobsFixedCount = mkOption {
            type = nullOr (either str int);
            default = 2;
            description = ''
              

              Type: Int
            '';
          };
        };
      };
      default = {};
      description = "ClangTidy";
    };    
    "Clazy" = with types; mkOption {
      type = submodule {
        options = { 
          docsPath = mkOption {
            type = nullOr str;
            default = null;
            defaultText = "Code: true";
            description = ''
              

              Type: Url
            '';
          };
          executablePath = mkOption {
            type = nullOr str;
            default = null;
            defaultText = "Code: true";
            description = ''
              

              Type: Url
            '';
          };
          hideOutputView = mkOption {
            type = nullOr (either str bool);
            default = null;
            defaultText = "Code: true";
            description = ''
              

              Type: Bool
            '';
          };
          parallelJobsAutoCount = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          parallelJobsEnabled = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          parallelJobsFixedCount = mkOption {
            type = nullOr (either str int);
            default = 2;
            description = ''
              

              Type: Int
            '';
          };
          verboseOutput = mkOption {
            type = nullOr (either str bool);
            default = null;
            defaultText = "Code: true";
            description = ''
              

              Type: Bool
            '';
          };
        };
      };
      default = {};
      description = "Clazy";
    };    
    "Cppcheck" = with types; mkOption {
      type = submodule {
        options = { 
          executablePath = mkOption {
            type = nullOr str;
            default = null;
            defaultText = "Code: true";
            description = ''
              

              Type: Path
            '';
          };
          hideOutputView = mkOption {
            type = nullOr (either str bool);
            default = null;
            defaultText = "Code: true";
            description = ''
              

              Type: Bool
            '';
          };
          showXmlOutput = mkOption {
            type = nullOr (either str bool);
            default = null;
            defaultText = "Code: true";
            description = ''
              

              Type: Bool
            '';
          };
        };
      };
      default = {};
      description = "Cppcheck";
    };    
    "Defines And Includes" = with types; mkOption {
      type = submodule {
        options = { 
          reparse = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
        };
      };
      default = {};
      description = "Defines And Includes";
    };    
    "Docker" = with types; mkOption {
      type = submodule {
        options = { 
          baseImage = mkOption {
            type = nullOr str;
            default = "ubuntu:16.04";
            description = ''
              Base image

              Type: String
            '';
          };
          buildDirsVolume = mkOption {
            type = nullOr str;
            default = "/build";
            description = ''
              

              Type: String
            '';
          };
          extraArguments = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              

              Type: String
            '';
          };
          projectsVolume = mkOption {
            type = nullOr str;
            default = "/src";
            description = ''
              

              Type: String
            '';
          };
        };
      };
      default = {};
      description = "Docker";
    };    
    "Flatpak" = with types; mkOption {
      type = submodule {
        options = { 
          appname = mkOption {
            type = nullOr str;
            default = "something";
            description = ''
              Application name

              Type: String
            '';
          };
          name = mkOption {
            type = nullOr str;
            default = "org.kde.something";
            description = ''
              AppStream name for the application

              Type: String
            '';
          };
          runtime = mkOption {
            type = nullOr str;
            default = "org.kde.Platform";
            description = ''
              Base platform

              Type: String
            '';
          };
          runtimeversion = mkOption {
            type = nullOr str;
            default = "master";
            description = ''
              Base platform version

              Type: String
            '';
          };
          sdk = mkOption {
            type = nullOr str;
            default = "org.kde.Sdk";
            description = ''
              Base SDK

              Type: String
            '';
          };
        };
      };
      default = {};
      description = "Flatpak";
    };    
    "General" = with types; mkOption {
      type = submodule {
        options = { 
          "add_roles_enum" = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Custom roles enum

              Type: Bool
            '';
          };
          buttonset = mkOption {
            type = nullOr (either str (enum [ 
              "Ok/Cancel"
              "Close"
            ]));
            default = "Ok/Cancel";
            description = ''
              Button set

              Type: Enum
              Choices: 
                - Ok/Cancel
                - Close
            '';
          };
          "first_role_name" = mkOption {
            type = nullOr str;
            default = "CustomRole";
            description = ''
              First custom role title

              Type: String
            '';
          };
          "roles_enum_name" = mkOption {
            type = nullOr str;
            default = "Roles";
            description = ''
              Custom roles enum name

              Type: String
            '';
          };
          "window_title" = mkOption {
            type = nullOr str;
            default = "{{ name }}";
            description = ''
              Window title

              Type: String
            '';
          };
        };
      };
      default = {};
      description = "General";
    };    
    "Heaptrack" = with types; mkOption {
      type = submodule {
        options = { 
          heaptrackExecutable = mkOption {
            type = nullOr str;
            default = null;
            defaultText = "Code: true";
            description = ''
              

              Type: Path
            '';
          };
          heaptrackGuiExecutable = mkOption {
            type = nullOr str;
            default = null;
            defaultText = "Code: true";
            description = ''
              

              Type: Path
            '';
          };
        };
      };
      default = {};
      description = "Heaptrack";
    };    
    "Interface" = with types; mkOption {
      type = submodule {
        options = { 
          interfaceid = mkOption {
            type = nullOr str;
            default = "{{ name }}";
            description = ''
              Interface identifier

              Type: String
            '';
          };
        };
      };
      default = {};
      description = "Interface";
    };    
    "Language Support" = with types; mkOption {
      type = submodule {
        options = { 
          "Automatic Invocation" = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          boldDeclarations = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          completionDetail = mkOption {
            type = nullOr (either str (enum [ 
              "Minimal"
              "MinimalWhenAutomatic"
              "AlwaysFull"
            ]));
            default = "";
            description = ''
              

              Type: Enum
              Choices: 
                - Minimal
                - MinimalWhenAutomatic
                - AlwaysFull
            '';
          };
          globalColorSource = mkOption {
            type = nullOr (either str (enum [ 
              "AutoGenerated"
              "FromTheme"
            ]));
            default = "";
            description = ''
              

              Type: Enum
              Choices: 
                - AutoGenerated
                - FromTheme
            '';
          };
          globalColorization = mkOption {
            type = nullOr (either str int);
            default = 255;
            description = ''
              

              Type: Int
            '';
          };
          highlightProblematicLines = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          highlightSemanticProblems = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          localColorization = mkOption {
            type = nullOr (either str int);
            default = 170;
            description = ''
              

              Type: Int
            '';
          };
          minFilesForSimplifiedParsing = mkOption {
            type = nullOr (either str int);
            default = 100000;
            description = ''
              

              Type: Int
            '';
          };
          problemInlineNotesLevel = mkOption {
            type = nullOr (either str (enum [ 
            ]));
            default = "KDevelop::ICompletionSettings::WarningsAndErrorsProblemInlineNotesLevel";
            description = ''
              

              Type: Enum
            '';
          };
          showMultiLineSelectionInformation = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          todoMarkerWords = mkOption {
            type = nullOr str;
            default = "TODO FIXME";
            description = ''
              

              Type: String
            '';
          };
        };
      };
      default = {};
      description = "Language Support";
    };    
    "Library" = with types; mkOption {
      type = submodule {
        options = { 
          "include_name" = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              Include file name

              Type: String
            '';
          };
          "library_name" = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              Library file name

              Type: String
            '';
          };
          name = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              Library name

              Type: String
            '';
          };
          "pc_package" = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              pkg-config package

              Type: String
            '';
          };
        };
      };
      default = {};
      description = "Library";
    };    
    "MakeBuilder" = with types; mkOption {
      type = submodule {
        options = { 
          "Abort on First Error" = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          "Additional Options" = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              

              Type: String
            '';
          };
          "Default Make Environment Profile" = mkOption {
            type = nullOr str;
            default = "default";
            description = ''
              

              Type: String
            '';
          };
          "Default Target" = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              

              Type: String
            '';
          };
          "Display Only" = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          "Install As Root" = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          "Make Binary" = mkOption {
            type = nullOr str;
            default = null;
            defaultText = "Code: true";
            description = ''
              

              Type: String
            '';
          };
          "Number Of Jobs" = mkOption {
            type = nullOr (either str int);
            default = 1;
            description = ''
              

              Type: UInt
            '';
          };
          "Override Number Of Jobs" = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          "Su Command" = mkOption {
            type = nullOr str;
            default = "kdesu -t";
            description = ''
              

              Type: String
            '';
          };
        };
      };
      default = {};
      description = "MakeBuilder";
    };    
    "NinjaBuilder" = with types; mkOption {
      type = submodule {
        options = { 
          "Additional Options" = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              

              Type: String
            '';
          };
          "Default Ninja Environment Profile" = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              

              Type: String
            '';
          };
          "Display Only" = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          "Install As Root" = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          "Number Of Errors" = mkOption {
            type = nullOr (either str int);
            default = 1;
            description = ''
              

              Type: UInt
            '';
          };
          "Number Of Jobs" = mkOption {
            type = nullOr (either str int);
            default = 1;
            description = ''
              

              Type: UInt
            '';
          };
          "Override Number Of Jobs" = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          "Su Command" = mkOption {
            type = nullOr (either str int);
            default = "";
            description = ''
              

              Type: Int
            '';
          };
        };
      };
      default = {};
      description = "NinjaBuilder";
    };    
    "PHP Documentation" = with types; mkOption {
      type = submodule {
        options = { 
          phpDocLocation = mkOption {
            type = nullOr str;
            default = "https://php.net";
            description = ''
              Specifies the location of the PHP documentation to use.

              Type: Url
            '';
          };
        };
      };
      default = {};
      description = "PHP Documentation";
    };    
    "Preferences" = with types; mkOption {
      type = submodule {
        options = { 
          "col_background" = mkOption {
            type = nullOr str;
            default = "black";
            description = ''
              color of the background

              Type: Color
            '';
          };
          "col_foreground" = mkOption {
            type = nullOr str;
            default = "yellow";
            description = ''
              color of the foreground

              Type: Color
            '';
          };
          "val_time" = mkOption {
            type = nullOr (either str int);
            default = 2;
            description = ''
              size of a ball

              Type: Int
            '';
          };
        };
      };
      default = {};
      description = "Preferences";
    };    
    "Private Class" = with types; mkOption {
      type = submodule {
        options = { 
          "private_class_name" = mkOption {
            type = nullOr str;
            default = "{{ name }}Private";
            description = ''
              Private class name

              Type: String
            '';
          };
          "private_member_name" = mkOption {
            type = nullOr str;
            default = "d";
            description = ''
              Private member name

              Type: String
            '';
          };
        };
      };
      default = {};
      description = "Private Class";
    };    
    "SourceFormatter" = with types; mkOption {
      type = submodule {
        options = { 
          ModelinesEnabled = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          OverrideKateIndentation = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          UseDefault = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
        };
      };
      default = {};
      description = "SourceFormatter";
    };    
    "Test" = with types; mkOption {
      type = submodule {
        options = { 
          "qtest_main" = mkOption {
            type = nullOr (either str (enum [ 
              "QTEST_MAIN"
              "QTEST_GUILESS_MAIN"
              "QTEST_APPLESS_MAIN"
            ]));
            default = "QTEST_MAIN";
            description = ''
              Type of main() function

              Type: Enum
              Choices: 
                - QTEST_MAIN
                - QTEST_GUILESS_MAIN
                - QTEST_APPLESS_MAIN
            '';
          };
          "testCase_initAndCleanup" = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Add init and cleanup methods for complete test case

              Type: Bool
            '';
          };
          "test_initAndCleanup" = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Add init and cleanup methods for each test

              Type: Bool
            '';
          };
          "test_nogui" = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              No UI required

              Type: Bool
            '';
          };
          "test_prefixMethods" = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Prefix all test methods with "test"

              Type: Bool
            '';
          };
        };
      };
      default = {};
      description = "Test";
    };    
    "UiSettings" = with types; mkOption {
      type = submodule {
        options = { 
          BottomLeftCornerOwner = mkOption {
            type = nullOr (either str int);
            default = "";
            description = ''
              

              Type: Int
            '';
          };
          BottomRightCornerOwner = mkOption {
            type = nullOr (either str int);
            default = "";
            description = ''
              

              Type: Int
            '';
          };
          CloseButtonsOnTabs = mkOption {
            type = nullOr (either str int);
            default = 1;
            description = ''
              

              Type: Int
            '';
          };
          ColorizeByProject = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          TabBarArrangeBuddies = mkOption {
            type = nullOr (either str int);
            default = 1;
            description = ''
              

              Type: Int
            '';
          };
          TabBarOpenAfterCurrent = mkOption {
            type = nullOr (either str int);
            default = 1;
            description = ''
              

              Type: Int
            '';
          };
          TabBarVisibility = mkOption {
            type = nullOr (either str int);
            default = 1;
            description = ''
              

              Type: Int
            '';
          };
        };
      };
      default = {};
      description = "UiSettings";
    };    
    "Zzz Group" = with types; mkOption {
      type = submodule {
        options = { 
          "z_option" = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Z Bool

              Type: Bool
            '';
          };
        };
      };
      default = {};
      description = "Zzz Group";
    };    
  };
  config = mkIf (cfg.enable && moduleCfg.enable) {
    home.packages = mkIf (moduleCfg.package != false) [ moduleCfg.package ];
    programs.plasma.files."kdeveloprc" = removeAttrs moduleCfg [ "enable" "package" ];
  };
}
