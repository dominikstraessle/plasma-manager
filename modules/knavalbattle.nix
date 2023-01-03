{ config, lib, ... }:
with lib;
let cfg = config.programs.plasma;
in {
  options.programs.plasma.knavalbattle = { 
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
  config = mkIf cfg.enable {
    programs.plasma.files."knavalbattlerc" = cfg.knavalbattle;
  };
}
