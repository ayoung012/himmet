#!/bin/sh

mkdir -p ~/.local/bin

git clone https://github.com/ImageMagick/ImageMagick.git ImageMagick-7.1.1

cd ImageMagick-7.1.1
./configure --prefix ~/.local
make
make install
