#!/bin/bash

autoreconf -fiv

 #Set here any HW specific flags (usually at CFLAGS)
export CFLAGS="-mcpu=cortex-a7 -mfpu=neon-vfpv4 -ftree-vectorize -mfloat-abi=hard -fPIC -O3"
export CXXFLAGS="-mcpu=cortex-a7 -mfpu=neon-vfpv4 -ftree-vectorize -mfloat-abi=hard -fPIC -O3"
./configure --prefix=$PREFIX \
    --enable-shared=yes \
    --enable-static=yes \
    --with-jpeg8 \
    CFLAGS="-O3 -fPIC" \
    NASM=yasm
make
make check
make install
