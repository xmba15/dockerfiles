FROM  nvidia/cuda:11.4.0-cudnn8-devel-ubuntu20.04 as build

ENV DEBIAN_FRONTEND=noninteractive

WORKDIR /build
COPY ./scripts .

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        sudo \
        gnupg2 \
        lsb-release \
        build-essential \
        software-properties-common \
        cmake \
        git && \
    bash install_libtorch.bash && \
    rm -rf /build && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

FROM nvidia/cuda:11.4.0-cudnn8-devel-ubuntu20.04

WORKDIR /workspace

COPY --from=build / /

ENTRYPOINT ["/bin/bash"]
