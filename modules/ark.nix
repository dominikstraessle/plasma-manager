{ config, lib, ... }:
with lib;
let cfg = config.programs.plasma;
in {
  options.programs.plasma.ark = { 
  };
  config = mkIf cfg.enable {
    programs.plasma.files."arkrc" = cfg.ark;
  };
}
