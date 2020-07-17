#!/usr/bin/env bash

CC=${FAM_CC} \
CXX=${FAM_CXX} \
AR=${FAM_AR} \
LD=${FAM_LD} \
AS=${FAM_AS} \
STRIP=${FAM_STRIP} \
NM=${FAM_NM} \
./configure \
    --prefix=${INSTALL_DIR} \
    --enable-pic \
    --disable-ccache \
    --disable-debug \
    --disable-gprof \
    --disable-gcov \
    --enable-thumb \
    --enable-realtime-only \
    --disable-dependency-tracking \
    --disable-install-docs \
    --disable-install-bins \
    --enable-install-libs \
    --disable-install-srcs \
    --disable-examples \
    --disable-tools \
    --disable-docs \
    --disable-unit-tests \
    --disable-decode-perf-tests \
    --disable-encode-perf-tests \
    --libc=${SYSROOT_PATH} \
    --enable-better-hw-compatibility \
    --enable-vp8 \
    --enable-vp9 \
    --disable-runtime-cpu-detect \
    --enable-static \
    --disable-shared \
    --enable-multithread \
    --enable-webm-io \
    --enable-libyuv \
    --enable-small || exit 1

${MAKE_EXECUTABLE} clean
${MAKE_EXECUTABLE} -j${HOST_NPROC}
${MAKE_EXECUTABLE} install