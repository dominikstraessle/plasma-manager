{ config, lib, ... }:
with lib;
let cfg = config.programs.plasma;
in {
  options.programs.plasma.config = { 
  };
  config = mkIf cfg.enable {
    programs.plasma.files."configrc" = cfg.config;
  };
}
