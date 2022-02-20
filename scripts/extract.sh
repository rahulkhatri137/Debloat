#!/bin/bash


LOCALDIR=`cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd`
cd $LOCALDIR
source ./../bin.sh

if [ -d "$TMPDIR" ]; then
   cd $TMPDIR
   echo "-> Extracting Firmware..."
   gzip -d *gz > /dev/null 2>&1
   sudo mount -o rw,sync *.img $IMAGEDIR || sudo mount -o auto -t auto *.img $IMAGEDIR || simg2img *img raw.img
  if [ -f "$TMPDIR/raw.img" ]; then
   sudo mount -o rw,sync raw.img $IMAGEDIR || sudo mount -o auto -t auto raw.img $IMAGEDIR
  fi
else
   echo "-> No Firmware found!"
   exit 1
fi
