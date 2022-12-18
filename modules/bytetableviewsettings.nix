{ config, lib, ... }:
with lib;
let cfg = config.programs.plasma;
in {
  options.programs.plasma.bytetableviewsettings = { 
  };
  config = mkIf cfg.enable {
    programs.plasma.files."bytetableviewsettingsrc" = cfg.bytetableviewsettings;
  };
}
