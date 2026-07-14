{{- define "easyshop.name" -}}
easyshop
{{- end }}

{{- define "easyshop.fullname" -}}
{{ include "easyshop.name" . }}
{{- end }}

{{- define "easyshop.labels" -}}
app.kubernetes.io/name: {{ include "easyshop.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion }}
app.kubernetes.io/managed-by: Helm
{{- end }}
