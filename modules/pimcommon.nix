{ config, lib, ... }:
with lib;
let cfg = config.programs.plasma;
in {
  options.programs.plasma.pimcommon = { 
  };
  config = mkIf cfg.enable {
    programs.plasma.files."pimcommonrc" = cfg.pimcommon;
  };
}
