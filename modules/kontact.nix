{ config, lib, ... }:
with lib;
let cfg = config.programs.plasma;
in {
  options.programs.plasma.kontact = { 
  };
  config = mkIf cfg.enable {
    programs.plasma.files."kontactrc" = cfg.kontact;
  };
}
