{ config, lib, ... }:
with lib;
let cfg = config.programs.plasma;
in {
  options.programs.plasma.kalendarcontact = { 
  };
  config = mkIf cfg.enable {
    programs.plasma.files."kalendarcontactrc" = cfg.kalendarcontact;
  };
}
