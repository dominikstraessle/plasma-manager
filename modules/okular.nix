{ config, lib, ... }:
with lib;
let cfg = config.programs.plasma;
in {
  options.programs.plasma.okular = { 
  };
  config = mkIf cfg.enable {
    programs.plasma.files."okularrc" = cfg.okular;
  };
}
