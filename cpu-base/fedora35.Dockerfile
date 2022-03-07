FROM fedora:35

LABEL maintainer "Wu Assassin <jambang.pisang@gmail.com>"
LABEL org.opencontainers.image.source https://github.com/pinteraktif/dlcv-images

ENV PROTOBUF_VERSION="v3.16.0"
ENV RUST_VERSION="1.59.0"
USER root

RUN dnf check-upgrade || dnf upgrade -y
RUN dnf install -y \
    autoconf \
    automake \
    bash-completion \
    boost-devel \
    boost-json \
    ca-certificates \
    clang \
    clang-analyzer \
    clang-devel \
    clang-libs \
    clang-resource-filesystem \
    clang-tools-extra \
    cmake \
    curl \
    cyrus-sasl-devel \
    elfutils-devel \
    g++ \
    gcc \
    gcc-c++ \
    gettext \
    git \
    git-lfs \
    glibc-devel \
    glibc-devel.i686 \
    glibc-static \
    glibc-static.i686 \
    hwloc \
    hwloc-devel \
    iputils \
    json-devel \
    libgcc \
    libgcc.i686 \
    libgsasl-devel \
    libsass-devel \
    libsodium \
    libsodium-devel \
    libstdc++ \
    libstdc++-devel \
    libstdc++-static \
    libstdc++-static.i686 \
    libstdc++.i686 \
    libtool \
    libusbx-devel \
    llvm \
    llvm-devel \
    llvm-doc \
    llvm-libs \
    llvm-static \
    llvm-test \
    llvm-test-suite \
    musl-clang \
    musl-devel \
    musl-filesystem  \
    musl-gcc \
    musl-libc \
    musl-libc-static \
    nasm \
    ncurses \
    ncurses-devel \
    ninja-build\
    numactl-devel \
    numactl-libs \
    openblas-devel \
    openssl-devel \
    p7zip \
    pkgconfig \
    python3 \
    python3-clang \
    python3-Cython \
    python3-devel \
    python3-libsass \
    python3-pip \
    python3-pylint \
    python3-setuptools \
    python3-tbb \
    python3-virtualenv \
    python3-wheel \
    tar \
    tbb \
    tbb-devel \
    unzip \
    vim \
    wget \
    which \
    xz \
    yasm \
    yum
RUN dnf clean all

WORKDIR /deps

RUN echo "/usr/local/lib64" > /etc/ld.so.conf.d/general-lib64.conf

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

RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- --default-toolchain stable -y

RUN source /etc/profile.d/bash_completion.sh
ENV PATH="/root/.cargo/bin:${PATH}"

RUN rustup default ${RUST_VERSION} && \
    rustup target add x86_64-unknown-linux-musl && \
    rustup update
