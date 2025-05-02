#! /usr/bin/bash

mkdir build
cd build

cmake .. -DLHAPDF_ROOT_DIR=${PREFIX} -DCMAKE_INSTALL_PREFIX=$PREFIX -DOPENMP=ON -DDOKAN=OFF

make -j$(nproc)
make install
