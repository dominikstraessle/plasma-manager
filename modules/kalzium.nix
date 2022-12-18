{ config, lib, ... }:
with lib;
let cfg = config.programs.plasma;
in {
  options.programs.plasma.kalzium = { 
  };
  config = mkIf cfg.enable {
    programs.plasma.files."kalziumrc" = cfg.kalzium;
  };
}
