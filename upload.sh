#! /bin/sh
nodemcu-uploader -p /dev/ttyUSB10 upload http/index.html
nodemcu-uploader -p /dev/ttyUSB10 upload http/save.lua
nodemcu-uploader -p /dev/ttyUSB10 upload http/datetime.lua

