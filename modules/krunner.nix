{ config, lib, ... }:
with lib;
let cfg = config.programs.plasma;
in {
  options.programs.plasma.krunner = { 
  };
  config = mkIf cfg.enable {
    programs.plasma.files."krunnerrc" = cfg.krunner;
  };
}
