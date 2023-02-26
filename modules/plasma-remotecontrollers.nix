{ config, lib, ... }:
with lib;
let
  cfg = config.programs.plasma;
  moduleCfg = config.programs.plasma.plasma-remotecontrollers;
in {
  options.programs.plasma.plasma-remotecontrollers = {
    enable = mkEnableOption ''
      Enable plasma-remotecontrollers
    '';
    package = mkOption {
      default = if (pkgs ? plasma-remotecontrollers) then
                        pkgs.plasma-remotecontrollers
                      else
                        (if pkgs.libsForQt5 ? plasma-remotecontrollers then pkgs.libsForQt5.plasma-remotecontrollers else false);
      defaultText = literalExpression "pkgs.plasma-remotecontrollers";
      type = either bool types.package;
      description = mdDoc "Package to use.";
    };
    "Inhibit" = with types; mkOption {
      type = submodule {
        options = { 
          Applications = mkOption {
            type = nullOr (either str (listOf str));
            default = "kodi.desktop,xonotic-sdl.desktop,steam_app_*";
            description = ''
              

              Type: StringList
            '';
          };
        };
      };
      default = {};
      description = "Inhibit";
    };    
  };
  config = mkIf (cfg.enable && moduleCfg.enable) {
    home.packages = mkIf moduleCfg.package [ moduleCfg.package ];
    programs.plasma.files."plasma-remotecontrollersrc" = removeAttrs moduleCfg [ "enable" "package" ];
  };
}
