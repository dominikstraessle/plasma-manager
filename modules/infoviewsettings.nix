{ config, lib, ... }:
with lib;
let cfg = config.programs.plasma;
in {
  options.programs.plasma.infoviewsettings = { 
  };
  config = mkIf cfg.enable {
    programs.plasma.files."infoviewsettingsrc" = cfg.infoviewsettings;
  };
}
