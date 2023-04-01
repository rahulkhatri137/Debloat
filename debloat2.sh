#!/bin/bash

LOCALDIR=`cd "$( dirname ${BASH_SOURCE[0]} )" && pwd`
cd $LOCALDIR

systemdir=$1
cd $1/priv-app

rm -rf Dirac* Eng* Glob* Log* Number* *Music SOS* Scene* 
rm -rf State* com.* Tag* Tee* New* Smart*
rm -rf Velvet Browser Omacp
cd $LOCALDIR
