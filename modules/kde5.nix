{ config, lib, ... }:
with lib;
let
  cfg = config.programs.plasma;
  moduleCfg = config.programs.plasma.kde5;
in {
  options.programs.plasma.kde5 = {
    enable = mkEnableOption ''
      Enable kde5
    '';
    package = mkOption {
      default = if (pkgs ? kde5) then
                        pkgs.kde5
                      else
                        (if pkgs.libsForQt5 ? kde5 then pkgs.libsForQt5.kde5 else false);
      defaultText = literalExpression "pkgs.kde5";
      type = either bool types.package;
      description = mdDoc "Package to use.";
    };
  };
  config = mkIf (cfg.enable && moduleCfg.enable) {
    home.packages = mkIf moduleCfg.package [ moduleCfg.package ];
    programs.plasma.files."kde5rc" = removeAttrs moduleCfg [ "enable" "package" ];
  };
}
