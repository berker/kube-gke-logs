#compdef kube-gke-logs
local line

_arguments -C \
    '1: :($(kubectl get pods -o=jsonpath='"'"'{range .items[*].metadata.name}{@}{"\n"}{end}'"'"'))' \
    '2: :($(kubectl get pods $line[1] -o=jsonpath='"'"'{range .spec.containers[*].name}{@}{"\n"}{end}'"'"'))'
