{ config, lib, ... }:
with lib;
let cfg = config.programs.plasma;
in {
  options.programs.plasma.haruna = { 
  };
  config = mkIf cfg.enable {
    programs.plasma.files."haruna/haruna.conf" = cfg.haruna;
  };
}
