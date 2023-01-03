{ config, lib, ... }:
with lib;
let cfg = config.programs.plasma;
in {
  options.programs.plasma.kmahjongg = { 
    "General" = with types; mkOption {
      type = submodule {
        options = { 
          Angle = mkOption {
            type = nullOr (either str int);
            default = 0;
            description = ''
              

              Type: Int
            '';
          };
          "Background_file" = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              The background to use.

              Type: String
            '';
          };
          EditorGeometry = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              

              Type: Rect
            '';
          };
          "Layout_file" = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              The layout of the tiles.

              Type: String
            '';
          };
          RandomLayout = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Whether a random layout is chosen on startup.

              Type: Bool
            '';
          };
          RemovedTiles = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Whether the removed tiles will be shown on the board.

              Type: Bool
            '';
          };
          ShowMatchingTiles = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Whether matching tiles are shown.

              Type: Bool
            '';
          };
          "Solvable_game" = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Whether all games should be solvable.

              Type: Bool
            '';
          };
          "Tileset_file" = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              The tile-set to use.

              Type: String
            '';
          };
        };
      };
      default = {};
      description = "General";
    };    
  };
  config = mkIf cfg.enable {
    programs.plasma.files."kmahjonggrc" = cfg.kmahjongg;
  };
}
