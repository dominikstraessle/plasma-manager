{ config, lib, ... }:
with lib;
let cfg = config.programs.plasma;
in {
  options.programs.plasma.kde5 = { };
  config = mkIf cfg.enable { programs.plasma.files."kde5rc" = cfg.kde5; };
}
