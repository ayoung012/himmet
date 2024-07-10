#!/bin/sh

mkdir -p ~/.local/share
mkdir ~/.local/include
mkdir ~/.local/lib
cat << EOF > ~/local/share/config.site
CPPFLAGS=-I$HOME/.local/include
LDFLAGS=-L$HOME/.local/lib
EOF

cd ~/.local
wget http://dl-cdn.alpinelinux.org/alpine/v3.19/main/x86_64/freetype-2.13.2-r0.apk;
wget http://dl-cdn.alpinelinux.org/alpine/v3.19/main/x86_64/libltdl-2.4.7-r3.apk
wget http://dl-cdn.alpinelinux.org/alpine/v3.19/main/x86_64/libpng-1.6.40-r0.apk
wget http://dl-cdn.alpinelinux.org/alpine/v3.19/main/x86_64/libxml2-2.11.8-r0.apk
wget http://dl-cdn.alpinelinux.org/alpine/v3.19/main/x86_64/libjpeg-turbo-3.0.1-r0.apk

find . -name \*.apk -exec tar --strip-components=1 -xvf {} --exclude=.PKGINFO --exclude=.SIGN\* \;

wget https://downloads.sourceforge.net/project/graphicsmagick/graphicsmagick/1.3.43/GraphicsMagick-1.3.43.tar.xz
unxz GraphicsMagick-1.3.43.tar.xz
tar xvf GraphicsMagick-1.3.43.tar

cd GraphicsMagick-1.3.43
./configure --prefix ~/.local
make
make install
