#!/bin/env sh

ramdump=/data/vendor/ramdump
if [ ! -d "$ramdump" ]; then
  if [ -e "$ramdump" ]; then
    ui_print "- Warning: $ramdump 不是文件夹，准备重建"
    rm "$ramdump"
  else
    ui_print "- 准备创建 $ramdump 文件夹"
    mkdir "$ramdump"
  fi
fi
chown system: "$ramdump"
chmod 770 "$ramdump"
ui_print "- 完成"
