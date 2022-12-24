{ config, lib, ... }:
with lib;
let cfg = config.programs.plasma;
in {
  options.programs.plasma.fielding = { 
    "General" = with types; mkOption {
      type = submodule {
        options = { 
          Method = mkOption {
            type = nullOr (either str (enum [ 
              "Get"
              "Post"
              "Put"
              "Patch"
              "Delete"
            ]));
            default = "Get";
            description = ''
              The last HTTP method used.

              Type: Enum
              Choices: 
                - Get
                - Post
                - Put
                - Patch
                - Delete
            '';
          };
        };
      };
      default = {};
      description = "General";
    };    
  };
  config = mkIf cfg.enable {
    programs.plasma.files."fieldingrc" = cfg.fielding;
  };
}
