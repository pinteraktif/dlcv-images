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
Package              Version
-------------------- ----------
albumentations       1.1.0
appdirs              1.4.4
astroid              2.6.6
attrs                21.2.0
beautifulsoup4       4.9.3
Bottleneck           1.3.2
Brotli               1.0.9
Cerberus             1.3.4
charset-normalizer   2.0.4
cycler               0.10.0
Cython               0.29.24
distlib              0.3.2
easydict             1.9
filelock             3.0.12
flake8               3.9.2
flatbuffers          2.0
fonttools            4.26.1
fs                   2.4.11
gpg                  1.15.1
h5py                 3.6.0
idna                 3.2
imageio              2.16.1
imutils              0.5.4
iniconfig            1.1.1
insightface          0.6.2
isort                5.9.3
joblib               1.1.0
kiwisolver           1.3.2
lazy-object-proxy    1.6.0
libcomps             0.1.18
libsass              0.20.0
lit                  13.0.0
lxml                 4.6.5
matplotlib           3.5.1
mccabe               0.6.1
mpmath               1.2.1
munkres              1.1.2
networkx             2.6.3
numexpr              2.7.1
numpy                1.21.5
olefile              0.46
onnx                 1.11.0
onnxruntime          1.10.0
onnxruntime-training 1.10.0+cpu
packaging            21.0
pandas               1.3.3
pandas-datareader    0.10.0
Pillow               8.3.2
pip                  22.0.3
platformdirs         2.2.0
pluggy               0.13.1
prettytable          3.1.1
protobuf             3.16.0
py                   1.11.0
pycairo              1.20.1
pycodestyle          2.7.0
pyflakes             2.3.1
pylint               2.9.6
pypandoc             1.7.2
pyparsing            2.4.7
PySocks              1.7.1
pytest               6.2.4
python-dateutil      2.8.1
pytz                 2021.3
PyWavelets           1.2.0
PyYAML               6.0
qudida               0.0.4
requests             2.27.0
rpm                  4.17.0
scikit-image         0.19.2
scikit-learn         1.0.2
scipy                1.7.3
setuptools           57.4.0
six                  1.16.0
soupsieve            2.3.1
sympy                1.9
tables               3.6.1
TBB                  0.1
threadpoolctl        3.1.0
tifffile             2022.2.9
toml                 0.10.2
tqdm                 4.63.0
typed-ast            1.4.3
typing_extensions    4.1.1
urllib3              1.26.7
virtualenv           20.8.1
wcwidth              0.2.5
wheel                0.37.1
wrapt                1.12.1
xlrd                 2.0.1
xlwt                 1.3.0
```

</p>
</details>

### System Packages - `cpu-vision:fedora35`

```bash
> pkg-config --list-package-names | while read package; do printf "%-25s => %s\n" ${package} $(pkg-config --modversion ${package}); done
```

<details>
<p>

```text
protobuf                  => 3.16.0.0
protobuf-lite             => 3.16.0.0
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
libpng                    => 1.6.37
libpng16                  => 1.6.37
x264                      => 0.163.3060
gtest                     => 1.10.0
gtest_main                => 1.10.0
SvtAv1Dec                 => 0.8.7
openh264                  => 2.1.1
libhwy-contrib            => 0.15.0
libhwy-test               => 0.15.0
libhwy                    => 0.15.0
graphite2                 => 3.0.1
libvmaf                   => 2.1.1
fribidi                   => 1.0.10
valgrind                  => 3.18.1
sysprof-capture-4         => 3.42.1
libavformat               => 58.76.100
libdrm_intel              => 2.4.110
libpcre2-16               => 10.39
libpcre2-32               => 10.39
libpcre2-8                => 10.39
libpcre2-posix            => 10.39
libxml-2.0                => 2.9.13
libsepol                  => 3.3
libselinux                => 3.3
blkid                     => 2.37.4
mount                     => 2.37.4
pciaccess                 => 0.16
fdk-aac                   => 2.0.2
SvtAv1Enc                 => 0.8.7
libdrm_nouveau            => 2.4.110
libpcre                   => 8.45
libpcre16                 => 8.45
libpcre32                 => 8.45
libpcrecpp                => 8.45
libpcreposix              => 8.45
libffi                    => 3.1
aom                       => 3.2.0
libass                    => 0.14.0
libswresample             => 3.9.100
libdrm_radeon             => 2.4.110
libavcodec                => 58.134.100
libavresample             => 4.0.0
libkms                    => 1.0.0
gio-2.0                   => 2.70.4
gio-unix-2.0              => 2.70.4
glib-2.0                  => 2.70.4
gmodule-2.0               => 2.70.4
gmodule-export-2.0        => 2.70.4
gmodule-no-export-2.0     => 2.70.4
gobject-2.0               => 2.70.4
gthread-2.0               => 2.70.4
bzip2                     => 1.0.6
libavutil                 => 56.70.100
libdrm_amdgpu             => 2.4.110
libbrotlicommon           => 1.0.9
libbrotlidec              => 1.0.9
libbrotlienc              => 1.0.9
libavdevice               => 58.13.100
libpostproc               => 55.9.100
libwebp                   => 1.2.2
harfbuzz-gobject          => 2.9.1
harfbuzz-icu              => 2.9.1
harfbuzz-subset           => 2.9.1
harfbuzz                  => 2.9.1
freetype2                 => 24.0.18
fontconfig                => 2.13.94
SvtHevcEnc                => 1.5.0
libjxl                    => 0.6.1
libjxl_threads            => 0.6.1
libswscale                => 5.9.100
libdrm                    => 2.4.110
libavfilter               => 7.110.100
libwebpdecoder            => 1.2.2
vorbis                    => 1.3.7
vorbisenc                 => 1.3.7
vorbisfile                => 1.3.7
opus                      => 1.3.1
vpx                       => 1.10.0
x265                      => 3.5
dav1d                     => 0.9.2
libwebpdemux              => 1.2.2
libwebpmux                => 1.2.2
systemd                   => 249
udev                      => 249
shared-mime-info          => 2.1
dracut                    => 53d6a61
eigen3                    => 3.3.9
bash-completion           => 2.11
```

</p>
</details>
