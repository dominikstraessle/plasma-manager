{ config, lib, ... }:
with lib;
let cfg = config.programs.plasma;
in {
  options.programs.plasma.plasmacamera = { 
  };
  config = mkIf cfg.enable {
    programs.plasma.files."plasmacamerarc" = cfg.plasmacamera;
  };
}
