#!/bin/bash
pakFile="/home/pi/quake/id1/pak0.pak"
if test -f "$pakFile"; then
  vcgencmd hdmi_timings 1920 1 48 192 240 240 1 9 5 9 0 0 0 60.0 0 37872000 1
  fbset -depth 8 && fbset -depth 24 && fbset -depth 32
  cp /home/pi/quake/240-lines-core-options.cfg /home/pi/quake/retroarch-core-options.cfg
  /opt/retropie/emulators/retroarch/bin/retroarch -L /opt/retropie/libretrocores/lr-tyrquake/tyrquake_libretro.so --config /home/pi/quake/config-240-lines.cfg "$pakFile"
fi
