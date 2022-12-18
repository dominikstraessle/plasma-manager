{ config, lib, ... }:
with lib;
let cfg = config.programs.plasma;
in {
  options.programs.plasma.kspread = { 
  };
  config = mkIf cfg.enable {
    programs.plasma.files."kspreadrc" = cfg.kspread;
  };
}
