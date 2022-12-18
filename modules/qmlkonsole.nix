{ config, lib, ... }:
with lib;
let cfg = config.programs.plasma;
in {
  options.programs.plasma.qmlkonsole = { 
  };
  config = mkIf cfg.enable {
    programs.plasma.files."qmlkonsolerc" = cfg.qmlkonsole;
  };
}
