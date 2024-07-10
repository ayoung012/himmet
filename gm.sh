#!/bin/sh

mkdir -p ~/.local/share
mkdir ~/.local/include
mkdir ~/.local/lib

cd ~/.local
wget http://dl-cdn.alpinelinux.org/alpine/v3.19/main/x86_64/pkgconf-2.1.0-r0.apk
wget http://dl-cdn.alpinelinux.org/alpine/v3.19/main/x86_64/zlib-dev-1.3.1-r0.apk
wget http://dl-cdn.alpinelinux.org/alpine/v3.19/main/x86_64/libpng-dev-1.6.40-r0.apk

wget http://dl-cdn.alpinelinux.org/alpine/v3.19/main/x86_64/freetype-2.13.2-r0.apk;
wget http://dl-cdn.alpinelinux.org/alpine/v3.19/main/x86_64/libltdl-2.4.7-r3.apk
wget http://dl-cdn.alpinelinux.org/alpine/v3.19/main/x86_64/libpng-1.6.40-r0.apk
wget http://dl-cdn.alpinelinux.org/alpine/v3.19/main/x86_64/libxml2-2.11.8-r0.apk
wget http://dl-cdn.alpinelinux.org/alpine/v3.19/main/x86_64/libjpeg-turbo-3.0.1-r0.apk
wget http://dl-cdn.alpinelinux.org/alpine/v3.19/main/x86_64/libturbojpeg-3.0.1-r0.apk
wget http://dl-cdn.alpinelinux.org/alpine/v3.19/main/x86_64/libjpeg-turbo-dev-3.0.1-r0.apk

find . -name \*.apk -exec tar --strip-components=1 -xvf {} --exclude=.PKGINFO --exclude=.SIGN\* \;

# Weirdly structured?
wget http://dl-cdn.alpinelinux.org/alpine/v3.19/main/x86_64/zlib-1.3.1-r0.apk
tar xvf zlib-1.3.1-r0.apk
tar xvf zlib-dev-1.3.1-r0.apk lib/libz.so

wget https://downloads.sourceforge.net/project/graphicsmagick/graphicsmagick/1.3.43/GraphicsMagick-1.3.43.tar.xz
unxz GraphicsMagick-1.3.43.tar.xz
tar xvf GraphicsMagick-1.3.43.tar

cd GraphicsMagick-1.3.43

export CPPFLAGS="-I$HOME/.local/include"
export LDFLAGS="-L$HOME/.local/lib"
export PKG_CONFIG_PATH=$HOME/.local/lib/pkgconfig:$PKG_CONFIG_PATH

./configure --prefix=$HOME/.local
make
make install
