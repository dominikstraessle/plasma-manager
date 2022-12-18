{ config, lib, ... }:
with lib;
let cfg = config.programs.plasma;
in {
  options.programs.plasma.kwin = {
    "KDE" = with types;
      mkOption {
        type = submodule {
          options = {
            AnimationDurationFactor = mkOption {
              type = nullOr (either str float);
              default = 1.0;
              description = ''


                Type: Double
              '';
            };
          };
        };
        default = { };
        description = "KDE";
      };
    "Compositing" = with types;
      mkOption {
        type = submodule {
          options = {
            HiddenPreviews = mkOption {
              type = nullOr (either str (enum [ "Off" "Shown" "Always" ]));
              default = "Shown";
              description = ''


                Type: Enum
                Choices: 
                  - Off
                  - Shown
                  - Always
              '';
            };
            Enabled = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''


                Type: Bool
              '';
            };
            LastFailureTimestamp = mkOption {
              type = nullOr (either str int);
              default = 0;
              description = ''


                Type: Int
              '';
            };
            WindowsBlockCompositing = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''


                Type: Bool
              '';
            };
            LatencyPolicy = mkOption {
              type = nullOr (either str (enum [
                "LatencyExtremelyLow"
                "LatencyLow"
                "LatencyMedium"
                "LatencyHigh"
                "LatencyExtremelyHigh"
              ]));
              default = "LatencyMedium";
              description = ''


                Type: Enum
                Choices: 
                  - LatencyExtremelyLow
                  - LatencyLow
                  - LatencyMedium
                  - LatencyHigh
                  - LatencyExtremelyHigh
              '';
            };
            AllowTearing = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''


                Type: Bool
              '';
            };
          };
        };
        default = { };
        description = "Compositing";
      };
  };
  config = mkIf cfg.enable { programs.plasma.files."kwinrc" = cfg.kwin; };
}
