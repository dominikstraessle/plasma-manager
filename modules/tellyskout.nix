{ config, lib, ... }:
with lib;
let cfg = config.programs.plasma;
in {
  options.programs.plasma.tellyskout = { 
  };
  config = mkIf cfg.enable {
    programs.plasma.files."tellyskoutrc" = cfg.tellyskout;
  };
}
