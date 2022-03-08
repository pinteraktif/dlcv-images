FROM ubuntu:20.04

LABEL maintainer "Wu Assassin <jambang.pisang@gmail.com>"
LABEL org.opencontainers.image.source https://github.com/pinteraktif/dlcv-images

ENV CMAKE_VERSION="v3.22.3"
ENV PROTOBUF_VERSION="v3.16.0"
ENV RUST_VERSION="1.59.0"
ENV TZ="Etc/Utc"

USER root

RUN rm /etc/apt/apt.conf.d/docker-clean && \
    apt update && \
    DEBIAN_FRONTEND="noninteractive" apt upgrade -y

RUN DEBIAN_FRONTEND="noninteractive" apt install -y \
    aria2 \
    autoconf \
    automake \
    bash-completion \
    build-essential \
    ca-certificates \
    ccze \
    clang \
    clangd \
    cmake \
    curl \
    doxygen \
    gettext \
    gfortran \
    git \
    git-lfs \
    hwloc-nox \
    iputils-ping \
    libboost-dev \
    libc++-dev \
    libeigen3-dev \
    libelf-dev \
    libhwloc-dev \
    libllvmspirvlib-dev \
    libncurses-dev \
    libncursesw5-dev \
    libnuma-dev \
    libomp-dev \
    libopenblas-dev \
    libsasl2-dev \
    libsass-dev \
    libsodium-dev \
    libssl-dev \
    libtbb-dev \
    libtool \
    libusb-dev \
    libzstd-dev \
    lld \
    llvm \
    llvm-spirv \
    meson \
    musl \
    musl-dev \
    musl-tools \
    nasm \
    ninja-build \
    p7zip-full \
    pkg-config \
    python3 \
    python3-dev \
    python3-pip \
    python3-setuptools \
    python3-wheel \
    tar \
    unzip \
    vim \
    wget \
    zip \
    yasm

WORKDIR /deps

RUN git clone \
    --recursive \
    --depth 1 \
    --branch ${CMAKE_VERSION} \
    https://github.com/Kitware/CMake.git cmake && \
    cd cmake && \
    ./bootstrap && \
    make -j$(nproc) && \
    make install

RUN git clone \
    --recursive \
    --depth 1 \
    --branch ${PROTOBUF_VERSION} \
    https://github.com/protocolbuffers/protobuf.git protobuf && \
    mkdir protobuf/build && \
    cd protobuf/build && \
    cmake ../cmake \
    -D CMAKE_BUILD_TYPE="Release" \
    -D CMAKE_POSITION_INDEPENDENT_CODE="ON" \
    -D protobuf_BUILD_SHARED_LIBS="OFF" \
    -D protobuf_BUILD_TESTS="OFF" && \
    make -j$(nproc) && \
    make install && \
    cd /deps/protobuf/python && \
    python3 setup.py install && \
    ldconfig

RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | \
    sh -s -- --default-toolchain stable -y

ENV PATH="/root/.cargo/bin:${PATH}"

SHELL ["/bin/bash", "-c"]

RUN source /root/.bashrc && \
    source /etc/profile.d/bash_completion.sh && \
    apt update

RUN rustup default ${RUST_VERSION} && \
    rustup target add x86_64-unknown-linux-musl && \
    rustup update

RUN gcc -v && echo "" && \
    clang -v && echo "" && \
    rustc -vV && echo "" && \
    python3 --version && \
    cmake --version
