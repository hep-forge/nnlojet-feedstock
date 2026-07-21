#! /usr/bin/bash

mkdir build
cd build

# ${CMAKE_ARGS} carries conda-build's own -DCMAKE_BUILD_TYPE=Release
# (plus toolchain/strip paths) -- omitting it leaves CMAKE_BUILD_TYPE
# unset (this project's own CMakeLists.txt never defaults it either),
# producing an unoptimized, unstripped debug-info binary.
cmake .. ${CMAKE_ARGS} -DLHAPDF_ROOT_DIR=${PREFIX} -DCMAKE_INSTALL_PREFIX=$PREFIX -DOPENMP=ON -DDOKAN=OFF

NPROC=$(nproc 2>/dev/null || sysctl -n hw.ncpu)
make -j$NPROC
make install
