{{- define "menero-helm-chart.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{- define "menero-helm-chart.fullname" -}}
{{- .Release.Name }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "menero-helm-chart.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "menero-helm-chart.labels" -}}
helm.sh/chart: {{ include "menero-helm-chart.chart" . }}
{{ include "menero-helm-chart.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "menero-helm-chart.selectorLabels" -}}
app.kubernetes.io/name: {{ include "menero-helm-chart.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
