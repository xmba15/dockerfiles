#!/usr/bin/env bash

readonly CURRENT_DIR=$(dirname $(realpath $0))

BUILD_DIR=/tmp/torch
mkdir -p $BUILD_DIR

source $CURRENT_DIR/get_cuda_environment.bash
if [ ! -z "$CUDA_HOME" -a ! -z "$CUDA_VERSION" ]; then
    TORCH_URL="https://download.pytorch.org/libtorch/cu113/libtorch-cxx11-abi-shared-with-deps-1.12.1%2Bcu113.zip"
else
    TORCH_URL="https://download.pytorch.org/libtorch/cpu/libtorch-cxx11-abi-shared-with-deps-1.12.1%2Bcpu.zip"
fi

# https://stackoverflow.com/questions/6250698/how-to-decode-url-encoded-string-in-shell
function urldecode { : "${*//+/ }"; echo -e "${_//%/\\x}"; }

ZIP_FILE_NAME=$(urldecode $TORCH_URL)
ZIP_FILE_NAME=$(basename $ZIP_FILE_NAME)

wget $TORCH_URL -P $BUILD_DIR
cd $BUILD_DIR && unzip $ZIP_FILE_NAME

INSTALL_DIR=/opt/libtorch
echo "Installing into $INSTALL_DIR"

sudo -l

sudo mkdir -p $INSTALL_DIR
sudo cp -r libtorch/lib ${INSTALL_DIR}/
sudo cp -r libtorch/share ${INSTALL_DIR}/
sudo cp -r libtorch/include ${INSTALL_DIR}/

cd && rm -rf $BUILD_DIR
