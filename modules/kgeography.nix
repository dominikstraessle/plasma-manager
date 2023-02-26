{ config, lib, pkgs, ... }:
with lib;
let
  cfg = config.programs.plasma;
  moduleCfg = config.programs.plasma.kgeography;
in {
  options.programs.plasma.kgeography = {
    enable = mkEnableOption ''
      Enable kgeography
    '';
    package = mkOption {
      default = if (pkgs ? kgeography) then
                        pkgs.kgeography
                      else
                        (if pkgs.libsForQt5 ? kgeography then pkgs.libsForQt5.kgeography else false);
      defaultText = literalExpression "pkgs.kgeography";
      type = with types; either bool package;
      description = mdDoc "Package to use.";
    };
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
  config = mkIf (cfg.enable && moduleCfg.enable) {
    home.packages = mkIf (moduleCfg.package != false) [ moduleCfg.package ];
    programs.plasma.files."kgeographyrc" = removeAttrs moduleCfg [ "enable" "package" ];
  };
}
