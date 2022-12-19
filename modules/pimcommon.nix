{ config, lib, ... }:
with lib;
let cfg = config.programs.plasma;
in {
  options.programs.plasma.pimcommon = {
    "Autocorrect" = with types;
      mkOption {
        type = submodule {
          options = {
            "add-non-breaking-space" = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''


                Type: Bool
              '';
            };
            "advanced-autocorrect" = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''


                Type: Bool
              '';
            };
            "auto-bold-underline" = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''


                Type: Bool
              '';
            };
            "auto-fractions" = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''


                Type: Bool
              '';
            };
            "autoformat-url" = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''


                Type: Bool
              '';
            };
            "capitalize-week-days" = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''


                Type: Bool
              '';
            };
            "custom-system-path" = mkOption {
              type = nullOr str;
              default = "";
              description = ''


                Type: String
              '';
            };
            "custom-writable-path" = mkOption {
              type = nullOr str;
              default = "";
              description = ''


                Type: String
              '';
            };
            "enabled" = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''


                Type: Bool
              '';
            };
            "fix-two-upper-case-chars" = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''


                Type: Bool
              '';
            };
            "replace-double-quotes" = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''


                Type: Bool
              '';
            };
            "replace-double-quotes-by-french-quotes" = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''


                Type: Bool
              '';
            };
            "replace-single-quotes" = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''


                Type: Bool
              '';
            };
            "single-spaces" = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''


                Type: Bool
              '';
            };
            "super-script" = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''


                Type: Bool
              '';
            };
            "typographic-double-quotes" = mkOption {
              type = nullOr str;
              default = "";
              description = ''


                Type: String
              '';
            };
            "typographic-single-quotes" = mkOption {
              type = nullOr str;
              default = "";
              description = ''


                Type: String
              '';
            };
            "upper-case-first-char-of-sentence" = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''


                Type: Bool
              '';
            };
          };
        };
        default = { };
        description = "Autocorrect";
      };
  };
  config =
    mkIf cfg.enable { programs.plasma.files."pimcommonrc" = cfg.pimcommon; };
}
