{ config, lib, ... }:
with lib;
let
  cfg = config.programs.plasma;
  moduleCfg = config.programs.plasma.alligator;
in {
  options.programs.plasma.alligator = {
    enable = mkEnableOption ''
      Enable alligator
    '';
    package = mkOption {
      default = if (pkgs ? alligator) then
                        pkgs.alligator
                      else
                        (if pkgs.libsForQt5 ? alligator then pkgs.libsForQt5.alligator else false);
      defaultText = literalExpression "pkgs.alligator";
      type = either bool types.package;
      description = mdDoc "Package to use.";
    };
    "General" = with types; mkOption {
      type = submodule {
        options = { 
          articleFontSize = mkOption {
            type = nullOr (either str int);
            default = 10;
            description = ''
              Article font size

              Type: Int
            '';
          };
          articleFontUseSystem = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Use default system font

              Type: Bool
            '';
          };
          deleteAfterCount = mkOption {
            type = nullOr (either str int);
            default = 2;
            description = ''
              Delete after count

              Type: Int
            '';
          };
          deleteAfterType = mkOption {
            type = nullOr (either str int);
            default = 3;
            description = ''
              Delete after type

              Type: Int
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
    programs.plasma.files."alligatorrc" = removeAttrs moduleCfg [ "enable" "package" ];
  };
}
