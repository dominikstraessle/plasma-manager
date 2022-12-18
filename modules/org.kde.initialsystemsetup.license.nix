{ config, lib, ... }:
with lib;
let cfg = config.programs.plasma;
in {
  options.programs.plasma.org_kde_initialsystemsetup_license = { 
    "General" = with types; mkOption {
      type = submodule {
        options = { 
          Format = mkOption {
            type = nullOr (either str (enum [ 
              "PlainText"
              "Markdown"
              "HTML"
            ]));
            default = "PlainText";
            description = ''
              
				This tells KISS what format the license file is in, which will affect rendering.
			

              Type: Enum
              Choices: 
                - PlainText
                - Markdown
                - HTML
            '';
          };
          LicenseTextFile = mkOption {
            type = nullOr (either str str);
            default = "/dev/null";
            description = ''
              
				This tells KISS which file contains the license text to display.
			

              Type: String
            '';
          };
        };
      };
      default = {};
      description = "General";
    };    
  };
  config = mkIf cfg.enable {
    programs.plasma.files."org_kde_initialsystemsetup_licenserc" = cfg.org_kde_initialsystemsetup_license;
  };
}
