{ config, lib, ... }:
with lib;
let cfg = config.programs.plasma;
in {
  options.programs.plasma.GitKlientSettings = { 
  };
  config = mkIf cfg.enable {
    programs.plasma.files."GitKlientSettings" = cfg.GitKlientSettings;
  };
}
