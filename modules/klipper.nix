{ config, lib, ... }:
with lib;
let cfg = config.programs.plasma;
in {
  options.programs.plasma.klipper = { 
  };
  config = mkIf cfg.enable {
    programs.plasma.files."klipperrc" = cfg.klipper;
  };
}
