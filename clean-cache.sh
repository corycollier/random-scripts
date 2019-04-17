#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

rm -rf /Users/corycollier/.composer/cache/*
rm -rf /Users/corycollier/.cache/*
docker system prune -f
docker volume prune -f

pmset -a hibernatemode 0;
rm -rf /var/vm/sleepimage

killall -HUP mDNSResponder

purge
