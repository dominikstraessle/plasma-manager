{ config, lib, ... }:
with lib;
let
  cfg = config.programs.plasma;
  moduleCfg = config.programs.plasma.{{ .Name }};
in {
  options.programs.plasma.{{ .Name }} = {
    enable = mkEnableOption ''
      Enable {{ .Name }}
    '';
    package = mkOption {
      default = if (pkgs ? {{ .Name }}) then
                        pkgs.{{ .Name }}
                      else
                        (if pkgs.libsForQt5 ? {{ .Name }} then pkgs.libsForQt5.{{ .Name }} else false);
      defaultText = literalExpression "pkgs.{{ .Name }}";
      type = with types; either bool package;
      description = mdDoc "Package to use.";
    };{{ range .Groups }}
    "{{ .Name }}" = with types; mkOption {
      type = submodule {
        options = { {{ range .Options }}
          {{if .HasKey }}{{ .Key }}{{else}}{{ .Name }}{{end}} = mkOption {
            type = nullOr {{ .TypeValue }};
            default = {{ .DefaultValue }};{{if .IsDefaultCode }}
            defaultText = "Code: true";{{end}}
            description = ''
              {{ .Label }}

              Type: {{ .Type }}{{if .HasMin }}
              Min: {{ .Min }}{{end}}{{if .HasMax }}
              Max: {{ .Max }}{{end}}{{if .IsCode }}
              Code: {{ .Code }}{{end}}{{if .HasChoices}}
              Choices: {{ range .Choices }}
                - {{ .Name }}{{if .HasLabel }}: {{ .Label }}{{end}}{{end}}{{end}}
            '';
          };{{ end }}
        };
      };
      default = {};
      description = "{{ .Name }}";
    };    {{ end }}
  };
  config = mkIf (cfg.enable && moduleCfg.enable) {
    home.packages = mkIf moduleCfg.package [ moduleCfg.package ];
    programs.plasma.files."{{ .RCName }}" = removeAttrs moduleCfg [ "enable" "package" ];
  };
}
