{ config, lib, ... }:
with lib;
let cfg = config.programs.plasma;
in {
  options.programs.plasma.gravatar = { 
    "Gravatar" = with types; mkOption {
      type = submodule {
        options = { 
          FallbackToGravatar = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          GravatarCacheSize = mkOption {
            type = nullOr (either str int);
            default = 20;
            description = ''
              

              Type: Int
            '';
          };
          GravatarSupportEnabled = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          GravatarUseDefaultImage = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          LibravatarSupportEnabled = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
        };
      };
      default = {};
      description = "Gravatar";
    };    
  };
  config = mkIf cfg.enable {
    programs.plasma.files."gravatarrc" = cfg.gravatar;
  };
}
