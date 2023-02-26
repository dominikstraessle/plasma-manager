{ config, lib, pkgs, ... }:
with lib;
let
  cfg = config.programs.plasma;
  moduleCfg = config.programs.plasma.libksieve;
in {
  options.programs.plasma.libksieve = {
    enable = mkEnableOption ''
      Enable libksieve
    '';
    package = mkOption {
      default = if (pkgs ? libksieve) then
                        pkgs.libksieve
                      else
                        (if pkgs.libsForQt5 ? libksieve then pkgs.libsForQt5.libksieve else false);
      defaultText = literalExpression "pkgs.libksieve";
      type = with types; either bool package;
      description = mdDoc "Package to use.";
    };
    "General" = with types; mkOption {
      type = submodule {
        options = { 
          UseGraphicEditorByDefault = mkOption {
            type = nullOr (either str bool);
            default = null;
            description = ''
              Use graphical editor by default to edit sieve script.

              Type: Bool
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
    programs.plasma.files."libksieverc" = removeAttrs moduleCfg [ "enable" "package" ];
  };
}
