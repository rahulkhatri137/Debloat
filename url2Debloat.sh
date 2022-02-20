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

POSITIONAL=()
while [[ $# -gt 0 ]]
do
key="$1"

case $key in
    --help|-h|-?)
    usage
    exit 1
    ;;
    *)
    POSITIONAL+=("$1")
    shift
    ;;
esac
done
set -- "${POSITIONAL[@]}" # restore positional parameters

if [[ ! -n $2 ]]; then
    echo "-> ERROR!"
    echo " - Enter all needed parameters"
    usage
    exit 1
fi

URL=$1
shift
NAME=$1
shift

LEAVE() {
    echo "-> Something got messed up! Exiting..."
    rm -rf image output tmp
    exit 1
}

echo "export NAME=$NAME" >> ./bin.sh
echo "-> Initing Environment..."
rm -rf $OUTDIR
mkdir -p $TMPDIR
mkdir -p $IMAGEDIR
mkdir -p $OUTDIR

if echo "${URL}" | grep -q "http\|https"; then
echo "-> Downloading firmware..."
cd $TMPDIR
aria2c ${URL} > /dev/null 2>&1
else
mv $URL $TMPDIR/
fi
cd $LOCALDIR

#Extract Image
"$SCRIPTDIR"/extract.sh || LEAVE

#Debloat
"$LOCALDIR"/make.sh || LEAVE

sudo rm -rf $TEMPDIR
cd $OUTDIR
cp -frp B*txt README.txt > /dev/null 2>&1 || LEAVE

echo "-> Debloating GSI done!"
