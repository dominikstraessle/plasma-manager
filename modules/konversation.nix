{ config, lib, ... }:
with lib;
let cfg = config.programs.plasma;
in {
  options.programs.plasma.konversation = { 
  };
  config = mkIf cfg.enable {
    programs.plasma.files."konversationrc" = cfg.konversation;
  };
}
