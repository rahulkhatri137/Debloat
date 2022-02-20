#!/bin/bash

# Copyright to Rahul at https://github.com/rahulkhatri137
# Credits to Erfan Abdi

LOCALDIR=`cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd`
cd $LOCALDIR
source ./bin.sh

# Detect Source API level
if grep -q ro.build.version.release_or_codename $SYSTEMDIR/build.prop; then
    sourcever=`grep ro.build.version.release_or_codename $SYSTEMDIR/build.prop | cut -d "=" -f 2`|| ( echo "System not found" && exit 1 )
else
    sourcever=`grep ro.build.version.release $SYSTEMDIR/build.prop | cut -d "=" -f 2` || ( echo "System not found" && exit 1 )
fi

# Debloat
cd $SCRIPTDIR
echo "-> De-bloating..."
$SCRIPTDIR/debloat.sh "$SYSTEMDIR"
$SCRIPTDIR/debloat2.sh "$SYSTEMDIR"

cd $LOCALDIR
# Codename & Build Number
codename=$(grep -oP "(?<=^ro.product.system.device=).*" -hs $systemdir/build.prop | head -1)
[[ -z "${codename}" ]] && codename=$(grep -oP "(?<=^ro.product.device=).*" -hs $SYSTEMDIR/build.prop | head -1)
[[ -z "${codename}" ]] && codename=Generic
if [[ $(grep "ro.build.display.id" $SYSTEMDIR/build.prop) ]]; then
    displayid="ro.build.display.id"
elif [[ $(grep "ro.system.build.id" $SYSTEMDIR/build.prop) ]]; then
    displayid="ro.system.build.id"
elif [[ $(grep "ro.build.id" $SYSTEMDIR/build.prop) ]]; then
    displayid="ro.build.id"
fi
displayid2=$(echo "$displayid" | sed 's/\./\\./g')
bdisplay=$(grep "$displayid" $SYSTEMDIR/build.prop | sed 's/\./\\./g; s:/:\\/:g; s/\,/\\,/g; s/\ /\\ /g')
sed -i "s/$bdisplay/$displayid2=Built\.by\.RK137/" $SYSTEMDIR/build.prop

# Out Variable
date=`date +%Y%m%d`
outputname="$NAME-$sourcever-$date-$codename-RK137GSI"
ioutputname="$NAME-AB-$sourcever-$date-$codename-RK137GSI"
outputimagename="$ioutputname".img
outputinfo="$OUTDIR/Build-info-$outputname".txt

# System Tree
outputtree="$OUTDIR/System-Tree-$outputname".txt

if [ ! -f "$outputtree" ]; then
    tree $IMAGEDIR >> "$outputtree" 2> "$outputtree"
fi

cd $SCRIPTDIR
$SCRIPTDIR/getinfo.sh "$SYSTEMDIR" > "$outputinfo"

# Getting system size
size=`du -sk $IMAGEDIR | awk '{$1*=1024;$1=int($1*1.05);printf $1}'`
bytesToHuman() {
    b=${1:-0}; d=''; s=0; S=(Bytes {K,M,G,T,P,E,Z,Y}iB)
    while ((b > 1024)); do
        d="$(printf ".%02d" $((b % 1024 * 100 / 1024)))"
        b=$((b / 1024))
        let s++
    done
    echo "$b$d ${S[$s]}"
}

# Image Processing
$SCRIPTDIR/img.sh > /dev/null 2>&1
mv $OUTDIR/*img $OUTDIR/$outputimagename || ( rm -rf $OUTDIR && exit 1 )

echo "Raw Image Size: $(bytesToHuman $size)" >> "$outputinfo"
echo "-> Created image $outputname | Size: $(bytesToHuman $size)"
