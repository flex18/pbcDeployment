{{/*
Expand the name of the chart.
*/}}
{{- define "pbcDeployment.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "pbcDeployment.fullname" -}}
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
{{- define "pbcDeployment.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/* Meta labels */}}
{{- define "pbcDeployment.metaLabels" -}}
{{ include "pbcDeployment.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
helm.sh/chart: {{ include "pbcDeployment.chart" . }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "pbcDeployment.labels" -}}
helm.sh/chart: {{ include "pbcDeployment.chart" . }}
{{ include "pbcDeployment.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "pbcDeployment.selectorLabels" -}}
app.kubernetes.io/name: {{ include "pbcDeployment.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "pbcDeployment.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "pbcDeployment.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}



{{/*tmf-account variables*/}}

{{- define "tmfaccount.name" -}}
{{- printf "%s" "tmf-account" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "tmfaccount.metaLabels" -}}
app.kubernetes.io/component: tmfaccount
{{ include "pbcDeployment.metaLabels" . }}
{{- end }}

{{/* Selector labels for tmf-account service */}}
{{- define "tmfaccount.selectorLabels" -}}
{{ include "pbcDeployment.selectorLabels" . }}
app.kubernetes.io/component: tmfaccount
app.kubernetes.io/name: {{ include "pbcDeployment.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/* Generate tmf-account pod labels */}}
{{- define "tmfaccount.podLabels" -}}
{{ include "tmfaccount.selectorLabels" . }}
{{- end }}



{{/*tmf-application variables*/}}

{{- define "tmfapplication.name" -}}
{{- printf "%s" "tmf-application" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "tmfapplication.metaLabels" -}}
app.kubernetes.io/component: tmfapplication
{{ include "pbcDeployment.metaLabels" . }}
{{- end }}

{{/* Selector labels for tmf-application service */}}
{{- define "tmfapplication.selectorLabels" -}}
{{ include "pbcDeployment.selectorLabels" . }}
app.kubernetes.io/component: tmfapplication
app.kubernetes.io/name: {{ include "pbcDeployment.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/* Generate tmf-application pod labels */}}
{{- define "tmfapplication.podLabels" -}}
{{ include "tmfapplication.selectorLabels" . }}
{{- end }}



{{/*tmf-customer variables*/}}

{{- define "tmfcustomer.name" -}}
{{- printf "%s" "tmf-customer" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "tmfcustomer.metaLabels" -}}
app.kubernetes.io/component: tmfcustomer
{{ include "pbcDeployment.metaLabels" . }}
{{- end }}

{{/* Selector labels for tmf-customer service */}}
{{- define "tmfcustomer.selectorLabels" -}}
{{ include "pbcDeployment.selectorLabels" . }}
app.kubernetes.io/component: tmfcustomer
app.kubernetes.io/name: {{ include "pbcDeployment.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/* Generate tmf-customer pod labels */}}
{{- define "tmfcustomer.podLabels" -}}
{{ include "tmfcustomer.selectorLabels" . }}
{{- end }}



{{/*tmf-device variables*/}}

{{- define "tmfdevice.name" -}}
{{- printf "%s" "tmf-device" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "tmfdevice.metaLabels" -}}
app.kubernetes.io/component: tmfdevice
{{ include "pbcDeployment.metaLabels" . }}
{{- end }}

{{/* Selector labels for tmf-device service */}}
{{- define "tmfdevice.selectorLabels" -}}
{{ include "pbcDeployment.selectorLabels" . }}
app.kubernetes.io/component: tmfdevice
app.kubernetes.io/name: {{ include "pbcDeployment.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/* Generate tmf-device pod labels */}}
{{- define "tmfdevice.podLabels" -}}
{{ include "tmfdevice.selectorLabels" . }}
{{- end }}



{{/*tmf-geographic variables*/}}

{{- define "tmfgeographic.name" -}}
{{- printf "%s" "tmf-geographic" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "tmfgeographic.metaLabels" -}}
app.kubernetes.io/component: tmfgeographic
{{ include "pbcDeployment.metaLabels" . }}
{{- end }}

{{/* Selector labels for tmf-geographic service */}}
{{- define "tmfgeographic.selectorLabels" -}}
{{ include "pbcDeployment.selectorLabels" . }}
app.kubernetes.io/component: tmfgeographic
app.kubernetes.io/name: {{ include "pbcDeployment.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/* Generate tmf-geographic pod labels */}}
{{- define "tmfgeographic.podLabels" -}}
{{ include "tmfgeographic.selectorLabels" . }}
{{- end }}



{{/*tmf-quality variables*/}}

{{- define "tmfquality.name" -}}
{{- printf "%s" "tmf-quality" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "tmfquality.metaLabels" -}}
app.kubernetes.io/component: tmfquality
{{ include "pbcDeployment.metaLabels" . }}
{{- end }}

{{/* Selector labels for tmf-quality service */}}
{{- define "tmfquality.selectorLabels" -}}
{{ include "pbcDeployment.selectorLabels" . }}
app.kubernetes.io/component: tmfquality
app.kubernetes.io/name: {{ include "pbcDeployment.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/* Generate tmf-quality pod labels */}}
{{- define "tmfquality.podLabels" -}}
{{ include "tmfquality.selectorLabels" . }}
{{- end }}


{{/*tmf-resourceinventory variables*/}}

{{- define "tmfresourceinventory.name" -}}
{{- printf "%s" "tmf-resourceinventory" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "tmfresourceinventory.metaLabels" -}}
app.kubernetes.io/component: tmfresourceinventory
{{ include "pbcDeployment.metaLabels" . }}
{{- end }}

{{/* Selector labels for tmf-resourceinventory service */}}
{{- define "tmfresourceinventory.selectorLabels" -}}
{{ include "pbcDeployment.selectorLabels" . }}
app.kubernetes.io/component: tmfresourceinventory
app.kubernetes.io/name: {{ include "pbcDeployment.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/* Generate tmf-resourceinventory pod labels */}}
{{- define "tmfresourceinventory.podLabels" -}}
{{ include "tmfresourceinventory.selectorLabels" . }}
{{- end }}



{{/*apollo-integration variables*/}}

{{- define "apollointegration.name" -}}
{{- printf "%s" "apollo-integration" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "apollointegration.metaLabels" -}}
app.kubernetes.io/component: apollointegration
{{ include "pbcDeployment.metaLabels" . }}
{{- end }}

{{/* Selector labels for apollo-integration service */}}
{{- define "apollointegration.selectorLabels" -}}
{{ include "pbcDeployment.selectorLabels" . }}
app.kubernetes.io/component: apollointegration
app.kubernetes.io/name: {{ include "pbcDeployment.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/* Generate apollo-integration pod labels */}}
{{- define "apollointegration.podLabels" -}}
{{ include "apollointegration.selectorLabels" . }}
{{- end }}



{{/*cm-mocks variables*/}}

{{- define "cmmocks.name" -}}
{{- printf "%s" "cm-mocks" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "cmmocks.metaLabels" -}}
app.kubernetes.io/component: cmmocks
{{ include "pbcDeployment.metaLabels" . }}
{{- end }}

{{/* Selector labels for cm-mocks service */}}
{{- define "cmmocks.selectorLabels" -}}
{{ include "pbcDeployment.selectorLabels" . }}
app.kubernetes.io/component: cmmocks
app.kubernetes.io/name: {{ include "pbcDeployment.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/* Generate cm-mocks pod labels */}}
{{- define "cmmocks.podLabels" -}}
{{ include "cmmocks.selectorLabels" . }}
{{- end }}



{{/*pbc-gui variables*/}}

{{- define "pbcgui.name" -}}
{{- printf "%s" "pbc-gui" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "pbcgui.metaLabels" -}}
app.kubernetes.io/component: pbcgui
{{ include "pbcDeployment.metaLabels" . }}
{{- end }}

{{/* Selector labels for pbc-gui service */}}
{{- define "pbcgui.selectorLabels" -}}
{{ include "pbcDeployment.selectorLabels" . }}
app.kubernetes.io/component: pbcgui
app.kubernetes.io/name: {{ include "pbcDeployment.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/* Generate pbc-gui pod labels */}}
{{- define "pbcgui.podLabels" -}}
{{ include "pbcgui.selectorLabels" . }}
{{- end }}