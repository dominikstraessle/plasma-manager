{ config, lib, ... }:
with lib;
let cfg = config.programs.plasma;
in {
  options.programs.plasma.kalendar = { 
  };
  config = mkIf cfg.enable {
    programs.plasma.files."kalendarrc" = cfg.kalendar;
  };
}
