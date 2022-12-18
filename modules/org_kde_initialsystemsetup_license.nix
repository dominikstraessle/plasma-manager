{ config, lib, ... }:
with lib;
let cfg = config.programs.plasma;
in {
  options.programs.plasma.org_kde_initialsystemsetup_license = { 
  };
  config = mkIf cfg.enable {
    programs.plasma.files."org_kde_initialsystemsetup_licenserc" = cfg.org_kde_initialsystemsetup_license;
  };
}
