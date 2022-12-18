{ config, lib, ... }:
with lib;
let cfg = config.programs.plasma;
in {
  options.programs.plasma.spectacle = { 
  };
  config = mkIf cfg.enable {
    programs.plasma.files."spectaclerc" = cfg.spectacle;
  };
}
