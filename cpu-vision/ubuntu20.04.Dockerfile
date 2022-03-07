FROM ghcr.io/pinteraktif/dlcv-images/cpu-base:ubuntu20.04

ENV DAV1D_VERSION="0.9.2"
ENV FFMPEG_VERSION="n4.4.1"
ENV ONNX_VERSION="v1.11.0"
ENV ONNXRUNTIME_VERSION="v1.10.0"
ENV OPENCV_VERSION="4.5.5"
ENV OPENVINO_COMPONENTS="COMPONENTS=;intel-openvino-base__noarch;intel-openvino-dldt-base__noarch;intel-openvino-setupvars__noarch;intel-openvino-eula__noarch;intel-openvino-telemetry__noarch;intel-openvino-ie-sdk-ubuntu-focal__x86_64;intel-openvino-ie-bin-python-tools-ubuntu-focal__x86_64;intel-openvino-ie-samples__x86_64;intel-openvino-ie-rt__x86_64;intel-openvino-ie-rt-core-ubuntu-focal__x86_64;intel-openvino-ie-rt-cpu-ubuntu-focal__x86_64;intel-openvino-omz-tools__x86_64;intel-openvino-rockhopper-gna-ubuntu-focal__x86_64;intel-openvino-model-optimizer__x86_64;intel-openvino-pot__x86_64;intel-openvino-dl-workbench__x86_64;intel-openvino-omz-dev__x86_64;intel-openvino-mediasdk__x86_64;intel-openvino-docs__noarch;intel-openvino-gva-sdk__x86_64;intel-openvino-gva-dev-ubuntu-focal__x86_64;intel-openvino-base-pset"
ENV OPENVINO_VERSION="2021.4.752"
ENV SVTAV1_VERSION="v0.9.1"

RUN git clone --recursive --depth 1 --branch ${DAV1D_VERSION} https://github.com/videolan/dav1d.git dav1d && \
    git clone --recursive --depth 1 --branch ${FFMPEG_VERSION} https://github.com/FFmpeg/FFmpeg.git ffmpeg && \
    git clone --recursive --depth 1 --branch ${ONNX_VERSION} https://github.com/onnx/onnx.git onnx && \
    git clone --recursive --depth 1 --branch ${ONNXRUNTIME_VERSION} https://github.com/microsoft/onnxruntime.git onnxruntime && \
    git clone --recursive --depth 1 --branch ${OPENCV_VERSION} https://github.com/opencv/opencv_contrib.git opencv-contrib && \
    git clone --recursive --depth 1 --branch ${OPENCV_VERSION} https://github.com/opencv/opencv.git opencv && \
    git clone --recursive --depth 1 --branch ${SVTAV1_VERSION} https://gitlab.com/AOMediaCodec/SVT-AV1 svt-av1

RUN aria2c -x16 -s16 "https://share.tapalogi.com/intel/l_openvino_toolkit_p_${OPENVINO_VERSION}.tgz" && \
    tar xzvf "l_openvino_toolkit_p_${OPENVINO_VERSION}.tgz" && \
    mv "l_openvino_toolkit_p_${OPENVINO_VERSION}" openvino && \
    cd openvino && \
    rm silent.cfg && \
    echo "ACCEPT_EULA=accept" >> silent.cfg && \
    echo "CONTINUE_WITH_OPTIONAL_ERROR=yes" >> silent.cfg && \
    echo "PSET_INSTALL_DIR=/opt/intel" >> silent.cfg && \
    echo "CONTINUE_WITH_INSTALLDIR_OVERWRITE=yes" >> silent.cfg && \
    echo "PSET_MODE=install" >> silent.cfg && \
    echo "INTEL_SW_IMPROVEMENT_PROGRAM_CONSENT=no" >> silent.cfg && \
    echo ${OPENVINO_COMPONENTS} >> silent.cfg && \
    rm "../l_openvino_toolkit_p_${OPENVINO_VERSION}.tgz"

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
    cpio \
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
    pciutils \
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

RUN cd onnx && \
    export CMAKE_ARGS="-DONNX_USE_LITE_PROTO=ON" && \
    python3 setup.py install && \
    ldconfig && \
    unset CMAKE_ARGS

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
    -D CPU_BASELINE="SSE,SSE2,SSE3,SSSE3,SSE4_1,POPCNT,SSE4_2,FP16,FMA3,AVX,AVX2,AVX_512F,AVX512_COMMON,AVX512_SKX" \
    -D CPU_DISPATCH="SSE,SSE2,SSE3,SSSE3,SSE4_1,POPCNT,SSE4_2,FP16,FMA3,AVX,AVX2,AVX_512F,AVX512_COMMON,AVX512_SKX" \
    -D ENABLE_CCACHE="OFF" \
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
    -D WITH_GDAL="ON" \
    -D WITH_ITT="OFF" \
    -D WITH_OPENGL="OFF" \
    -D WITH_QT="OFF" \
    -D WITH_TBB="ON" \
    .. && \
    make -j$(nproc) && \
    make install && \
    ln -s /usr/local/lib/python3.8/site-packages/cv2 \
    /usr/local/lib/python3.8/dist-packages/cv2 && \
    ldconfig

SHELL ["/bin/bash", "-c"]

RUN cd /deps/openvino && \
    ./install.sh -s silent.cfg && \
    source /opt/intel/openvino_2021/bin/setupvars.sh && \
    cd /deps/onnxruntime && \
    ./build.sh \
    --build_shared_lib \
    --build_wheel \
    --config Release \
    --enable_pybind \
    --use_openvino CPU_FP32 \
    --parallel \
    --skip_tests && \
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
