{ config, lib, ... }:
with lib;
let cfg = config.programs.plasma;
in {
  options.programs.plasma.kstars = { 
  };
  config = mkIf cfg.enable {
    programs.plasma.files."kstarsrc" = cfg.kstars;
  };
}
