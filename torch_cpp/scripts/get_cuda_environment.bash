#!/usr/bin/env bash

function command_exists
{
    type "$1" &> /dev/null;
}

if ! command_exists nvcc; then
    echo "Cuda package not found"
else
    export CUDA_HOME=`whereis cuda |  awk '{print $2}'`
    export CUDA_VERSION=`nvcc --version | grep release | awk '{print $6}' | cut -c 2-4`
fi
