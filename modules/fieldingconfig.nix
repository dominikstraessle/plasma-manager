{ config, lib, ... }:
with lib;
let cfg = config.programs.plasma;
in {
  options.programs.plasma.fieldingconfig = { 
  };
  config = mkIf cfg.enable {
    programs.plasma.files."fieldingconfigrc" = cfg.fieldingconfig;
  };
}
