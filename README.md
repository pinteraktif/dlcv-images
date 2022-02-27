# Pinteraktif's DLCV Base Images

## CPU Based CV - Fedora 35

```bash
docker pull ghcr.io/pinteraktif/dlcv-images/cpu-vision:fedora35
```

### Python Packages - `cpu-vision:fedora35`

```bash
> python3 -m pip list
```

<details>
<p>

```text
Package            Version Location
------------------ ------- ---------------------
appdirs            1.4.4
astroid            2.6.6
beautifulsoup4     4.9.3
Bottleneck         1.3.2
Brotli             1.0.9
charset-normalizer 2.0.4
cycler             0.10.0
Cython             0.29.24
distlib            0.3.2
filelock           3.0.12
flake8             3.9.2
fonttools          4.26.1
fs                 2.4.11
gpg                1.15.1
idna               3.2
isort              5.9.3
kiwisolver         1.3.2
lazy-object-proxy  1.6.0
libcomps           0.1.18
libsass            0.20.0
lit                13.0.0
lxml               4.6.5
matplotlib         3.5.1
mccabe             0.6.1
munkres            1.1.2
numexpr            2.7.1
numpy              1.21.5
olefile            0.46
onnx               1.11.0  /deps/onnx
packaging          21.0
pandas             1.3.3
pandas-datareader  0.10.0
Pillow             8.3.2
pip                21.2.3
platformdirs       2.2.0
protobuf           3.16.0  /deps/protobuf/python
pycairo            1.20.1
pycodestyle        2.7.0
pyflakes           2.3.1
pylint             2.9.6
pypandoc           1.7.2
pyparsing          2.4.7
PySocks            1.7.1
python-dateutil    2.8.1
pytz               2021.3
requests           2.27.0
rpm                4.17.0
scipy              1.7.3
setuptools         57.4.0
six                1.16.0
soupsieve          2.3.1
tables             3.6.1
TBB                0.1
toml               0.10.2
typed-ast          1.4.3
typing_extensions  4.1.1
urllib3            1.26.7
virtualenv         20.8.1
wheel              0.36.2
wrapt              1.12.1
xlrd               2.0.1
xlwt               1.3.0
```

</p>
</details>

### System Packages - `cpu-vision:fedora35`

```bash
> pkg-config --list-all
```

<details>
<p>

