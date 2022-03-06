FROM ghcr.io/pinteraktif/dlcv-images/cpu-base:ubuntu20.04

ENV DAV1D_VERSION="0.9.2"
ENV FFMPEG_VERSION="n4.4.1"
ENV ONNX_VERSION="v1.11.0"
ENV ONNXRUNTIME_VERSION="v1.10.0"
ENV OPENCV_VERSION="4.5.5"
ENV OPENVINO_VERSION="2021.4.2"
ENV SVTAV1_VERSION="v0.9.1"

RUN git clone --recursive --branch ${DAV1D_VERSION} https://github.com/videolan/dav1d.git dav1d && \
    git clone --recursive --branch ${FFMPEG_VERSION} --depth 1 https://github.com/FFmpeg/FFmpeg.git ffmpeg && \
    git clone --recursive --branch ${ONNX_VERSION} --depth 1 https://github.com/onnx/onnx.git onnx && \
    git clone --recursive --branch ${ONNXRUNTIME_VERSION} --depth 1 https://github.com/microsoft/onnxruntime.git onnxruntime && \
    git clone --recursive --branch ${OPENCV_VERSION} --depth 1 https://github.com/opencv/opencv_contrib.git opencv-contrib && \
    git clone --recursive --branch ${OPENCV_VERSION} --depth 1 https://github.com/opencv/opencv.git opencv && \
    git clone --recursive --branch ${SVTAV1_VERSION} https://gitlab.com/AOMediaCodec/SVT-AV1 svt-av1

RUN mkdir dav1d/build && \
    cd dav1d/build && \
    meson setup \
    -D enable_tools="false" \
    -D enable_test="false" \
    .. && \
    ninja && \
    ninja install && \
    ldconfig

RUN mkdir svt-av1/build && \
    cd svt-av1/build && \
    cmake -G "Unix Makefiles" \
    -D CMAKE_BUILD_TYPE="Release" \
    -D BUILD_DEC="ON" \
    -D BUILD_SHARED_LIBS="ON" \
    .. && \
    make -j$(nproc) && \
    make install && \
    ldconfig

RUN DEBIAN_FRONTEND="noninteractive" apt install -y \
    cython3 \
    flake8 \
    graphviz \
    libaom-dev \
    libass-dev \
    libatlas-base-dev \
    libdc1394-dev \
    libdrm-dev \
    libfdk-aac-dev \
    libgdal-dev \
    libhdf5-dev \
    liblapack-dev \
    liblapack64-dev \
    liblapacke-dev \
    liblapacke64-dev \
    libmp3lame-dev \
    libopenblas-dev \
    libopus-dev \
    libtesseract-dev \
    libva-dev \
    libvorbis-dev \
    libvpx-dev \
    libwebp-dev \
    libx264-dev \
    libx265-dev \
    libxvidcore-dev \
    pylint \
    python3-numpy \
    python3-pytest

RUN python3 -m pip install -U pip && \
    python3 -m pip install beautifulsoup4

RUN cd ffmpeg && \
    ./configure \
    --disable-debug \
    --enable-avresample \
    --enable-gpl \
    --enable-hardcoded-tables \
    --enable-libaom \
    --enable-libass \
    --enable-libdav1d \
    --enable-libdrm \
    --enable-libfdk-aac \
    --enable-libfreetype \
    --enable-libmp3lame \
    --enable-libopus \
    --enable-libsvtav1 \
    --enable-libvorbis \
    --enable-libvpx \
    --enable-libwebp \
    --enable-libx264 \
    --enable-libx265 \
    --enable-libxvid \
    --enable-nonfree \
    --enable-openssl \
    --enable-pic \
    --enable-shared \
    --extra-libs="-lpthread -lm"; \
    tail -50 ffbuild/config.log && \
    make -j$(nproc) && \
    make install && \
    ldconfig

RUN mkdir -p opencv/build && \
    cd opencv/build && \
    cmake -D CMAKE_BUILD_TYPE="Release" \
    -D BUILD_DOCS="ON" \
    -D BUILD_EXAMPLES="OFF" \
    -D BUILD_NEW_PYTHON_SUPPORT="ON" \
    -D BUILD_opencv_python2="OFF" \
    -D BUILD_opencv_python3="ON" \
    -D BUILD_opencv_world="ON" \
    -D BUILD_SHARED_LIBS="ON" \
    -D CPU_BASELINE="SSE,SSE2,SSE3,SSSE3,SSE4_1,POPCNT,SSE4_2,AVX,AVX2,FP16,AVX512F,AVX512_SKX" \
    -D CPU_DISPATCH="SSE,SSE2,SSE3,SSSE3,SSE4_1,POPCNT,SSE4_2,AVX,AVX2,FP16,AVX512F,AVX512_SKX" \
    -D ENABLE_CCACHE="ON" \
    -D ENABLE_FAST_MATH="ON" \
    -D ENABLE_FLAKE8="ON" \
    -D ENABLE_PYLINT="ON" \
    -D HAVE_opencv_python3="ON" \
    -D INSTALL_C_EXAMPLES="OFF" \
    -D INSTALL_PYTHON_EXAMPLES="OFF" \
    -D OPENCV_ENABLE_NONFREE="ON" \
    -D OPENCV_EXTRA_MODULES_PATH="/deps/opencv-contrib/modules" \
    -D OPENCV_GENERATE_PKGCONFIG="ON" \
    -D PARALLEL_ENABLE_PLUGINS="ON" \
    -D WITH_EIGEN="ON" \
    -D WITH_FFMPEG="ON" \
    -D WITH_ITT="OFF" \
    -D WITH_OPENGL="OFF" \
    -D WITH_QT="OFF" \
    -D WITH_TBB="ON" \
    .. && \
    make -j$(nproc) && \
    make install && \
    ldconfig

RUN cd onnx && \
    export CMAKE_ARGS="-DONNX_USE_LITE_PROTO=ON" && \
    python3 setup.py install && \
    ldconfig && \
    unset CMAKE_ARGS

RUN cd onnxruntime && \
    ./build.sh \
    --build_shared_lib \
    --build_wheel \
    --config Release \
    --enable_pybind \
    --enable_training \
    --parallel \
    --skip_onnx_test && \
    ./build.sh \
    --build_shared_lib \
    --build_wheel \
    --config Release \
    --enable_pybind \
    --parallel \
    --skip_onnx_test && \
    python3 -m pip install build/Linux/Release/dist/*.whl && \
    ldconfig

RUN python3 -m pip list && echo "" && \
    pkg-config --list-all | \
    while read package; \
    do package_name=$(echo $package | cut -d' ' -f1); \
    package_version=$(pkg-config --modversion ${package_name}); \
    package_version=$(echo $package_version | cut -d' ' -f1); \
    printf "%-25s => %s\n" ${package_name} ${package_version}; \
    done
