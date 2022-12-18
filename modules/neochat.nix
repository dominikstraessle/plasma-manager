{ config, lib, ... }:
with lib;
let cfg = config.programs.plasma;
in {
  options.programs.plasma.neochat = { 
  };
  config = mkIf cfg.enable {
    programs.plasma.files."neochatrc" = cfg.neochat;
  };
}
