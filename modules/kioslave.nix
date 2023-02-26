{ config, lib, pkgs, ... }:
with lib;
let
  cfg = config.programs.plasma;
  moduleCfg = config.programs.plasma.kioslave;
in {
  options.programs.plasma.kioslave = {
    enable = mkEnableOption ''
      Enable kioslave
    '';
    package = mkOption {
      default = if (pkgs ? kioslave) then
                        pkgs.kioslave
                      else
                        (if pkgs.libsForQt5 ? kioslave then pkgs.libsForQt5.kioslave else false);
      defaultText = literalExpression "pkgs.kioslave";
      type = with types; either bool package;
      description = mdDoc "Package to use.";
    };
    "General" = with types; mkOption {
      type = submodule {
        options = { 
          ConnectTimeout = mkOption {
            type = nullOr (either str int);
            default = 20;
            description = ''
              

              Type: UInt
              Min: 2
              Max: 3600
            '';
          };
          PersistentProxyConnection = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          ProxyConnectTimeout = mkOption {
            type = nullOr (either str int);
            default = 10;
            description = ''
              

              Type: UInt
              Min: 2
              Max: 3600
            '';
          };
          ReadTimeout = mkOption {
            type = nullOr (either str int);
            default = 15;
            description = ''
              

              Type: UInt
              Min: 2
              Max: 3600
            '';
          };
          ResponseTimeout = mkOption {
            type = nullOr (either str int);
            default = 600;
            description = ''
              

              Type: UInt
              Min: 2
              Max: 3600
            '';
          };
        };
      };
      default = {};
      description = "General";
    };    
    "Global Options" = with types; mkOption {
      type = submodule {
        options = { 
          MarkPartial = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Mark partially uploaded files

              Type: Bool
            '';
          };
        };
      };
      default = {};
      description = "Global Options";
    };    
    "Proxy Settings" = with types; mkOption {
      type = submodule {
        options = { 
          AuthMode = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              

              Type: String
            '';
          };
          ReversedException = mkOption {
            type = nullOr (either str bool);
            default = "";
            description = ''
              

              Type: Bool
            '';
          };
          ftpProxy = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              

              Type: String
            '';
          };
          httpProxy = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              

              Type: String
            '';
          };
          httpsProxy = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              

              Type: String
            '';
          };
        };
      };
      default = {};
      description = "Proxy Settings";
    };    
  };
  config = mkIf (cfg.enable && moduleCfg.enable) {
    home.packages = mkIf (moduleCfg.package != false) [ moduleCfg.package ];
    programs.plasma.files."kioslaverc" = removeAttrs moduleCfg [ "enable" "package" ];
  };
}