```text
opencv4                        OpenCV - Open Source Computer Vision Library
zlib                           zlib - zlib compression library
libcrypt                       libxcrypt - Extended crypt library for DES, MD5, Blowfish and others
libxcrypt                      libxcrypt - Extended crypt library for DES, MD5, Blowfish and others
libelf                         libelf - elfutils libelf library to read and write ELF files
icu-i18n                       icu-i18n - International Components for Unicode: Internationalization library
icu-io                         icu-io - International Components for Unicode: Stream and I/O Library
icu-uc                         icu-uc - International Components for Unicode: Common and Data libraries
liblzma                        liblzma - General purpose data compression library
libdebuginfod                  debuginfod - elfutils library to query debuginfo files from debuginfod servers
libzstd                        zstd - fast lossless compression algorithm library
form                           form - ncurses 6.2 add-on library
formw                          formw - ncurses 6.2 add-on library
menu                           menu - ncurses 6.2 add-on library
menuw                          menuw - ncurses 6.2 add-on library
ncurses++                      ncurses++ - ncurses 6.2 add-on library
ncurses++w                     ncurses++w - ncurses 6.2 add-on library
ncurses                        ncurses - ncurses 6.2 library
ncursesw                       ncursesw - ncurses 6.2 library
panel                          panel - ncurses 6.2 add-on library
panelw                         panelw - ncurses 6.2 add-on library
tic                            tic - ncurses 6.2 add-on library
tinfo                          tinfo - ncurses 6.2 terminal interface library
libedit                        libedit - command line editor library provides generic line editing, history, and tokenization functions.
python-3.10-embed              Python - Embed Python into an application
python-3.10                    Python - Build a C extension for Python
python                         Python - Build a C extension for Python
python3-embed                  Python - Embed Python into an application
python3                        Python - Build a C extension for Python
numa                           numa - NUMA policy library
libdw                          libdw - elfutils library for DWARF data and ELF file or process inspection
libsasl2                       Cyrus SASL - Cyrus SASL implementation
libgsasl                       libgsasl - GNU Simple Authentication and Security Layer (SASL)
libsass                        libsass - A C implementation of a Sass compiler
libsodium                      libsodium - A modern and easy-to-use crypto library
libusb-1.0                     libusb-1.0 - C API for USB device access from Linux, Mac OS X, Windows, OpenBSD/NetBSD and Solaris userspace
libcrypto                      OpenSSL-libcrypto - OpenSSL cryptography library
libssl                         OpenSSL-libssl - Secure Sockets Layer and cryptography libraries
openssl                        OpenSSL - Secure Sockets Layer and cryptography libraries and tools
tbb                            Threading Building Blocks - The Threading Building Blocks library abstracts low-level threading details
tbbmalloc                      Threading Building Blocks Scalable Allocator - Implementation of Scalable Memory Allocator of Threading Building Blocks
tbbmalloc_proxy                Threading Building Blocks Scallable Malloc Proxy - Implementation of proxy that redirects memory allocation calls to TBB Scalable Memory Allocator
nlohmann_json                  nlohmann_json - JSON for Modern C++
ogg                            ogg - ogg is a library for manipulating ogg bitstreams
libpng                         libpng - Loads and saves PNG files
libpng16                       libpng - Loads and saves PNG files
x264                           x264 - H.264 (MPEG4 AVC) encoder library
gtest                          gtest - GoogleTest (without main() function)
gtest_main                     gtest_main - GoogleTest (with main() function)
SvtAv1Dec                      SvtAv1Dec - SVT (Scalable Video Technology) for AV1 decoder library
openh264                       OpenH264 - OpenH264 is a codec library which supports H.264 encoding and decoding. It is suitable for use in real time applications such as WebRTC.
libhwy-contrib                 libhwy-contrib - Additions to Highway: image and math library
libhwy-test                    libhwy-test - Efficient and performance-portable SIMD wrapper, test helpers.
libhwy                         libhwy - Efficient and performance-portable SIMD wrapper
graphite2                      Graphite2 - Font rendering engine for Complex Scripts
libvmaf                        libvmaf - VMAF, Video Multimethod Assessment Fusion
fribidi                        GNU FriBidi - Unicode Bidirectional Algorithm Library
valgrind                       Valgrind - A dynamic binary instrumentation framework
sysprof-capture-4              sysprof-capture-4 - The static capture library for tools that generate profiling capture data
libavformat                    libavformat - FFmpeg container format library
libdrm_intel                   libdrm_intel - Userspace interface to intel kernel DRM services
libpcre2-16                    libpcre2-16 - PCRE2 - Perl compatible regular expressions C library (2nd API) with 16 bit character support
libpcre2-32                    libpcre2-32 - PCRE2 - Perl compatible regular expressions C library (2nd API) with 32 bit character support
libpcre2-8                     libpcre2-8 - PCRE2 - Perl compatible regular expressions C library (2nd API) with 8 bit character support
libpcre2-posix                 libpcre2-posix - Posix compatible interface to libpcre2-8
libxml-2.0                     libXML - libXML library version2.
libsepol                       libsepol - SELinux policy library
libselinux                     libselinux - SELinux utility library
blkid                          blkid - Block device id library
mount                          mount - mount library
pciaccess                      pciaccess - Library providing generic access to the PCI bus and devices.
fdk-aac                        Fraunhofer FDK AAC Codec Library - AAC codec library
SvtAv1Enc                      SvtAv1Enc - SVT (Scalable Video Technology) for AV1 encoder library
libdrm_nouveau                 libdrm_nouveau - Userspace interface to nouveau kernel DRM services
libpcre                        libpcre - PCRE - Perl compatible regular expressions C library with 8 bit character support
libpcre16                      libpcre16 - PCRE - Perl compatible regular expressions C library with 16 bit character support
libpcre32                      libpcre32 - PCRE - Perl compatible regular expressions C library with 32 bit character support
libpcrecpp                     libpcrecpp - PCRECPP - C++ wrapper for PCRE
libpcreposix                   libpcreposix - PCREPosix - Posix compatible interface to libpcre
libffi                         libffi - Library supporting Foreign Function Interfaces
aom                            aom - Alliance for Open Media AV1 codec library v3.2.0.
libass                         libass - LibASS is an SSA/ASS subtitles rendering library
libswresample                  libswresample - FFmpeg audio resampling library
libdrm_radeon                  libdrm_radeon - Userspace interface to kernel DRM services for radeon
libavcodec                     libavcodec - FFmpeg codec library
libavresample                  libavresample - Libav audio resampling library
libkms                         libkms - Library that abstracts away the different mm interfaces for kernel drivers
gio-2.0                        GIO - glib I/O library
gio-unix-2.0                   GIO unix specific APIs - unix specific headers for glib I/O library
glib-2.0                       GLib - C Utility Library
gmodule-2.0                    GModule - Dynamic module loader for GLib
gmodule-export-2.0             GModule - Dynamic module loader for GLib
gmodule-no-export-2.0          GModule - Dynamic module loader for GLib
gobject-2.0                    GObject - GLib Type, Object, Parameter and Signal Library
gthread-2.0                    GThread - Thread support for GLib
bzip2                          bzip2 - A file compression library
libavutil                      libavutil - FFmpeg utility library
libdrm_amdgpu                  libdrm_amdgpu - Userspace interface to kernel DRM services for amdgpu
libbrotlicommon                libbrotlicommon - Brotli common dictionary library
libbrotlidec                   libbrotlidec - Brotli decoder library
libbrotlienc                   libbrotlienc - Brotli encoder library
libavdevice                    libavdevice - FFmpeg device handling library
libpostproc                    libpostproc - FFmpeg postprocessing library
libwebp                        libwebp - Library for the WebP graphics format
harfbuzz-gobject               harfbuzz - HarfBuzz text shaping library GObject integration
harfbuzz-icu                   harfbuzz - HarfBuzz text shaping library ICU integration
harfbuzz-subset                harfbuzz - HarfBuzz font subsetter
harfbuzz                       harfbuzz - HarfBuzz text shaping library
freetype2                      FreeType 2 - A free, high-quality, and portable font engine.
fontconfig                     Fontconfig - Font configuration and customization library
SvtHevcEnc                     SvtHevcEnc - SVT (Scalable Video Technology) for HEVC encoder library
libjxl                         libjxl - Loads and saves JPEG XL files
libjxl_threads                 libjxl_threads - JPEG XL multi-thread runner using std::threads.
libswscale                     libswscale - FFmpeg image rescaling library
libdrm                         libdrm - Userspace interface to kernel DRM services
libavfilter                    libavfilter - FFmpeg audio/video filtering library
libwebpdecoder                 libwebpdecoder - Library for the WebP graphics format (decode only)
vorbis                         vorbis - vorbis is the primary Ogg Vorbis library
vorbisenc                      vorbisenc - vorbisenc is a library that provides a convenient API for setting up an encoding environment using libvorbis
vorbisfile                     vorbisfile - vorbisfile is a library that provides a convenient high-level API for decoding and basic manipulation of all Vorbis I audio streams
opus                           Opus - Opus IETF audio codec (floating-point, custom modes build)
vpx                            vpx - WebM Project VPx codec implementation
x265                           x265 - H.265/HEVC video encoder
dav1d                          libdav1d - AV1 decoding library
libwebpdemux                   libwebpdemux - Library for parsing the WebP graphics format container
libwebpmux                     libwebpmux - Library for manipulating the WebP graphics format container
protobuf                       Protocol Buffers - Google's Data Interchange Format
protobuf-lite                  Protocol Buffers - Google's Data Interchange Format
systemd                        systemd - systemd System and Service Manager
udev                           udev - udev
shared-mime-info               shared-mime-info - Freedesktop common MIME database
dracut                         dracut - dracut
eigen3                         Eigen3 - A C++ template library for linear algebra: vectors, matrices, and related algorithms
bash-completion                bash-completion - programmable completion for the bash shell
```

</p>
</details>
