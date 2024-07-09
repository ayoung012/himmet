#!/bin/sh

mkdir -p ~/.local
cd ~/.local
wget http://dl-cdn.alpinelinux.org/alpine/v3.19/main/x86_64/libpng-1.6.40-r0.apk
wget http://dl-cdn.alpinelinux.org/alpine/v3.19/main/x86_64/libxml2-2.11.8-r0.apk
wget http://dl-cdn.alpinelinux.org/alpine/v3.19/main/x86_64/libjpeg-turbo-3.0.1-r0.apk
wget http://dl-cdn.alpinelinux.org/alpine/v3.19/community/x86_64/graphicsmagick-1.3.42-r0.apk

find . -name \*.apk -exec tar --strip-components=1 -xvf {} --exclude=.PKGINFO --exclude=.SIGN\* \;
