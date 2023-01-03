{ config, lib, ... }:
with lib;
let cfg = config.programs.plasma;
in {
  options.programs.plasma.kweather = { 
    "General" = with types; mkOption {
      type = submodule {
        options = { 
          firstStartup = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              First Startup

              Type: Bool
            '';
          };
          forecastStyle = mkOption {
            type = nullOr str;
            default = "Dynamic";
            description = ''
              Forecast Style

              Type: String
            '';
          };
          precipitationUnits = mkOption {
            type = nullOr str;
            default = "mm";
            description = ''
              Precipitation Unit

              Type: String
            '';
          };
          pressureUnits = mkOption {
            type = nullOr str;
            default = "hPa";
            description = ''
              Pressure Unit

              Type: String
            '';
          };
          speedUnits = mkOption {
            type = nullOr str;
            default = "kph";
            description = ''
              Speed Unit

              Type: String
            '';
          };
          temperatureUnits = mkOption {
            type = nullOr str;
            default = "Use System Default";
            description = ''
              Temperature Unit

              Type: String
            '';
          };
        };
      };
      default = {};
      description = "General";
    };    
    "WeatherLocations" = with types; mkOption {
      type = submodule {
        options = { 
        };
      };
      default = {};
      description = "WeatherLocations";
    };    
  };
  config = mkIf cfg.enable {
    programs.plasma.files."kweather/kweatherrc" = cfg.kweather;
  };
}
