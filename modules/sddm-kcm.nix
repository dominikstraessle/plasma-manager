{ config, lib, pkgs, ... }:
with lib;
let
  cfg = config.programs.plasma;
  moduleCfg = config.programs.plasma.sddm-kcm;
in {
  options.programs.plasma.sddm-kcm = {
    enable = mkEnableOption ''
      Enable sddm-kcm
    '';
    package = mkOption {
      default = if (pkgs ? sddm-kcm) then
                        pkgs.sddm-kcm
                      else
                        (if pkgs.libsForQt5 ? sddm-kcm then pkgs.libsForQt5.sddm-kcm else false);
      defaultText = literalExpression "pkgs.sddm-kcm";
      type = with types; either bool package;
      description = mdDoc "Package to use.";
    };
    "Autologin" = with types; mkOption {
      type = submodule {
        options = { 
          Relogin = mkOption {
            type = nullOr (either str bool);
            default = null;
            defaultText = "Code: true";
            description = ''
              

              Type: Bool
            '';
          };
          Session = mkOption {
            type = nullOr str;
            default = null;
            defaultText = "Code: true";
            description = ''
              

              Type: String
            '';
          };
          User = mkOption {
            type = nullOr str;
            default = null;
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
            default = null;
            defaultText = "Code: true";
            description = ''
              

              Type: String
            '';
          };
          RebootCommand = mkOption {
            type = nullOr str;
            default = null;
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
            default = null;
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
            default = null;
            defaultText = "Code: true";
            description = ''
              

              Type: UInt
            '';
          };
          MinimumUid = mkOption {
            type = nullOr (either str int);
            default = null;
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
  config = mkIf (cfg.enable && moduleCfg.enable) {
    home.packages = mkIf (moduleCfg.package != false) [ moduleCfg.package ];
    programs.plasma.files."sddm-kcmrc" = removeAttrs moduleCfg [ "enable" "package" ];
  };
}
