#!/bin/bash

: '
Copyright <YEAR> <COPYRIGHT HOLDER>

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

installed='no'
red='\033[0;31m'
green='\033[0;32m'
default='\033[0m'

cd ~

echo 'Install original Quake I config files? [y/n]'
read answer
if [ $answer = 'y' ]; then
  echo "Downloading..."
  wget https://raw.githubusercontent.com/tavuntu/quake-for-rgb-pi/master/quake.tar.gz
  tar -xf quake.tar.gz
  installed='yes'
else
  echo "Not a yes, so I'll take as a no..."
fi

echo 'Install Scourge of Armagon launcher? [y/n]'
read answer
if [ $answer = 'y' ]; then
  echo "Downloading..."
  wget https://raw.githubusercontent.com/tavuntu/quake-for-rgb-pi/master/quake_mission_pack_1.tar.gz
  tar -xf quake_mission_pack_1.tar.gz
  installed='yes'
else
  echo "Not a yes, so I'll take as a no..."
fi

echo 'Install Dissolution of Eternity launcher? [y/n]'
read answer
if [ $answer = 'y' ]; then
  echo "Downloading..."
  wget https://raw.githubusercontent.com/tavuntu/quake-for-rgb-pi/master/quake_mission_pack_2.tar.gz
  tar -xf quake_mission_pack_2.tar.gz
  installed='yes'
else
  echo "Not a yes, so I'll take as a no..."
fi

if [ $installed = 'no' ]; then
  echo "Nothing? Pfft... your loss."
else
  echo 'Installing now TyQuake...'
  sudo bash ~/RetroPie-Setup/retropie_packages.sh lr-tyrquake
  echo -e "${green}Done! Now go to RGB-Pi options screen, do a game search, and you're all set!${default}"
  echo -e "${red}And remember, .pak files are not included!${default}"
  echo 'For more info go to github.com/tavuntu/quake-for-rgb-pi'
fi
