{ config, lib, ... }:
with lib;
let
  cfg = config.programs.plasma;
  moduleCfg = config.programs.plasma.fielding;
in {
  options.programs.plasma.fielding = {
    enable = mkEnableOption ''
      Enable fielding
    '';
    package = mkOption {
      default = if (pkgs ? fielding) then
                        pkgs.fielding
                      else
                        (if pkgs.libsForQt5 ? fielding then pkgs.libsForQt5.fielding else false);
      defaultText = literalExpression "pkgs.fielding";
      type = with types; either bool package;
      description = mdDoc "Package to use.";
    };
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
  config = mkIf (cfg.enable && moduleCfg.enable) {
    home.packages = mkIf moduleCfg.package [ moduleCfg.package ];
    programs.plasma.files."fieldingrc" = removeAttrs moduleCfg [ "enable" "package" ];
  };
}
