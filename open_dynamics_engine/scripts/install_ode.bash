#!/usr/bin/env bash

readonly CURRENT_DIR=$(dirname $(realpath $0))

sudo -l

readonly ODE_VERSION="0.16.x"
readonly BUILD_DIR="/tmp/ode"

sudo apt-get install -y freeglut3-dev

git clone --recursive -b ${ODE_VERSION} https://bitbucket.org/odedevs/ode.git ${BUILD_DIR}
cp ${CURRENT_DIR}/drawstuff-config.cmake.in ${BUILD_DIR}/
cp ${CURRENT_DIR}/cmakelists_diff.patch ${BUILD_DIR}/
cd ${BUILD_DIR} && git apply cmakelists_diff.patch
mkdir -p ode-build && cd $_
cmake -DCMAKE_BUILD_TYPE=Release ..
make -j`nproc`
sudo make install
