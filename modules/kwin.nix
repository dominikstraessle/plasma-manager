{ config, lib, ... }:
with lib;
let cfg = config.programs.plasma;
in {
  options.programs.plasma.kwin = { 
  };
  config = mkIf cfg.enable {
    programs.plasma.files."kwinrc" = cfg.kwin;
  };
}
