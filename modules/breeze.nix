{ config, lib, ... }:
with lib;
let cfg = config.programs.plasma;
in {
  options.programs.plasma.breeze = { 
  };
  config = mkIf cfg.enable {
    programs.plasma.files."breezerc" = cfg.breeze;
  };
}
