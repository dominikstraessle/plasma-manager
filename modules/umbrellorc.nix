{ config, lib, ... }:
with lib;
let cfg = config.programs.plasma;
in {
  options.programs.plasma.umbrellorc = { 
    "Auto Layout" = with types; mkOption {
      type = submodule {
        options = { 
          autoDotPath = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Automatic Dot Path

              Type: Bool
            '';
          };
          dotPath = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              Dot Path

              Type: String
            '';
          };
          showExportLayout = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Show Export Layout

              Type: Bool
            '';
          };
        };
      };
      default = {};
      description = "Auto Layout";
    };    
    "CPP Code Generation" = with types; mkOption {
      type = submodule {
        options = { 
          accessorMethodsStartWithUpperCase = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Accessor methods start with capital letters

              Type: Bool
            '';
          };
          autoGenAccessors = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Auto Generate Accessors

              Type: Bool
            '';
          };
          classMemberPrefix = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              Class member prefix

              Type: String
            '';
          };
          docToolTag = mkOption {
            type = nullOr str;
            default = "@";
            description = ''
              Documentation tags

              Type: String
            '';
          };
          getterWithGetPrefix = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Getters with 'get' prefix

              Type: Bool
            '';
          };
          inlineAccessors = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Inline Accessors

              Type: Bool
            '';
          };
          inlineOps = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Inline operations

              Type: Bool
            '';
          };
          packageIsNamespace = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Package is namespace

              Type: Bool
            '';
          };
          publicAccessors = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Public Accessors

              Type: Bool
            '';
          };
          removePrefixFromAccessorMethods = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Remove prefix '[a-zA-Z]_' from accessor methods

              Type: Bool
            '';
          };
          stringClassName = mkOption {
            type = nullOr str;
            default = "std::string";
            description = ''
              String Class Name

              Type: String
            '';
          };
          stringClassNameInclude = mkOption {
            type = nullOr str;
            default = "<string>";
            description = ''
              String Class Name Include

              Type: String
            '';
          };
          stringIncludeIsGlobal = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              String Include is Global

              Type: Bool
            '';
          };
          vectorClassName = mkOption {
            type = nullOr str;
            default = "std::vector";
            description = ''
              Vector Class Name

              Type: String
            '';
          };
          vectorClassNameInclude = mkOption {
            type = nullOr str;
            default = "<vector>";
            description = ''
              Vector Class Name Include 

              Type: String
            '';
          };
          vectorIncludeIsGlobal = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Vector include is global

              Type: Bool
            '';
          };
          virtualDestructors = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Virtual Destructors

              Type: Bool
            '';
          };
        };
      };
      default = {};
      description = "CPP Code Generation";
    };    
    "Class Options" = with types; mkOption {
      type = submodule {
        options = { 
          defaultAttributeScope = mkOption {
            type = nullOr (either str (enum [ 
              "Public"
              "Private"
              "Protected"
              "Implementation"
              "FromParent"
            ]));
            default = "Uml::Visibility::Public";
            description = ''
              Default Attribute Scope

              Type: Enum
              Choices: 
                - Public
                - Private
                - Protected
                - Implementation
                - FromParent
            '';
          };
          defaultOperationScope = mkOption {
            type = nullOr (either str (enum [ 
              "Public"
              "Private"
              "Protected"
              "Implementation"
              "FromParent"
            ]));
            default = "Uml::Visibility::Public";
            description = ''
              Default Operation Scope

              Type: Enum
              Choices: 
                - Public
                - Private
                - Protected
                - Implementation
                - FromParent
            '';
          };
          showAttSig = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Show Attribute Signature

              Type: Bool
            '';
          };
          showAttribAssocs = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Show Attribute Associations

              Type: Bool
            '';
          };
          showAtts = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Show Attributes

              Type: Bool
            '';
          };
          showOpSig = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Show Operation Signature

              Type: Bool
            '';
          };
          showOps = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Show Operations

              Type: Bool
            '';
          };
          showPackage = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Show Package

              Type: Bool
            '';
          };
          showPublicOnly = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Show Public Only

              Type: Bool
            '';
          };
          showStereoType = mkOption {
            type = nullOr (either str (enum [ 
              "None"
              "Name"
              "Tags"
            ]));
            default = "Uml::ShowStereoType::Tags";
            description = ''
              Show Stereotypes

              Type: Enum
              Choices: 
                - None
                - Name
                - Tags
            '';
          };
          showVisibility = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Show Visibility

              Type: Bool
            '';
          };
        };
      };
      default = {};
      description = "Class Options";
    };    
    "Code Generation" = with types; mkOption {
      type = submodule {
        options = { 
          autoGenEmptyConstructors = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Auto Generate Empty Constructors

              Type: Bool
            '';
          };
          commentStyle = mkOption {
            type = nullOr (either str (enum [ 
              "SingleLine"
              "MultiLine"
            ]));
            default = "CodeGenerationPolicy::SingleLine";
            description = ''
              Comment Style

              Type: Enum
              Choices: 
                - SingleLine
                - MultiLine
            '';
          };
          defaultAssocFieldScope = mkOption {
            type = nullOr (either str (enum [ 
              "Public"
              "Private"
              "Protected"
              "Implementation"
              "FromParent"
            ]));
            default = "Uml::Visibility::FromParent";
            description = ''
              Default Association Field Scope

              Type: Enum
              Choices: 
                - Public
                - Private
                - Protected
                - Implementation
                - FromParent
            '';
          };
          defaultAttributeAccessorScope = mkOption {
            type = nullOr (either str (enum [ 
              "Public"
              "Private"
              "Protected"
              "Implementation"
              "FromParent"
            ]));
            default = "Uml::Visibility::FromParent";
            description = ''
              Default Attribute Accessor Scope

              Type: Enum
              Choices: 
                - Public
                - Private
                - Protected
                - Implementation
                - FromParent
            '';
          };
          forceDoc = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Force Documentation

              Type: Bool
            '';
          };
          forceSections = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Force Section Documentation

              Type: Bool
            '';
          };
          headingsDirectory = mkOption {
            type = nullOr str;
            default = "$HOME/kde/share/apps/umbrello/headings";
            description = ''
              Headings Directory

              Type: Path
            '';
          };
          includeHeadings = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Include headings

              Type: Bool
            '';
          };
          indentationAmount = mkOption {
            type = nullOr (either str int);
            default = 2;
            description = ''
              Indentation Amount

              Type: Int
              Max: 10
            '';
          };
          indentationType = mkOption {
            type = nullOr (either str (enum [ 
              "NONE"
              "TAB"
              "SPACE"
            ]));
            default = "CodeGenerationPolicy::SPACE";
            description = ''
              Indentation Type

              Type: Enum
              Choices: 
                - NONE
                - TAB
                - SPACE
            '';
          };
          lineEndingType = mkOption {
            type = nullOr (either str (enum [ 
              "UNIX"
              "DOS"
              "MAC"
            ]));
            default = "CodeGenerationPolicy::UNIX";
            description = ''
              Line Ending Type

              Type: Enum
              Choices: 
                - UNIX
                - DOS
                - MAC
            '';
          };
          modnamePolicy = mkOption {
            type = nullOr (either str (enum [ 
              "No"
              "Underscore"
              "Capitalise"
            ]));
            default = "CodeGenerationPolicy::Capitalise";
            description = ''
              Modifier Name Policy

              Type: Enum
              Choices: 
                - No
                - Underscore
                - Capitalise
            '';
          };
          outputDirectory = mkOption {
            type = nullOr str;
            default = "$HOME/uml-generated-code";
            description = ''
              Output Directory

              Type: Path
            '';
          };
          overwritePolicy = mkOption {
            type = nullOr (either str (enum [ 
              "Ok"
              "Ask"
              "Never"
              "Cancel"
            ]));
            default = "CodeGenerationPolicy::Ask";
            description = ''
              Overwrite Policy

              Type: Enum
              Choices: 
                - Ok
                - Ask
                - Never
                - Cancel
            '';
          };
        };
      };
      default = {};
      description = "Code Generation";
    };    
    "Code Importer" = with types; mkOption {
      type = submodule {
        options = { 
          createArtifacts = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Create Artifacts for imported files

              Type: Bool
            '';
          };
          resolveDependencies = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Resolve dependencies

              Type: Bool
            '';
          };
          "supportCPP11" = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Support C++11 standard

              Type: Bool
            '';
          };
        };
      };
      default = {};
      description = "Code Importer";
    };    
    "Code Viewer Options" = with types; mkOption {
      type = submodule {
        options = { 
          blocksAreHighlighted = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Highlight Blocks

              Type: Bool
            '';
          };
          editBlockColor = mkOption {
            type = nullOr str;
            default = "pink";
            description = ''
              Edit Block Color

              Type: Color
            '';
          };
          font = mkOption {
            type = nullOr str;
            default = "Uml::systemFont()";
            description = ''
              Font

              Type: Font
            '';
          };
          fontColor = mkOption {
            type = nullOr str;
            default = "black";
            description = ''
              Font Color

              Type: Color
            '';
          };
          height = mkOption {
            type = nullOr (either str int);
            default = 40;
            description = ''
              Height

              Type: Int
              Max: 100
            '';
          };
          hiddenColor = mkOption {
            type = nullOr str;
            default = "grey";
            description = ''
              Hidden Color

              Type: Color
            '';
          };
          nonEditBlockColor = mkOption {
            type = nullOr str;
            default = "pink";
            description = ''
              Non Edit Block Color

              Type: Color
            '';
          };
          paperColor = mkOption {
            type = nullOr str;
            default = "white";
            description = ''
              Paper Color

              Type: Color
            '';
          };
          selectedColor = mkOption {
            type = nullOr str;
            default = "yellow";
            description = ''
              Selected Color

              Type: Color
            '';
          };
          showHiddenBlocks = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Show Hidden Blocks

              Type: Bool
            '';
          };
          umlObjectColor = mkOption {
            type = nullOr str;
            default = "grey";
            description = ''
              UML Object Color

              Type: Color
            '';
          };
          width = mkOption {
            type = nullOr (either str int);
            default = 80;
            description = ''
              Width

              Type: Int
              Max: 100
            '';
          };
        };
      };
      default = {};
      description = "Code Viewer Options";
    };    
    "D Code Generation" = with types; mkOption {
      type = submodule {
        options = { 
          autoGenerateAssocAccessors = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Auto Generate Assoc Accessors ( D )

              Type: Bool
            '';
          };
          autoGenerateAttributeAccessors = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Auto Generate Attribute Accessors ( D ) 

              Type: Bool
            '';
          };
          buildANTDocument = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Build ANT Document (D) 

              Type: Bool
            '';
          };
        };
      };
      default = {};
      description = "D Code Generation";
    };    
    "General Options" = with types; mkOption {
      type = submodule {
        options = { 
          Geometry = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              Geometry

              Type: Size
            '';
          };
          angularlines = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Angular Lines

              Type: Bool
            '';
          };
          autosave = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Auto Save

              Type: Bool
            '';
          };
          autosavesuffix = mkOption {
            type = nullOr str;
            default = ".xmi";
            description = ''
              Auto Save Suffix

              Type: String
            '';
          };
          autosavetime = mkOption {
            type = nullOr (either str int);
            default = 0;
            description = ''
              

              Type: Int
              Min: 0
              Max: 25
            '';
          };
          defaultLanguage = mkOption {
            type = nullOr (either str (enum [ 
              "ActionScript"
              "Ada"
              "Cpp"
              "CSharp"
              "D"
              "IDL"
              "Java"
              "JavaScript"
              "MySQL"
              "Pascal"
              "Perl"
              "PHP"
              "PHP5"
              "PostgreSQL"
              "Python"
              "Ruby"
              "SQL"
              "Tcl"
              "Vala"
              "XMLSchema"
              "Reserved"
            ]));
            default = "Uml::ProgrammingLanguage::Cpp";
            description = ''
              Default Language at Startup

              Type: Enum
              Choices: 
                - ActionScript
                - Ada
                - Cpp
                - CSharp
                - D
                - IDL
                - Java
                - JavaScript
                - MySQL
                - Pascal
                - Perl
                - PHP
                - PHP5
                - PostgreSQL
                - Python
                - Ruby
                - SQL
                - Tcl
                - Vala
                - XMLSchema
                - Reserved
            '';
          };
          diagram = mkOption {
            type = nullOr (either str (enum [ 
              "Undefined"
              "Class"
              "UseCase"
              "Sequence"
              "Collaboration"
              "State"
              "Activity"
              "Component"
              "Deployment"
              "EntityRelationship"
              "N_DIAGRAMTYPES"
            ]));
            default = "Uml::DiagramType::Class";
            description = ''
              Diagram To Load at Startup

              Type: Enum
              Choices: 
                - Undefined
                - Class
                - UseCase
                - Sequence
                - Collaboration
                - State
                - Activity
                - Component
                - Deployment
                - EntityRelationship
                - N_DIAGRAMTYPES
            '';
          };
          footerPrinting = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Footer Printing

              Type: Bool
            '';
          };
          imageMimeType = mkOption {
            type = nullOr str;
            default = "image/png";
            description = ''
              Image Mime Type

              Type: String
            '';
          };
          lastFile = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              

              Type: String
            '';
          };
          layoutType = mkOption {
            type = nullOr (either str (enum [ 
              "Undefined"
              "Direct"
              "Orthogonal"
              "Polyline"
              "Spline"
              "N_LAYOUTTYPES"
            ]));
            default = "Uml::LayoutType::Direct";
            description = ''
              Layout Type

              Type: Enum
              Choices: 
                - Undefined
                - Direct
                - Orthogonal
                - Polyline
                - Spline
                - N_LAYOUTTYPES
            '';
          };
          loadlast = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Load Last

              Type: Bool
            '';
          };
          newcodegen = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              New Code Generator

              Type: Bool
            '';
          };
          tabdiagrams = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Tabbed Diagrams

              Type: Bool
            '';
          };
          time = mkOption {
            type = nullOr (either str int);
            default = 0;
            description = ''
              Auto Save Time ( Old )

              Type: Int
              Min: 0
              Max: 25
            '';
          };
          "uml2" = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Use UML-2.x Notation

              Type: Bool
            '';
          };
          undo = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Undo Support

              Type: Bool
            '';
          };
        };
      };
      default = {};
      description = "General Options";
    };    
    "Java Code Generation" = with types; mkOption {
      type = submodule {
        options = { 
          autoGenerateAssocAccessors = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Auto Generate Assoc Accessors (Java) 

              Type: Bool
            '';
          };
          autoGenerateAttributeAccessors = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Auto Generate Attribute Accessors (Java)

              Type: Bool
            '';
          };
          buildANTDocument = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Build ANT Document (Java) 

              Type: Bool
            '';
          };
        };
      };
      default = {};
      description = "Java Code Generation";
    };    
    "Ruby Code Generation" = with types; mkOption {
      type = submodule {
        options = { 
          autoGenerateAssocAccessors = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Auto Generate Assoc Accessors (Ruby)

              Type: Bool
            '';
          };
          autoGenerateAttributeAccessors = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Auto Generate Attribute Accessors (Ruby) 

              Type: Bool
            '';
          };
        };
      };
      default = {};
      description = "Ruby Code Generation";
    };    
    "UI Options" = with types; mkOption {
      type = submodule {
        options = { 
          backgroundColor = mkOption {
            type = nullOr str;
            default = "white";
            description = ''
              Background Color

              Type: Color
            '';
          };
          fillColor = mkOption {
            type = nullOr str;
            default = "#ffffc0";
            description = ''
              Fill Color

              Type: Color
            '';
          };
          font = mkOption {
            type = nullOr str;
            default = "Uml::systemFont()";
            defaultText = "Code: true";
            description = ''
              Font

              Type: Font
            '';
          };
          gridDotColor = mkOption {
            type = nullOr str;
            default = "lightGray";
            description = ''
              Grid Dot Color

              Type: Color
            '';
          };
          lineColor = mkOption {
            type = nullOr str;
            default = "#990000";
            description = ''
              Line Color

              Type: Color
            '';
          };
          lineWidth = mkOption {
            type = nullOr (either str int);
            default = 0;
            description = ''
              Line Width

              Type: UInt
            '';
          };
          rightToLeftUI = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Right to left user interface

              Type: Bool
            '';
          };
          showDocWindow = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Show Doc Window

              Type: Bool
            '';
          };
          textColor = mkOption {
            type = nullOr str;
            default = "black";
            description = ''
              Text Color

              Type: Color
            '';
          };
          useFillColor = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Use Fill Color

              Type: Bool
            '';
          };
        };
      };
      default = {};
      description = "UI Options";
    };    
  };
  config = mkIf cfg.enable {
    programs.plasma.files."umbrellorc" = cfg.umbrellorc;
  };
}
