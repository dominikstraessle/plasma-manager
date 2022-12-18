{ config, lib, ... }:
with lib;
let cfg = config.programs.plasma;
in {
  options.programs.plasma.ksmserver = { 
  };
  config = mkIf cfg.enable {
    programs.plasma.files."ksmserverrc" = cfg.ksmserver;
  };
}
