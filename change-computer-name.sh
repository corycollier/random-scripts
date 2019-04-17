#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail
# set -o xtrace

declare _name="${1:-cmbp}"

read -p "You're about to be prompted for the administrator password three times" _accept

{ # try to set the name
  scutil --set HostName "${_name}" \
    && scutil --set ComputerName "${_name}" \
    && scutil --set LocalHostName "${_name}"
} || {  # output an error message if anything failed
  echo "failed to set name to ${_name}"
}
