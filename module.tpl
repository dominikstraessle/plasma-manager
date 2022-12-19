{ config, lib, ... }:
with lib;
let cfg = config.programs.plasma;
in {
  options.programs.plasma.{{ .Name }} = { {{ range .Groups }}
    "{{ .Name }}" = with types; mkOption {
      type = submodule {
        options = { {{ range .Options }}
          {{if .HasKey }}"{{ .Key }}"{{else}}{{ .Name }}{{end}} = mkOption {
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
  config = mkIf cfg.enable {
    programs.plasma.files."{{ .RCName }}" = cfg.{{ .Name }};
  };
}
