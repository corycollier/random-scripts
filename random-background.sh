#!/bin/bash

declare _folder="${1:-~/Pictures}"
declare _cycle="${2:-3600}"
declare _starting=
declare _url=
declare _number=

_number="$(shuf -i 1-1000000 -n 1)"
_url=$(printf "https://wallpapers.wallhaven.cc/wallpapers/full/wallhaven-%s.jpg" "${_number}")
_status="$(curl -I "${_url}" | head -n1 | awk '{print $2}')"
_file="~/Pictures/wallhaven-${_number}.jpg"

if [ "${_status}" == "200" ]; then
  _starting=$(pwd)
  
  cd "${_folder}" \
    && wget "${_url}" \
    && cd "${_starting}"

  osascript -e "tell application \"System Events\"
    tell every desktop
    set pictures folder to \"/${_folder}\"
    set picture rotation to 1
    set random order to true
    set change interval to ${_cycle}.0
    end tell
    end tell"
fi
