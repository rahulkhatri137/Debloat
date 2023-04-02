#!/bin/bash

LOCALDIR=`cd "$( dirname ${BASH_SOURCE[0]} )" && pwd`
cd $LOCALDIR

systemdir=$1

#oem bloatwares
rm -rf $1/reserve/*
rm -rf $1/engineermode/*
cd $1/app

# Pixel
rm -rf After* Avast* Atci* Assist* FM* Backup* Calen* Childr* Cloud* 
rm -rf *FileStand com.* Decr* *Encryp* Dlna* Float* Game* Gmail2
rm -rf Gnss* *TTS* Health* KeKeM* KeKeP* KeKeT* Keep MDM* MTKL* 
rm -rf Maps New* OTA* OShare OVoice* Ocr* OppoAt* *Compass OppoChrome*
rm -rf OppoD* OppoEng* OppoLog* OppoM* OppoO* OppoPartner* OppoPhon* OppoQ* *Weather* *Translation*
rm -rf Phone* Pictorial Rf* Rom* Root* SAU* *Pay Smart* SystemApp*
rm -rf YouTube talkback
cd $LOCALDIR
