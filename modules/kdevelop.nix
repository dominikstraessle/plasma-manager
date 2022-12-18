{ config, lib, ... }:
with lib;
let cfg = config.programs.plasma;
in {
  options.programs.plasma.kdevelop = { 
  };
  config = mkIf cfg.enable {
    programs.plasma.files."kdeveloprc" = cfg.kdevelop;
  };
}
