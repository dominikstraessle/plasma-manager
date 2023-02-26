{ config, lib, ... }:
with lib;
let
  cfg = config.programs.plasma;
  moduleCfg = config.programs.plasma.libksysguard;
in {
  options.programs.plasma.libksysguard = {
    enable = mkEnableOption ''
      Enable libksysguard
    '';
    package = mkOption {
      default = if (pkgs ? libksysguard) then
                        pkgs.libksysguard
                      else
                        (if pkgs.libsForQt5 ? libksysguard then pkgs.libsForQt5.libksysguard else false);
      defaultText = literalExpression "pkgs.libksysguard";
      type = with types; either bool package;
      description = mdDoc "Package to use.";
    };
    "General" = with types; mkOption {
      type = submodule {
        options = { 
          barChartStacked = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          columnCount = mkOption {
            type = nullOr (either str int);
            default = 0;
            description = ''
              

              Type: Int
            '';
          };
          faceId = mkOption {
            type = nullOr str;
            default = "org.kde.ksysguard.linechart";
            description = ''
              

              Type: String
            '';
          };
          fromAngle = mkOption {
            type = nullOr (either str int);
            default = -180;
            description = ''
              

              Type: Int
            '';
          };
          groupByTotal = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          historyAmount = mkOption {
            type = nullOr (either str int);
            default = 60;
            description = ''
              

              Type: Int
            '';
          };
          lineChartFillOpacity = mkOption {
            type = nullOr (either str int);
            default = 10;
            description = ''
              

              Type: Int
            '';
          };
          lineChartSmooth = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          lineChartStacked = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          rangeAuto = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          rangeAutoX = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          rangeAutoY = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          rangeFrom = mkOption {
            type = nullOr (either str float);
            default = 0.0;
            description = ''
              

              Type: Double
            '';
          };
          rangeFromMultiplier = mkOption {
            type = nullOr (either str float);
            default = 1.0;
            description = ''
              

              Type: Double
            '';
          };
          rangeFromUnit = mkOption {
            type = nullOr (either str int);
            default = -1;
            description = ''
              

              Type: Int
            '';
          };
          rangeFromX = mkOption {
            type = nullOr (either str int);
            default = 0;
            description = ''
              

              Type: Int
            '';
          };
          rangeFromY = mkOption {
            type = nullOr (either str float);
            default = 0.0;
            description = ''
              

              Type: Double
            '';
          };
          rangeFromYMultiplier = mkOption {
            type = nullOr (either str float);
            default = 1.0;
            description = ''
              

              Type: Double
            '';
          };
          rangeFromYUnit = mkOption {
            type = nullOr (either str int);
            default = -1;
            description = ''
              

              Type: Int
            '';
          };
          rangeTo = mkOption {
            type = nullOr (either str float);
            default = 100.0;
            description = ''
              

              Type: Double
            '';
          };
          rangeToMultiplier = mkOption {
            type = nullOr (either str float);
            default = 1.0;
            description = ''
              

              Type: Double
            '';
          };
          rangeToUnit = mkOption {
            type = nullOr (either str int);
            default = -1;
            description = ''
              

              Type: Int
            '';
          };
          rangeToX = mkOption {
            type = nullOr (either str int);
            default = 50;
            description = ''
              

              Type: Int
            '';
          };
          rangeToY = mkOption {
            type = nullOr (either str float);
            default = 100.0;
            description = ''
              

              Type: Double
            '';
          };
          rangeToYMultiplier = mkOption {
            type = nullOr (either str float);
            default = 1.0;
            description = ''
              

              Type: Double
            '';
          };
          rangeToYUnit = mkOption {
            type = nullOr (either str int);
            default = -1;
            description = ''
              

              Type: Int
            '';
          };
          showGridLines = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          showLegend = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          showYAxisLabels = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          smoothEnds = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          toAngle = mkOption {
            type = nullOr (either str int);
            default = 180;
            description = ''
              

              Type: Int
            '';
          };
          useSensorColor = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
        };
      };
      default = {};
      description = "General";
    };    
  };
  config = mkIf (cfg.enable && moduleCfg.enable) {
    home.packages = mkIf moduleCfg.package [ moduleCfg.package ];
    programs.plasma.files."libksysguardrc" = removeAttrs moduleCfg [ "enable" "package" ];
  };
}
