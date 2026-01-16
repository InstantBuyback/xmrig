FROM ubuntu:22.04

RUN apt-get update && apt-get install -y \
    mingw-w64 \
    cmake \
    ninja-build \
    git

WORKDIR /xmrig
COPY . .

RUN mkdir build && cd build && \
    cmake .. \
      -DCMAKE_SYSTEM_NAME=Windows \
      -DCMAKE_C_COMPILER=x86_64-w64-mingw32-gcc \
      -DCMAKE_CXX_COMPILER=x86_64-w64-mingw32-g++ \
      -DCMAKE_BUILD_TYPE=Release \
      -DWITH_HWLOC=OFF && \
    make -j$(nproc)
