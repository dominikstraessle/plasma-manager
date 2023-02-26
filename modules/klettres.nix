{ config, lib, pkgs, ... }:
with lib;
let
  cfg = config.programs.plasma;
  moduleCfg = config.programs.plasma.klettres;
in {
  options.programs.plasma.klettres = {
    enable = mkEnableOption ''
      Enable klettres
    '';
    package = mkOption {
      default = if (pkgs ? klettres) then
                        pkgs.klettres
                      else
                        (if pkgs.libsForQt5 ? klettres then pkgs.libsForQt5.klettres else false);
      defaultText = literalExpression "pkgs.klettres";
      type = with types; either bool package;
      description = mdDoc "Package to use.";
    };
    "General" = with types; mkOption {
      type = submodule {
        options = { 
          GrownTimer = mkOption {
            type = nullOr (either str int);
            default = 2;
            description = ''
              Grown-up Timer

              Type: Int
            '';
          };
          KidTimer = mkOption {
            type = nullOr (either str int);
            default = 4;
            description = ''
              Kid Timer

              Type: Int
            '';
          };
          Language = mkOption {
            type = nullOr str;
            default = "en";
            description = ''
              Language

              Type: String
            '';
          };
          MenuBarBool = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Whether the menubar is shown or hidden

              Type: Bool
            '';
          };
          myLevel = mkOption {
            type = nullOr (either str int);
            default = 1;
            description = ''
              Difficulty level.

              Type: Int
              Min: 1
              Max: 4
            '';
          };
          myMode = mkOption {
            type = nullOr (either str (enum [ 
              "kid"
              "grownup"
            ]));
            default = "grownup";
            description = ''
              Mode

              Type: Enum
              Choices: 
                - kid
                - grownup
            '';
          };
          myTheme = mkOption {
            type = nullOr (either str (enum [ 
              "kid"
              "desert"
              "savannah"
            ]));
            default = "kid";
            description = ''
              Theme

              Type: Enum
              Choices: 
                - kid
                - desert
                - savannah
            '';
          };
        };
      };
      default = {};
      description = "General";
    };    
    "mFont" = with types; mkOption {
      type = submodule {
        options = { 
          mFont = mkOption {
            type = nullOr str;
            default = "defaultFont";
            defaultText = "Code: true";
            description = ''
              Font

              Type: Font
            '';
          };
        };
      };
      default = {};
      description = "mFont";
    };    
  };
  config = mkIf (cfg.enable && moduleCfg.enable) {
    home.packages = mkIf moduleCfg.package [ moduleCfg.package ];
    programs.plasma.files."klettresrc" = removeAttrs moduleCfg [ "enable" "package" ];
  };
}
