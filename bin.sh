#!/bin/bash

TOOLDIR=`cd $( dirname ${BASH_SOURCE[0]} ) && pwd`
HOST=$(uname)
platform=$(uname -m)
export IMAGEDIR=$TOOLDIR/image
export SYSTEMDIR=$IMAGEDIR/system
export OUTDIR=$TOOLDIR/output
export SCRIPTDIR=$TOOLDIR/scripts
export TMPDIR=$TOOLDIR/tmp
