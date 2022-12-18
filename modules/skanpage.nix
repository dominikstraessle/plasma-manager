{ config, lib, ... }:
with lib;
let cfg = config.programs.plasma;
in {
  options.programs.plasma.skanpage = { 
  };
  config = mkIf cfg.enable {
    programs.plasma.files."skanpagerc" = cfg.skanpage;
  };
}
