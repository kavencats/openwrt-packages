#!/bin/bash
set -euxo pipefail

PKG_NAME=$1

# 使用 sbwml/openwrt-gh-action-sdk 的单包构建模式
docker run --rm \
  -v $(pwd):/openwrt \
  -w /openwrt \
  sbwml/openwrt-gh-action-sdk:main \
  sh -c "
    set -euxo pipefail;
    ARCH='${ARCH}' FEEDNAME='${FEEDNAME}' NO_REFRESH_CHECK=true V=s make package/$PKG_NAME/compile
  "
