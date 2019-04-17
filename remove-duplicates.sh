#!/usr/bin/env bash

declare -r _root="${1:-.}"
declare -a _hashes=
declare -a _files=
declare _test=

_files=($(find ${_root} -type f))
# first pass - collect all of the sha1 checksums
for _file in "${_files[@]}"; do
   _hash="$(sha1sum "${_file}" | awk '{print $1}')"
   for _test in "${_hashes[@]}"; do
     [[ ${_test} == "${_hash}" ]] && rm "${_file}"
   done;
   _hashes+=("${_hash}")
done
