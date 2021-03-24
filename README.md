If you use GKE and Cloud Logging for log monitoring, you need to structure logs as JSON format to use more effective monitoring on Cloud Console. But in this way, when you use `kubectl logs` to see logs on CLI, logs won't be seen readable. `kube-gke-logs` aims to show logs more readable by converting JSON to text format.

## Prerequisities

You need to install `kubectl` and [jq](https://stedolan.github.io/jq/) to use `kube-gke-logs`.

## Installation

Download `kube-gke-logs`, make it executable and add it your PATH.

* `chmod +x ./kube-gke-logs`
* `sudo mv ./kube-gke-logs /usr/local/bin`

If you use `zsh`, you can add completion script to use autocomplete feature for Pod and Container names.

* Include the directory in your `$fpath` by adding in `~/.zshrc`:
    * `fpath=(~/kube-gke-logs/completion $fpath)`
* Make sure `compinit` is loaded or do it by adding in `~/.zshrc`:
    * `autoload -Uz compinit && compinit -i`
* Reload shell

## Usage

`kube-gke-logs <POD NAME> <CONTAINAR NAME>`

To change jq filter, you can set GKE_LOGS_FILTER variable. Default filter is: `\(.timestampSeconds | todate) \(.severity) \(.message)`
