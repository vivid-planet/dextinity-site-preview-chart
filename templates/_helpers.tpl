{{/*
Expand the name of the chart.
*/}}
{{- define "dextinity-site-preview.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "dextinity-site-preview.fullname" -}}
  {{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
  {{- else }}
    {{- $name := default .Chart.Name .Values.nameOverride }}
    {{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
    {{- else }}
      {{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
    {{- end }}
  {{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "dextinity-site-preview.chart" -}}
  {{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "dextinity-site-preview.labels" -}}
helm.sh/chart: {{ include "dextinity-site-preview.chart" . }}
{{ include "dextinity-site-preview.selectorLabels" . }}
  {{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
  {{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "dextinity-site-preview.selectorLabels" -}}
app: {{ include "dextinity-site-preview.fullname" . }}
app.kubernetes.io/name: {{ include "dextinity-site-preview.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Prelogin Common labels
*/}}
{{- define "dextinity-site-preview.prelogin.labels" -}}
helm.sh/chart: {{ include "dextinity-site-preview.chart" . }}
{{ include "dextinity-site-preview.prelogin.selectorLabels" . }}
  {{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
  {{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Prelogin Selector labels
*/}}
{{- define "dextinity-site-preview.prelogin.selectorLabels" -}}
app: {{ include "dextinity-site-preview.fullname" . }}-prelogin
app.kubernetes.io/name: {{ include "dextinity-site-preview.name" . }}-prelogin
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
