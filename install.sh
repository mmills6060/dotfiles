#!/bin/bash

mkdir -p Fonts;

pushd Fonts;

wget https://github.com/sahibjotsaggu/San-Francisco-Pro-Fonts/raw/master/SF-Pro-Display-Black.otf;
wget https://github.com/sahibjotsaggu/San-Francisco-Pro-Fonts/raw/master/SF-Pro-Display-BlackItalic.otf;
wget https://github.com/sahibjotsaggu/San-Francisco-Pro-Fonts/raw/master/SF-Pro-Display-Bold.otf;
wget https://github.com/sahibjotsaggu/San-Francisco-Pro-Fonts/raw/master/SF-Pro-Display-BoldItalic.otf;
wget https://github.com/sahibjotsaggu/San-Francisco-Pro-Fonts/raw/master/SF-Pro-Display-Heavy.otf;
wget https://github.com/sahibjotsaggu/San-Francisco-Pro-Fonts/raw/master/SF-Pro-Display-HeavyItalic.otf;
wget https://github.com/sahibjotsaggu/San-Francisco-Pro-Fonts/raw/master/SF-Pro-Display-Light.otf;
wget https://github.com/sahibjotsaggu/San-Francisco-Pro-Fonts/raw/master/SF-Pro-Display-LightItalic.otf;
wget https://github.com/sahibjotsaggu/San-Francisco-Pro-Fonts/raw/master/SF-Pro-Display-Medium.otf;
wget https://github.com/sahibjotsaggu/San-Francisco-Pro-Fonts/raw/master/SF-Pro-Display-MediumItalic.otf;
wget https://github.com/sahibjotsaggu/San-Francisco-Pro-Fonts/raw/master/SF-Pro-Display-Regular.otf;
wget https://github.com/sahibjotsaggu/San-Francisco-Pro-Fonts/raw/master/SF-Pro-Display-RegularItalic.otf;
wget https://github.com/sahibjotsaggu/San-Francisco-Pro-Fonts/raw/master/SF-Pro-Display-Semibold.otf;
wget https://github.com/sahibjotsaggu/San-Francisco-Pro-Fonts/raw/master/SF-Pro-Display-SemiboldItalic.otf;
wget https://github.com/sahibjotsaggu/San-Francisco-Pro-Fonts/raw/master/SF-Pro-Display-Thin.otf;
wget https://github.com/sahibjotsaggu/San-Francisco-Pro-Fonts/raw/master/SF-Pro-Display-ThinItalic.otf;
wget https://github.com/sahibjotsaggu/San-Francisco-Pro-Fonts/raw/master/SF-Pro-Display-Ultralight.otf;
wget https://github.com/sahibjotsaggu/San-Francisco-Pro-Fonts/raw/master/SF-Pro-Display-UltralightItalic.otf;
wget https://github.com/supercomputra/SF-Mono-Font/raw/master/SFMono-Bold.otf;
wget https://github.com/supercomputra/SF-Mono-Font/raw/master/SFMono-BoldItalic.otf;
wget https://github.com/supercomputra/SF-Mono-Font/raw/master/SFMono-Heavy.otf;
wget https://github.com/supercomputra/SF-Mono-Font/raw/master/SFMono-HeavyItalic.otf;
wget https://github.com/supercomputra/SF-Mono-Font/raw/master/SFMono-Light.otf;
wget https://github.com/supercomputra/SF-Mono-Font/raw/master/SFMono-LightItalic.otf;
wget https://github.com/supercomputra/SF-Mono-Font/raw/master/SFMono-Medium.otf;
wget https://github.com/supercomputra/SF-Mono-Font/raw/master/SFMono-MediumItalic.otf;
wget https://github.com/supercomputra/SF-Mono-Font/raw/master/SFMono-Regular.otf;
wget https://github.com/supercomputra/SF-Mono-Font/raw/master/SFMono-RegularItalic.otf;
wget https://github.com/supercomputra/SF-Mono-Font/raw/master/SFMono-Semibold.otf;
wget https://github.com/supercomputra/SF-Mono-Font/raw/master/SFMono-SemiboldItalic.otf;

sudo mkdir -p /usr/share/fonts/opentype && sudo cp -r *.otf /usr/share/fonts/opentype/ && sudo fc-cache -f -v;

popd;

rm -rf Fonts;

sudo apt install gnome-tweaks;
