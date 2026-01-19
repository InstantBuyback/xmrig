FROM ubuntu:22.04

RUN apt-get update && apt-get install -y \
    build-essential \
    cmake \
    libuv1-dev \
    libssl-dev \
    git \
    hwloc \
    ninja-build

WORKDIR /xmrig
COPY . .

RUN mkdir build && cd build && \
    cmake .. \
      -DCMAKE_BUILD_TYPE=Release \
      -DWITH_HWLOC=OFF && \
    make -j$(nproc)

