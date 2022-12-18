{ config, lib, ... }:
with lib;
let cfg = config.programs.plasma;
in {
  options.programs.plasma.kded_device_automounter = { 
  };
  config = mkIf cfg.enable {
    programs.plasma.files."kded_device_automounterrc" = cfg.kded_device_automounter;
  };
}
