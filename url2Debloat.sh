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
    *)
    usage
    ;;
esac
done

URL=$1
NAME=$2

LEAVE() {
    echo "-> Something got messed up! Exiting..."
    rm -rf workspace output tmp
    exit 1
}

echo "export NAME=$NAME" >> ./bin.sh
echo "-> Initing Environment..."
rm -rf $OUTDIR
mkdir -p $TMPDIR
mkdir -p $TARGETDIR
mkdir -p $IMAGESDIR
mkdir -p $OUTDIR

chmod -R 777 ./

if echo "${URL}" | grep -q "http\|https"; then
echo "-> Downloading firmware..."
cd $TMPDIR
aria2c -x16 ${URL} > /dev/null 2>&1
mv *.img $IMAGESDIR
else
mv $URL $IMAGESDIR
fi

cd $LOCALDIR
chmod -R 777 ./

#Extract Image
./image_extract.sh > /dev/null 2>&1 || LEAVE

#Debloat
./debloat.sh $systemdir/system > /dev/null 2>&1 || LEAVE
./debloat2.sh $systemdir/system > /dev/null 2>&1 || LEAVE

#vars
date=`date +%Y%m%d`
outputname="$NAME-AB-$date-SGSI137".img
output="$OUTDIR/$outputname"

#Pack Image
$bin/mkuserimg_mke2fs.sh "$systemdir" "$output" "ext4" "/system" $size -j "0" -T "1230768000" -C "$configdir/system_fs_config" -L "system" -I "256" -M "/system" -m "0" "$configdir/system_file_contexts"

rm -rf tmp workspace

echo "-> Debloating GSI done!"
