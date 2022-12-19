{ ... }:
{
  programs.plasma = {
    enable = true;
{{range .}}
    {{ .Name }} = { {{range .Groups}}
      "{{ .Name }}" = { {{range .Options }}
        "{{ .Name }}" = {{ .GetValue }};{{end}}
      };{{end}}
    };{{end}}
  };
}
