{ config, lib, ... }:
with lib;
let cfg = config.programs.plasma;
in {
  options.programs.plasma.akregator = { 
  };
  config = mkIf cfg.enable {
    programs.plasma.files."akregatorrc" = cfg.akregator;
  };
}
