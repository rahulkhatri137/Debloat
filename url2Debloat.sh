#!/bin/bash

# Inspired from url2GSI from ErfanGSIs tool at https://github.com/erfanoabdi/ErfanGSIs
# Copyright to Rahul at https://github.com/rahulkhatri137

LOCALDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"
cd $LOCALDIR
source ./bin.sh
usage() {
cat <<EOT
Usage:
    $0 <GSI/SGSI link> <Debloated Name>
EOT
}

case $1 in
    --help|-h|-?)
    usage
    exit 1
    ;;
esac

URL=$1
NAME=$2

LEAVE() {
    echo "-> Something got messed up! Exiting..."
    rm -rf workspace output tmp
    exit 1
}

echo "-> Initing Environment..."
rm -rf $OUTDIR
mkdir -p $TMPDIR
mkdir -p $TARGETDIR
mkdir -p $IMAGESDIR
mkdir -p $OUTDIR
chmod -R 777 ./

if echo "${URL}" | grep -q "http\|https"; then
echo "-> Downloading image..."
cd $TMPDIR
aria2c -x16 ${URL} > /dev/null 2>&1
mv *.img $IMAGESDIR
else
mv $URL $IMAGESDIR/system.img
fi

cd $LOCALDIR
chmod -R 777 ./

#Extract Image
echo "-> Extracting image..."
./image_extract.sh > /dev/null 2>&1 || LEAVE

#Debloat
echo "-> Debloating..."
./debloat.sh $systemdir/system > /dev/null 2>&1 || LEAVE
./debloat2.sh $systemdir/system > /dev/null 2>&1 || LEAVE

cp -frp build*.prop $systemdir/system
cp -frp *.apk $systemdir/system/app/GoogleLatinInput/GoogleLatinInput.apk

#vars
date=`date +%Y%m%d`
outputname="$NAME-Debloated-$date-SGSI137".img
output="$OUTDIR/$outputname"
size=`du -sk $systemdir | awk '{$1*=1024;$1=int($1*1.05);printf $1}'`
bytesToHuman() {
    b=${1:-0}; d=''; s=0; S=(Bytes {K,M,G,T,P,E,Z,Y}iB)
    while ((b > 1024)); do
        d="$(printf ".%02d" $((b % 1024 * 100 / 1024)))"
        b=$((b / 1024))
        let s++
    done
    echo "$b$d ${S[$s]}"
}

tree $systemdir > $OUTDIR/$NAME-Debloated-System-Tree.txt
#Pack Image
echo "-> Repacking image..."
$bin/mkuserimg_mke2fs.sh "$systemdir" "$output" "ext4" "/system" $size -j "0" -T "1230768000" -C "$configdir/system_fs_config" -L "system" -I "256" -M "/system" -m "0" "$configdir/system_file_contexts"

rm -rf tmp workspace

echo "-> Debloating GSI done!"
