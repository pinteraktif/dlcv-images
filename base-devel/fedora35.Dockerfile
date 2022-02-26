FROM fedora:35

LABEL maintainer "Wu Assassin <jambang.pisang@gmail.com>"
LABEL org.opencontainers.image.source https://github.com/pinteraktif/dlcv-images

ENV RUST_VERSION="1.59.0"
USER root

RUN dnf check-upgrade || dnf upgrade -y
RUN dnf install -y \
    autoconf \
    automake \
    bash-completion \
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
    gettext \
    git \
    iputils \
    libgsasl-devel \
    libsass-devel \
    libsodium \
    libsodium-devel \
    libtool \
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
    openssl-devel \
    pkgconfig \
    python3 \
    python3-clang \
    python3-devel \
    python3-libsass \
    python3-pip \
    python3-setuptools \
    python3-virtualenv \
    python3-wheel \
    vim \
    wget \
    yasm

WORKDIR /deps
RUN git clone \
    --recursive \
    --depth 1 \
    --branch v3.16.0 \
    https://github.com/protocolbuffers/protobuf.git protobuf && \
    cd protobuf && \
    mkdir build && \
    cd build && \
    cmake ../cmake \
    -D CMAKE_BUILD_TYPE=Release \
    -D CMAKE_INSTALL_LIBDIR=lib64 \
    -D CMAKE_INSTALL_PREFIX=/usr \
    -D CMAKE_INSTALL_SYSCONFDIR=/etc \
    -D CMAKE_POSITION_INDEPENDENT_CODE=ON \
    -D protobuf_BUILD_SHARED_LIBS=OFF \
    -D protobuf_BUILD_TESTS=OFF && \
    make -j$(nproc) && \
    make install

RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- --default-toolchain stable -y
RUN dnf clean all

RUN source /etc/profile.d/bash_completion.sh
ENV PATH="/root/.cargo/bin:${PATH}"

RUN rustup default ${RUST_VERSION} && \
    rustup target add x86_64-unknown-linux-musl && \
    rustup update
