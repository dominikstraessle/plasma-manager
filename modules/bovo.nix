{ config, lib, ... }:
with lib;
let
  cfg = config.programs.plasma;
  moduleCfg = config.programs.plasma.bovo;
in {
  options.programs.plasma.bovo = {
    enable = mkEnableOption ''
      Enable bovo
    '';
    package = mkOption {
      default = if (pkgs ? bovo) then
                        pkgs.bovo
                      else
                        (if pkgs.libsForQt5 ? bovo then pkgs.libsForQt5.bovo else false);
      defaultText = literalExpression "pkgs.bovo";
      type = with types; either bool package;
      description = mdDoc "Package to use.";
    };
    "bovo" = with types; mkOption {
      type = submodule {
        options = { 
          ai = mkOption {
            type = nullOr (either str (enum [ 
              "Gabor"
              "Aron"
            ]));
            default = "Gabor";
            description = ''
              AI engine to use.

              Type: Enum
              Choices: 
                - Gabor
                - Aron
            '';
          };
          animation = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Whether moves should be animated or not.

              Type: Bool
            '';
          };
          playbackSpeed = mkOption {
            type = nullOr (either str int);
            default = 400;
            description = ''
              Speed of demo and replay playback.

              Type: Int
              Min: 150
              Max: 2000
            '';
          };
          theme = mkOption {
            type = nullOr str;
            default = "scribble";
            description = ''
              Theme

              Type: String
            '';
          };
        };
      };
      default = {};
      description = "bovo";
    };    
  };
  config = mkIf (cfg.enable && moduleCfg.enable) {
    home.packages = mkIf moduleCfg.package [ moduleCfg.package ];
    programs.plasma.files."bovorc" = removeAttrs moduleCfg [ "enable" "package" ];
  };
}
