#!/bin/bash
cd ~/rom

. build/envsetup.sh
export CCACHE_DIR=~/ccache
export CCACHE_EXEC=$(which ccache)
export USE_CCACHE=1
ccache -M 50G -F 0
export BUILD_USERNAME="darknius"
export BUILD_HOSTNAME="darx-labs"
$lunch
export ALLOW_MISSING_DEPENDENCIES=true
export BUILD_BROKEN_USES_BUILD_COPY_HEADERS=true
export BUILD_BROKEN_DUP_RULES=true
$make -j8 &
sleep 100m
kill %1
ccache -s
