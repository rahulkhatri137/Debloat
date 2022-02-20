#!/bin/bash

LOCALDIR=`cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd`
source ./../bin.sh

if [ -f "$TMPDIR/raw,img" ]; then
   cd $TMPDIR
   e2fsck -fy raw.img
   resize2fs -M raw.img
   umount $IMAGEDIR
   mv raw.img $OUTDIR
else
   cd $TMPDIR
   e2fsck -fy *.img
   resize2fs -M *img
   umount $IMAGEDIR
   mv *.img $OUTDIR
fi
