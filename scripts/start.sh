#!/usr/bin/env bash 
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"
PROJECT_DIR="${SCRIPT_DIR}/.."

set -euxo pipefail

source ${SCRIPT_DIR}/functions.sh

files=$(get_docker_files)

for file in $files; do
    docker compose -f $file up -d
done
