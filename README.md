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
Package            Version
------------------ -------
appdirs            1.4.4
astroid            2.6.6
attrs              21.2.0
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
iniconfig          1.1.1
isort              5.9.3
kiwisolver         1.3.2
lazy-object-proxy  1.6.0
libcomps           0.1.18
libsass            0.20.0
lit                13.0.0
lxml               4.6.5
matplotlib         3.5.1
mccabe             0.6.1
meson              0.59.4
munkres            1.1.2
numexpr            2.7.1
numpy              1.21.5
olefile            0.46
packaging          21.0
pandas             1.3.3
pandas-datareader  0.10.0
Pillow             8.3.2
pip                21.2.3
platformdirs       2.2.0
pluggy             0.13.1
py                 1.11.0
pycairo            1.20.1
pycodestyle        2.7.0
pyflakes           2.3.1
pylint             2.9.6
pypandoc           1.7.2
pyparsing          2.4.7
PySocks            1.7.1
pytest             6.2.4
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
> pkg-config --list-package-names | \
while read package; \
do printf "%-25s => %s\n" ${package} $(pkg-config --modversion ${package}); \
done
```

<details>
<p>

```text
opencv4                   => 4.5.5
zlib                      => 1.2.11
libcrypt                  => 4.4.28
libxcrypt                 => 4.4.28
libelf                    => 0.186
icu-i18n                  => 69.1
icu-io                    => 69.1
icu-uc                    => 69.1
liblzma                   => 5.2.5
libdebuginfod             => 0.186
libzstd                   => 1.5.2
form                      => 6.2.20210508
formw                     => 6.2.20210508
menu                      => 6.2.20210508
menuw                     => 6.2.20210508
ncurses++                 => 6.2.20210508
ncurses++w                => 6.2.20210508
ncurses                   => 6.2.20210508
ncursesw                  => 6.2.20210508
panel                     => 6.2.20210508
panelw                    => 6.2.20210508
tic                       => 6.2.20210508
tinfo                     => 6.2.20210508
libedit                   => 3.1
libefa                    => 1.1.39.0
libibmad                  => 5.3.39.0
libibnetdisc              => 5.0.39.0
libibumad                 => 3.2.39.0
libibverbs                => 1.14.39.0
libmlx4                   => 1.0.39.0
libmlx5                   => 1.22.39.0
librdmacm                 => 1.3.39.0
python-3.10-embed         => 3.10
python-3.10               => 3.10
python                    => 3.10
python3-embed             => 3.10
python3                   => 3.10
hwloc                     => 2.5.0
numa                      => 2.0.14
libdw                     => 0.186
libsasl2                  => 2.1.27
libgsasl                  => 1.10.0
libsass                   => 3.6.4
libsodium                 => 1.0.18
libusb-1.0                => 1.0.24
libcrypto                 => 1.1.1l
libssl                    => 1.1.1l
openssl                   => 1.1.1l
tbb                       => 2020.3
tbbmalloc                 => 2020.3
tbbmalloc_proxy           => 2020.3
nlohmann_json             => 3.10.5
ogg                       => 1.3.5
libavresample             => 4.0.0
libpng                    => 1.6.37
libpng16                  => 1.6.37
libffi                    => 3.1
gflags                    => 2.2.2
libavcodec                => 58.134.100
libva-drm                 => 1.13.0
gtest                     => 1.10.0
gtest_main                => 1.10.0
libva-glx                 => 1.13.0
libavdevice               => 58.13.100
libva-wayland             => 1.13.0
libhwy-contrib            => 0.15.0
libhwy-test               => 0.15.0
libhwy                    => 0.15.0
x265                      => 3.5
harfbuzz-icu              => 2.9.1
fontconfig                => 2.13.94
gdal                      => 3.3.2
libswscale                => 5.9.100
vorbisenc                 => 1.3.7
opus                      => 1.3.1
dav1d                     => 0.9.2
wayland-client            => 1.20.0
wayland-cursor            => 1.20.0
wayland-egl-backend       => 3
wayland-egl               => 18.1.0
wayland-scanner           => 1.20.0
wayland-server            => 1.20.0
libwebpmux                => 1.2.2
pciaccess                 => 0.16
graphite2                 => 3.0.1
libvmaf                   => 2.1.1
libraw1394                => 2.1.2
fribidi                   => 1.0.10
valgrind                  => 3.18.1
libpostproc               => 55.9.100
sysprof-capture-4         => 3.42.1
libass                    => 0.14.0
libwebp                   => 1.2.2
libavutil                 => 56.70.100
libwebpdemux              => 1.2.2
libpcre2-16               => 10.39
libpcre2-32               => 10.39
libpcre2-8                => 10.39
libpcre2-posix            => 10.39
libxml-2.0                => 2.9.13
libsepol                  => 3.3
libselinux                => 3.3
blkid                     => 2.37.4
mount                     => 2.37.4
libjxl                    => 0.6.1
aom                       => 3.2.0
libavfilter               => 7.110.100
libpcre                   => 8.45
libpcre16                 => 8.45
libpcre32                 => 8.45
libpcrecpp                => 8.45
libpcreposix              => 8.45
libbrotlidec              => 1.0.9
libavformat               => 58.76.100
harfbuzz-gobject          => 2.9.1
freetype2                 => 24.0.18
libjxl_threads            => 0.6.1
libswresample             => 3.9.100
tesseract                 => 4.1.3
vorbisfile                => 1.3.7
gio-2.0                   => 2.70.4
gio-unix-2.0              => 2.70.4
glib-2.0                  => 2.70.4
gmodule-2.0               => 2.70.4
gmodule-export-2.0        => 2.70.4
gmodule-no-export-2.0     => 2.70.4
gobject-2.0               => 2.70.4
gthread-2.0               => 2.70.4
lept                      => 1.81.1
bzip2                     => 1.0.6
libva-x11                 => 1.13.0
libva                     => 1.13.0
libwebpdecoder            => 1.2.2
libbrotlicommon           => 1.0.9
libbrotlienc              => 1.0.9
harfbuzz-subset           => 2.9.1
harfbuzz                  => 2.9.1
SvtAv1Dec                 => 0.8.7
SvtAv1Enc                 => 0.8.7
openh264                  => 2.1.1
libkms                    => 1.0.0
fdk-aac                   => 2.0.2
libglog                   => 0.3.5
x264                      => 0.163.3060
vorbis                    => 1.3.7
libdrm                    => 2.4.110
libdrm_amdgpu             => 2.4.110
libdrm_intel              => 2.4.110
libdrm_nouveau            => 2.4.110
libdrm_radeon             => 2.4.110
libdc1394-2               => 2.2.6
SvtHevcEnc                => 1.5.0
vpx                       => 1.10.0
systemd                   => 249
udev                      => 249
shared-mime-info          => 2.1
dracut                    => 53d6a61
eigen3                    => 3.3.9
bash-completion           => 2.11
```

</p>
</details>

## CPU Based CV - Ubuntu 20.04

```bash
docker pull ghcr.io/pinteraktif/dlcv-images/cpu-vision:ubuntu20.04
```

### Python Packages - `cpu-vision:ubuntu20.04`

```bash
> python3 -m pip list
```

<details>
<p>

```text
Package              Version
-------------------- -------
astroid              2.3.3
atomicwrites         1.1.5
attrs                19.3.0
beautifulsoup4       4.10.0
Cython               0.29.14
entrypoints          0.3
flake8               3.7.9
flatbuffers          2.0
importlib-metadata   1.5.0
isort                4.3.4
lazy-object-proxy    1.4.3
logilab-common       1.4.3
mccabe               0.6.1
meson                0.53.2
more-itertools       4.2.0
numpy                1.17.4
onnx                 1.11.0
onnxruntime-openvino 1.10.0
packaging            20.3
pip                  22.0.3
pluggy               0.13.0
protobuf             3.16.0
py                   1.8.1
pycodestyle          2.5.0
pyflakes             2.1.1
Pygments             2.3.1
pylint               2.4.4
pyparsing            2.4.6
pytest               4.6.9
PyYAML               5.3.1
setuptools           45.2.0
six                  1.16.0
soupsieve            2.3.1
typing_extensions    4.1.1
wcwidth              0.1.8
wheel                0.34.2
wrapt                1.11.2
zipp                 1.0.0
```

</p>
</details>

### System Packages - `cpu-vision:ubuntu20.04`

```bash
> pkg-config --list-all | \
while read package; \
do package_name=$(echo $package | cut -d' ' -f1); \
package_version=$(pkg-config --modversion ${package_name}); \
package_version=$(echo $package_version | cut -d' ' -f1); \
printf "%-25s => %s\n" ${package_name} ${package_version}; \
done
```

<details>
<p>

```text
freexl                    => 1.0.5
libcrypto                 => 1.1.1f
hdf5-serial               => 1.10.4
libffi                    => 3.3
libdrm_amdgpu             => 2.4.107
protobuf-lite             => 3.16.0.0
ncurses++                 => 6.2.20200212
gio-unix-2.0              => 2.64.6
ncursesw                  => 6.2.20200212
sqlite3                   => 3.31.1
mysqlclient               => 21.2.28
libpcre2-posix            => 10.34
cfitsio                   => 3.47
ogg                       => 1.3.4
lapack                    => 0.3.8+ds
liblzma                   => 5.2.4
libsasl2                  => 2.1.27
libavresample             => 4.0.0
pciaccess                 => 0.16
libavdevice               => 58.13.100
libdrm                    => 2.4.107
vorbis                    => 1.3.6
libdrm_radeon             => 2.4.107
libdapclient              => 3.20.5
minizip                   => 1.2.8
LLVMSPIRVLib              => 10.0.0.1
ncurses                   => 6.2.20200212
libdrm_nouveau            => 2.4.107
opencv4                   => 4.5.5
ncurses++w                => 6.2.20200212
libpostproc               => 55.9.100
vorbisenc                 => 1.3.6
libarchive                => 3.4.0
xerces-c                  => 3.2.2
libavformat               => 58.76.100
libwebpmux                => 0.6.1
libva-glx                 => 1.7.0
libopenjp2                => 2.3.1
bash-completion           => 2.10
libva-drm                 => 1.7.0
libpq                     => 12.9
libzstd                   => 1.4.4
libva                     => 1.7.0
fyba                      => 4.1.1
icu-uc                    => 66.1
tbb                       =>
harfbuzz                  => 2.6.4
wayland-egl               => 18.1.0
libva-x11                 => 1.7.0
panelw                    => 6.2.20200212
wayland-cursor            => 1.18.0
expat                     => 2.2.9
eigen3                    => 3.3.7
libpcreposix              => 8.39
glib-2.0                  => 2.64.6
menuw                     => 6.2.20200212
opus                      => 1.3.1
libopenjp3d               => 2.3.1
blas-atlas                => 3.10.3
lapack-atlas              => 3.10.3
libssl                    => 1.1.1f
arpack                    => 3.7.0
poppler-splash            => 0.86.1
libusb                    => 0.1.12
libpng16                  => 1.6.37
tic                       => 6.2.20200212
icu-io                    => 66.1
lept                      => 1.79.0
tinfo                     => 6.2.20200212
blas                      => 0.3.8+ds
gio-2.0                   => 2.64.6
odbccr                    => 2.3.6
odbc                      => 2.3.6
fontconfig                => 2.13.1
libwebpdemux              => 0.6.1
menu                      => 6.2.20200212
mount                     => 2.34.0
libpcre                   => 8.39
blkid                     => 2.34.0
libsepol                  => 3.0
formw                     => 6.2.20200212
uuid                      => 2.34.0
spatialite                => 4.3.0a
gmodule-2.0               => 2.64.6
graphite2                 => 3.0.1
dav1d                     => 0.9.2
zlib                      => 1.2.11
libtiff-4                 => 4.1.0
libdc1394-2               => 2.2.6
tesseract                 => 4.1.1
lapacke                   => 3.9.0
fdk-aac                   => 0.1.6
SvtAv1Enc                 => 0.9.1
gobject-2.0               => 2.64.6
fribidi                   => 1.0.8
libavfilter               => 7.110.100
poppler                   => 0.86.1
gmodule-no-export-2.0     => 2.64.6
python3-embed             => 3.8
libpcre32                 => 8.39
libass                    => 0.14.0
libswscale                => 5.9.100
libjpeg                   => 2.0.3
libdap                    => 3.20.5
form                      => 6.2.20200212
proj                      => 6.3.1
protobuf                  => 3.16.0.0
python3                   => 3.8
libraw1394                => 2.1.2
libpcre2-32               => 10.34
wayland-client            => 1.18.0
json-c                    => 0.13.1
hdf5                      => 1.10.4
libdapserver              => 3.20.5
aom                       => 1.0.0
libpng                    => 1.6.37
libcrypt                  => 4.4.10
lapack-netlib             => 3.9.0
odbcinst                  => 2.3.6
libselinux                => 3.0
gthread-2.0               => 2.64.6
libcurl                   => 7.68.0
icu-i18n                  => 66.1
python-3.8                => 3.8
libwebp                   => 0.6.1
poppler-cairo             => 0.86.1
netcdf                    => 4.7.3
ogdi                      => 4.1.0
poppler-data              => 0.4.9
harfbuzz-icu              => 2.6.4
wayland-server            => 1.18.0
libxml-2.0                => 2.9.10
libpcrecpp                => 8.39
SvtAv1Dec                 => 0.8.7
libelf                    => 0.176
openssl                   => 1.1.1f
liburiparser              => 0.9.3
libswresample             => 3.9.100
gmodule-export-2.0        => 2.64.6
hwloc                     => 2.1.0
libsodium                 => 1.0.18
libavutil                 => 56.70.100
libsass                   => 3.6.3
vorbisfile                => 1.3.6
harfbuzz-gobject          => 2.6.4
panel                     => 6.2.20200212
x265                      => 3.2.1
libpcre16                 => 8.39
libdrm_intel              => 2.4.107
vpx                       => 1.8.2
x264                      => 0.155.2917
libavcodec                => 58.134.100
libva-wayland             => 1.7.0
libkml                    => 1.3.0
shared-mime-info          => 1.15
openblas                  => 0.3.8
wayland-scanner           => 1.18.0
libpcre2-8                => 10.34
libopenjpip               => 2.3.1
freetype2                 => 23.1.17
gdal                      => 3.0.4
libxcrypt                 => 4.4.10
python-3.8-embed          => 3.8
libpcre2-16               => 10.34
```

</p>
</details>
