#!/usr/bin/env bash

set -e
set -o pipefail
set -v

curl -s -X POST https://api.stackbit.com/project/5eac963a47dd930019bb0a6a/webhook/build/pull > /dev/null
npx @stackbit/stackbit-pull --stackbit-pull-api-url=https://api.stackbit.com/pull/5eac963a47dd930019bb0a6a
curl -s -X POST https://api.stackbit.com/project/5eac963a47dd930019bb0a6a/webhook/build/ssgbuild > /dev/null
jekyll build
curl -s -X POST https://api.stackbit.com/project/5eac963a47dd930019bb0a6a/webhook/build/publish > /dev/null
