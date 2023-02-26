{ config, lib, ... }:
with lib;
let
  cfg = config.programs.plasma;
  moduleCfg = config.programs.plasma.knavalbattle;
in {
  options.programs.plasma.knavalbattle = {
    enable = mkEnableOption ''
      Enable knavalbattle
    '';
    package = mkOption {
      default = if (pkgs ? knavalbattle) then
                        pkgs.knavalbattle
                      else
                        (if pkgs.libsForQt5 ? knavalbattle then pkgs.libsForQt5.knavalbattle else false);
      defaultText = literalExpression "pkgs.knavalbattle";
      type = with types; either bool package;
      description = mdDoc "Package to use.";
    };
    "general" = with types; mkOption {
      type = submodule {
        options = { 
          AdjacentShips = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Allow the ships to be adjacent without one empty space between them.

              Type: Bool
            '';
          };
          EnableSounds = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Whether sound effects should be played.

              Type: Bool
            '';
          };
          Nickname = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              User nickname.

              Type: String
            '';
          };
          SeveralShips = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Allow multiple ships of any size, default: 4 of 1, 3 of 2, 2 of 3, 1 of 4.

              Type: Bool
            '';
          };
        };
      };
      default = {};
      description = "general";
    };    
    "network" = with types; mkOption {
      type = submodule {
        options = { 
          Hostname = mkOption {
            type = nullOr str;
            default = "localhost";
            description = ''
              Default hostname for multiplayer games.

              Type: String
            '';
          };
          Port = mkOption {
            type = nullOr (either str int);
            default = 54321;
            description = ''
              Default port for multiplayer games.

              Type: Int
            '';
          };
        };
      };
      default = {};
      description = "network";
    };    
  };
  config = mkIf (cfg.enable && moduleCfg.enable) {
    home.packages = mkIf moduleCfg.package [ moduleCfg.package ];
    programs.plasma.files."knavalbattlerc" = removeAttrs moduleCfg [ "enable" "package" ];
  };
}
