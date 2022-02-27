FROM ghcr.io/pinteraktif/dlcv-images/cpu-base:fedora35

ENV FFMPEG_VERSION="n5.0"
ENV ONNX_VERSION="v1.11.0"
ENV ONNXRUNTIME_VERSION="v1.10.0"
ENV OPENCV_VERSION="4.5.5"
ENV OPENVINO_VERSION="2021.4.2"

RUN dnf install -y https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
RUN dnf install -y https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
RUN dnf install -y \
    dav1d \
    eigen3 \
    eigen3-devel \
    fdk-aac \
    fdk-aac-devel \
    ffmpeg-devel \
    gstreamer1 \
    gstreamer1-plugins-base \
    intel-media-driver \
    lame \
    lame-devel \
    lame-libs \
    libaom \
    libaom-devel \
    libass \
    libass-devel \
    libdav1d \
    libdav1d-devel \
    libdrm \
    libdrm-devel \
    libpng \
    libpng-devel \
    libpng-static \
    libpng-tools \
    libvorbis \
    libvorbis-devel \
    libvpx \
    libvpx-devel \
    libvpx-utils \
    libwebp \
    libwebp-devel \
    openblas \
    openblas-devel \
    openblas-openmp \
    openblas-static \
    openh264 \
    openh264-devel \
    opus \
    opus-devel \
    opus-tools \
    python3-beautifulsoup4 \
    python3-flake8 \
    python3-matplotlib \
    python3-numpy \
    python3-pandas \
    python3-pypandoc \
    svt-av1 \
    svt-av1-devel \
    svt-av1-libs \
    svt-hevc \
    svt-hevc-devel \
    svt-hevc-libs \
    svt-vp9 \
    x264 \
    x264-devel \
    x264-libs \
    x265 \
    x265-devel \
    x265-libs \
    xvidcore \
    xvidcore-devel
RUN dnf clean all

RUN git clone --recursive --branch ${FFMPEG_VERSION} --depth 1 https://github.com/FFmpeg/FFmpeg.git ffmpeg && \
    git clone --recursive --branch ${ONNX_VERSION} --depth 1 https://github.com/onnx/onnx.git onnx && \
    git clone --recursive --branch ${ONNXRUNTIME_VERSION} --depth 1 https://github.com/microsoft/onnxruntime.git onnxruntime && \
    git clone --recursive --branch ${OPENCV_VERSION} --depth 1 https://github.com/opencv/opencv_contrib.git opencv-contrib && \
    git clone --recursive --branch ${OPENCV_VERSION} --depth 1 https://github.com/opencv/opencv.git opencv && \
    git clone --recursive --branch ${OPENVINO_VERSION} --depth 1 https://github.com/openvinotoolkit/openvino.git openvino && \
    echo "/usr/local/lib64" > /etc/ld.so.conf.d/opencv.conf

RUN cd ffmpeg && \
    ./configure \
    --disable-debug \
    --enable-gpl \
    --enable-hardcoded-tables \
    --enable-libaom \
    --enable-libass \
    --enable-libdav1d \
    --enable-libdrm \
    --enable-libfdk-aac \
    --enable-libfreetype \
    --enable-libmp3lame \
    --enable-libopenh264 \
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
    python3 -m pip install -e . && \
    ldconfig && \
    unset CMAKE_ARGS

#RUN mkdir -p openvino/build && \
#    cd openvino/build && \
#    cmake \
#    -D CMAKE_BUILD_TYPE="Release" \
#    -D ENABLE_CLANG_FORMAT="ON " \
#    -D ENABLE_DOCS="ON" \
#    -D ENABLE_ERROR_HIGHLIGH="ON" \
#    -D ENABLE_LTO="ON" \
#    -D ENABLE_MYRIAD="OFF" \
#    -D ENABLE_PYTHON="ON" \
#    -D ENABLE_VPU="OFF" \
#    .. && \
#    make -j$(nproc) && \
#    make install && \
#    ldconfig
