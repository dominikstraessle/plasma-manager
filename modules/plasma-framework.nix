{ config, lib, ... }:
with lib;
let cfg = config.programs.plasma;
in {
  options.programs.plasma.plasma-framework = { 
    "General" = with types; mkOption {
      type = submodule {
        options = { 
          BoolTest = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          DisplayText = mkOption {
            type = nullOr str;
            default = "Hello World!";
            description = ''
              Text to display

              Type: String
            '';
          };
          IntTest = mkOption {
            type = nullOr (either str int);
            default = 1;
            description = ''
              

              Type: Int
              Min: -1
              Max: 100
            '';
          };
          Speed = mkOption {
            type = nullOr (either str int);
            default = 60;
            description = ''
              Speed of the leaves

              Type: int
              Min: 20
              Max: 150
            '';
          };
          Test = mkOption {
            type = nullOr str;
            default = "test";
            description = ''
              This is a test

              Type: String
            '';
          };
          Text = mkOption {
            type = nullOr str;
            default = "Hello!";
            description = ''
              Notes text

              Type: String
            '';
          };
          testIntEntry = mkOption {
            type = nullOr (either str int);
            default = 23;
            description = ''
              

              Type: Int
            '';
          };
          testStringEntry = mkOption {
            type = nullOr str;
            default = "string-value";
            description = ''
              

              Type: String
            '';
          };
        };
      };
      default = {};
      description = "General";
    };    
    "Group2" = with types; mkOption {
      type = submodule {
        options = { 
          EnumTest = mkOption {
            type = nullOr (either str (enum [ 
              "Value0"
              "Value1"
              "Value2"
              "Value3"
              "Value4"
              "Value5"
              "Value6"
            ]));
            default = "Value2";
            description = ''
              

              Type: Enum
              Choices: 
                - Value0
                - Value1
                - Value2
                - Value3
                - Value4
                - Value5
                - Value6
            '';
          };
          OtherTest = mkOption {
            type = nullOr str;
            default = "test2";
            description = ''
              This is another test

              Type: String
            '';
          };
        };
      };
      default = {};
      description = "Group2";
    };    
  };
  config = mkIf cfg.enable {
    programs.plasma.files."plasma-frameworkrc" = cfg.plasma-framework;
  };
}
