#! /usr/bin/bash

mkdir build
cd build

cmake .. -DLHAPDF_ROOT_DIR=${PREFIX} -DCMAKE_INSTALL_PREFIX=$PREFIX -DOPENMP=ON -DDOKAN=OFF

NPROC=$(nproc 2>/dev/null || sysctl -n hw.ncpu)
make -j$NPROC
make install
