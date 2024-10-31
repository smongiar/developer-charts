{{/*
Create a random alphanumeric password string for webhook configuration.
*/}}
{{- define "webhook.secret" -}}
{{- "mysecret" -}}
{{- end -}}

{{/*
Retrieve git-token from rhdh-secrets
*/}}
{{- define "git.token" -}}
{{- $existingSecret := (lookup "v1" "Secret" "developer-hub" "rhdh-secrets") }}
{{- if $existingSecret }}
{{- printf "%s" (index $existingSecret.data "GIT_TOKEN") }}
{{- else }}
  {{- printf "%s" (randAlphaNum 12) }}  
{{- end -}}
{{- end -}}

{{/*
Retrieve Cluster API URL from rhdh-secrets
*/}}
{{- define "cluster.url" -}}
{{- $existingSecret := (lookup "v1" "Secret" "developer-hub" "rhdh-secrets") }}
{{- if $existingSecret }}
{{- printf "%s" (index $existingSecret.data "K8S_CLUSTER_URL") }}
{{- else }}
  {{- printf "%s" (randAlphaNum 12) }}  
{{- end -}}
{{- end -}}