{ config, lib, ... }:
with lib;
let cfg = config.programs.plasma;
in {
  options.programs.plasma.qmlkonsole = { 
    "General" = with types; mkOption {
      type = submodule {
        options = { 
          "colorScheme" = mkOption {
            type = nullOr ""cool-retro-term"";
            default = ""cool-retro-term"";
            description = ''
              

              Type: string
            '';
          };
          "fontFamily" = mkOption {
            type = nullOr ""Monospace"";
            default = ""Monospace"";
            description = ''
              

              Type: string
            '';
          };
          "fontSize" = mkOption {
            type = nullOr "12";
            default = "12";
            description = ''
              

              Type: int
            '';
          };
          "windowOpacity" = mkOption {
            type = nullOr "1";
            default = "1";
            description = ''
              

              Type: double
            '';
          };
          "actions" = mkOption {
            type = nullOr (either str (listOf str));
            default = "";
            description = ''
              

              Type: StringList
            '';
          };
          "blurWindow" = mkOption {
            type = nullOr "false";
            default = "false";
            description = ''
              

              Type: bool
            '';
          };
        };
      };
      default = {};
      description = "General";
    };    
  };
  config = mkIf cfg.enable {
    programs.plasma.files."qmlkonsolerc" = cfg.qmlkonsole;
  };
}
