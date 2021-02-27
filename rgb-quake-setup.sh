#!/bin/bash

: '
Copyright 2021 Gustavo Lara

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and
associated documentation files (the "Software"), to deal in the Software without restriction,
including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense,
and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so,
subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED
TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF
CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
'

function separator () {
  echo "******************************************************************"
}

function download_quake_launcher () {
  read -p "$1" answer
  answer=${answer:-y}
  if [ $answer = 'y' ]; then
    echo "Downloading..."
    wget https://raw.githubusercontent.com/tavuntu/rgb-quake/master/$2
    tar -xf $2
    installed='yes'
    
    separator
  fi
}

installed='no'
red='\033[0;31m'
green='\033[0;32m'
default='\033[0m'

cd ~

download_quake_launcher 'Install original id1 Quake? (pak0 only) [Y/n]:' 'quake.tar.gz'
download_quake_launcher 'Install Scourge of Armagon launcher? (no pak files) [Y/n]:' 'quake_mission_pack_1.tar.gz'
download_quake_launcher 'Install Dissolution of Eternity launcher? (no pak files) [Y/n]:' 'quake_mission_pack_2.tar.gz'

# remove installation script
rm rgb-quake-setup.sh

if [ $installed = 'no' ]; then
  echo "Nothing? Pfft... your loss."
else
  echo -e "${green}Installing now libretro TyrQuake...${default}"
  sudo bash ~/RetroPie-Setup/retropie_packages.sh lr-tyrquake
  mv ~/RetroPie/roms/ports/quake/id1/pak0.pak ~/quake/id1/

  separator
  echo -e "${green}Done! Now go to RGB-Pi options screen and do a game search.${default}"
  echo -e "${red}Remember: only Shareware pak0 for id1 Quake is included!${default}"
  separator
  echo ''
  echo 'For more info go to github.com/tavuntu/rgb-quake'

  # more cleaning:
  rm quake*tar.gz
  rm RetroPie/roms/ports/Quake.sh
  rm -rf RetroPie/roms/ports/quake/
  rm -rf RetroPie/roms/ports/Quake/
fi
