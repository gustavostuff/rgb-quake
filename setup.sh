#!/bin/bash

# Copyright 2021 Gustavo Lara

# Permission is hereby granted, free of charge, to any person obtaining a copy of this softwareand associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

# The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

function separator () {
  echo "******************************************************************"
}

cd ~
yes='no'

echo 'Install original Quake I? [y/n]'
read answer
if [ '$answer' = 'y' ]; then
  echo "Downloading..."
  sudo wget https://raw.githubusercontent.com/tavuntu/quake-for-rgb-pi/master/quake.tar.gz
  sudo tar -xf quake.tar.gz
  yes='yes'
  separator
fi

echo 'Install Scourge of Armagon expansion? [y/n]'
read answer
if [ '$answer' = 'y' ]; then
  echo "Downloading..."
  sudo wget https://raw.githubusercontent.com/tavuntu/quake-for-rgb-pi/master/quake_mission_pack_1.tar.gz
  sudo tar -xf quake_mission_pack_1.tar.gz
  yes='yes'
  separator
fi

echo 'Install Dissolution of Eternity expansion? [y/n]'
read answer
if [ '$answer' = 'y' ]; then
  echo "Downloading..."
  sudo wget https://raw.githubusercontent.com/tavuntu/quake-for-rgb-pi/master/quake_mission_pack_2.tar.gz
  sudo tar -xf quake_mission_pack_2.tar.gz
  yes='yes'
  separator
fi

if [ '$yes' = 'no' ]; then
  echi "Nothing? Pfft... your loss."
fi
