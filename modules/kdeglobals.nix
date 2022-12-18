{ config, lib, ... }:
with lib;
let cfg = config.programs.plasma;
in {
  options.programs.plasma.kdeglobals = { 
  };
  config = mkIf cfg.enable {
    programs.plasma.files."kdeglobals" = cfg.kdeglobals;
  };
}
