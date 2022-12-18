{ config, lib, ... }:
with lib;
let cfg = config.programs.plasma;
in {
  options.programs.plasma.konsole = { 
  };
  config = mkIf cfg.enable {
    programs.plasma.files."konsolerc" = cfg.konsole;
  };
}
