FROM ubuntu:20.04 as build

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
        git && \
    bash install_latest_cmake.bash && \
    bash install_onnx_runtime.bash && \
    rm -rf /build && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

FROM ubuntu:20.04

WORKDIR /workspace

COPY --from=build / /

ENTRYPOINT ["/bin/bash"]
