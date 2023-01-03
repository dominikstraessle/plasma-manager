{ config, lib, ... }:
with lib;
let cfg = config.programs.plasma;
in {
  options.programs.plasma.sddm-kcm = { 
    "Autologin" = with types; mkOption {
      type = submodule {
        options = { 
          Relogin = mkOption {
            type = nullOr (either str bool);
            default = "defaultRelogin()";
            defaultText = "Code: true";
            description = ''
              

              Type: Bool
            '';
          };
          Session = mkOption {
            type = nullOr str;
            default = "defaultSession()";
            defaultText = "Code: true";
            description = ''
              

              Type: String
            '';
          };
          User = mkOption {
            type = nullOr str;
            default = "defaultUser()";
            defaultText = "Code: true";
            description = ''
              

              Type: String
            '';
          };
        };
      };
      default = {};
      description = "Autologin";
    };    
    "General" = with types; mkOption {
      type = submodule {
        options = { 
          HaltCommand = mkOption {
            type = nullOr str;
            default = "defaultHaltCommand()";
            defaultText = "Code: true";
            description = ''
              

              Type: String
            '';
          };
          RebootCommand = mkOption {
            type = nullOr str;
            default = "defaultRebootCommand()";
            defaultText = "Code: true";
            description = ''
              

              Type: String
            '';
          };
        };
      };
      default = {};
      description = "General";
    };    
    "Theme" = with types; mkOption {
      type = submodule {
        options = { 
          Current = mkOption {
            type = nullOr str;
            default = "defaultCurrent()";
            defaultText = "Code: true";
            description = ''
              

              Type: String
            '';
          };
        };
      };
      default = {};
      description = "Theme";
    };    
    "Users" = with types; mkOption {
      type = submodule {
        options = { 
          MaximumUid = mkOption {
            type = nullOr (either str int);
            default = "defaultMaximumUid()";
            defaultText = "Code: true";
            description = ''
              

              Type: UInt
            '';
          };
          MinimumUid = mkOption {
            type = nullOr (either str int);
            default = "defaultMinimumUid()";
            defaultText = "Code: true";
            description = ''
              

              Type: UInt
            '';
          };
        };
      };
      default = {};
      description = "Users";
    };    
  };
  config = mkIf cfg.enable {
    programs.plasma.files."sddm-kcmrc" = cfg.sddm-kcm;
  };
}
