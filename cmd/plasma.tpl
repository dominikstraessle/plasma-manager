{ ... }:
{
  programs.plasma = {
    enable = true;
{{range .}}
    {{ .Name }} = {
      enable = true;{{range .Groups}}
      "{{ .Name }}" = { {{range .Options }}
        "{{ .Name }}" = {{ .GetValue }};{{end}}
      };{{end}}
    };{{end}}
  };
}
