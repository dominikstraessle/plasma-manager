{ config, lib, ... }:
with lib;
let cfg = config.programs.plasma;
in {
  options.programs.plasma.kgeography = { 
    "general" = with types; mkOption {
      type = submodule {
        options = { 
          colorDisguise = mkOption {
            type = nullOr (either str (enum [ 
              "Nothing"
              "Scramble"
            ]));
            default = "Nothing";
            description = ''
              What to do to colors of divisions

              Type: Enum
              Choices: 
                - Nothing
                - Scramble
            '';
          };
          focusFollowsMouse = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Whether press on space while hovering a button should trigger that button

              Type: Bool
            '';
          };
          lastMap = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              The last opened map

              Type: String
            '';
          };
          questionPlacingScheme = mkOption {
            type = nullOr (either str (enum [ 
              "TopLeft"
              "Top"
              "TopRight"
              "Left"
              "Center"
              "Right"
              "BottomLeft"
              "Bottom"
              "BottomRight"
            ]));
            default = "TopLeft";
            description = ''
              Placement alignment of the question

              Type: Enum
              Choices: 
                - TopLeft
                - Top
                - TopRight
                - Left
                - Center
                - Right
                - BottomLeft
                - Bottom
                - BottomRight
            '';
          };
          waitsForValidation = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Ask for validation before next question

              Type: Bool
            '';
          };
        };
      };
      default = {};
      description = "general";
    };    
  };
  config = mkIf cfg.enable {
    programs.plasma.files."kgeographyrc" = cfg.kgeography;
  };
}
