#!/bin/bash

LOCALDIR=`cd "$( dirname ${BASH_SOURCE[0]} )" && pwd`
cd $LOCALDIR

systemdir=$1

#oem bloatwares
rm -rf $1/reserve/*
rm -rf $1/preload/*
rm -rf $1/preset_apps/*
rm -rf $1/data-app/*
rm -rf $1/*/preload/*
rm -rf $1/*/preset_apps/*
rm -rf $1/*/data-app/*

rm -rf $1/*app/*FM*
rm -rf $1/*app/*account*

# Gapps
app_list="BasicDreams PlayAuto DynamicSystem SpeechServices PhotoTable EmergenyInfo Google*Lens WfdService Game TouchAssistant Health MusicPlayerGO AEXPapers Superiorwalls Recorder Compass Warranty Map acebook YouTube Velvet PixelWall Micropaper Ornament DevicePersonalization Duo Pay pay Market Dreamliner Videos Gmail Browser Photos Keep Tips DevicePolicy arcore ARCORE AndroidAuto Verizon LiveWallpaper Scribe Calendar Chrome Drive GoogleOne GoogleAssist Bugle Tycho talkback Maestro UserCent OTA ppstore Diagnostics NgaResources BetaFeedback HelpRtcPrebuilt SafetyHub Sprint DCMO ConnMO GoogleCamera Wallpaper Euicc TTS"

for app in $app_list; do
rm -rf $1/*app/*$app*
rm -rf $1/*/*app/*$app*
done

# Pixel
rm -rf $1/system-ext/app/datastatusnotification
rm -rf $1/app/QAS_DVC_MSP_VZW
rm -rf $1/app/VZWAPNLib
rm -rf $1/app/vzw_msdc_api
rm -rf $1/priv-app/CNEService
rm -rf $1/priv-app/DMService
rm -rf $1/priv-app/VzwOmaTrigger
rm -rf $1/priv-app/qcrilmsgtunnel
rm -rf $1/product_services/priv-app/PrebuiltGmsCorePi/app_chimera
rm -rf $1/product/priv-app/PrebuiltGmsCoreQt/app_chimera
rm -rf $1/product/priv-app/PrebuiltGmsCore/app_chimera
rm -rf $1/etc/permissions/com.google.android.camera.experimental2017.xml

# Fix Files-DocumentsUI
rm -rf $1/product/overlay/PixelDocumentsUIOverlay

# Some Unused Google Apps
rm -rf $1/system_ext/priv-app/HbmSVManager
rm -rf $1/system_ext/priv-app/OBDM_Permissions
rm -rf $1/system_ext/priv-app/obdm_stub


#oppo
rm -rf $1/../my_heytap/app/*
rm -rf $1/../my_heytap/priv-app/*Google*
rm -rf $1/../my_heytap/priv-app/*Velvet*
rm -rf $1/../my_heytap/priv-app/*Setup*
rm -rf $1/../my_heytap/priv-app/*Auto*
rm -rf $1/../my_preload/app/*
rm -rf $1/../my_preload/del-app/*
rm -rf $1/../my_region/*app/*
rm -rf $1/../my_stock/app/*Game*
rm -rf $1/../my_stock/app/*KeKe*
rm -rf $1/../my_stock/app/*Karaoke*
rm -rf $1/../my_stock/app/*Recorder*
rm -rf $1/../my_stock/app/*Music*
rm -rf $1/../my_stock/app/*Compass*
rm -rf $1/../my_stock/app/*Pay*
rm -rf $1/../my_stock/app/*Health*
rm -rf $1/../my_stock/app/*realmeMovie*
rm -rf $1/../my_stock/del-app/*
rm -rf $1/../my_stock/priv-app/*KeKe*
rm -rf $1/../my_stock/priv-app/*Cast*
rm -rf $1/../my_stock/priv-app/*OShare*
rm -rf $1/../my_stock/priv-app/*SOS*
rm -rf $1/fonts/NotoSans*
rm -rf $1/fonts/NotoSerif*
rm -rf $1/*/*app/*Health*
rm -rf $1/*/*app/*OTA*
rm -rf $1/system_ext/media/notifications/*

rm -rf $1/preload/*
rm -rf $1/app/BackupRestore*
rm -rf $1/app/BTtestmode
rm -rf $1/app/Calculator2
rm -rf $1/app/ChildrenSpace
rm -rf $1/app/EmailPartnerProvider
rm -rf $1/app/FindMyPhoneClient
rm -rf $1/*app/*Game*
rm -rf $1/app/Ocrscanner
rm -rf $1/app/Oshare
rm -rf $1/app/OV*
rm -rf $1/app/com.*
rm -rf $1/app/OTA*
rm -rf $1/app/Health*
rm -rf $1/app/ModemTestMode
rm -rf $1/app/talkback
rm -rf $1/*app/*FM*
rm -rf $1/*app/*Recorder*
rm -rf $1/app/OppoCamera
rm -rf $1/app/OppoCompass2
rm -rf $1/app/OppoDCS
rm -rf $1/app/Youtube
rm -rf $1/app/SecurePay
rm -rf $1/app/SecureElement
rm -rf $1/app/SafeCenter
rm -rf $1/priv-app/BlackList
rm -rf $1/priv-app/BlackListApp
rm -rf $1/priv-app/*Browser*
rm -rf $1/priv-app/com.*
rm -rf $1/priv-app/sg.*
rm -rf $1/priv-app/Tag*
rm -rf $1/priv-app/NewSoundRecorder
rm -rf $1/priv-app/SOS*
rm -rf $1/priv-app/deezer*
rm -rf $1/priv-app/TestApp5G
rm -rf $1/priv-app/com.facebook.system
rm -rf $1/priv-app/SmartDrive
rm -rf $1/priv-app/OppoMusic
rm -rf $1/priv-app/OppoBootReg
rm -rf $1/priv-app/OppoGallery2
rm -rf $1/priv-app/VideoGallery
rm -rf $1/priv-app/Velvet
rm -rf $1/priv-app/VideoGallery
rm -rf $1/reserve
rm -rf $1/app/com.amazon.appmanager
rm -rf $1/*app/*facebook*
rm -rf $1/app/KeKeMarket
rm -rf $1/app/KeKePay
rm -rf $1/app/KeKeUserCenter
rm -rf $1/priv-app/KeKeMarket
rm -rf $1/priv-app/KeKePay
rm -rf $1/priv-app/KeKeUserCenter
rm -rf $1/app/NXPNfcNci
rm -rf $1/app/OcrScanner
rm -rf $1/app/OcrService
rm -rf $1/media/audio/ringtones/ringtone_01*
rm -rf $1/media/audio/ringtones/ringtone_02*
rm -rf $1/media/audio/notifications/notification_01*
rm -rf $1/fonts/D*
rm -rf $1/fonts/Source*


#asus
rm -rf $1/system_ext/apex/*v28*
rm -rf $1/apex/*v28*
rm -rf $1/app/Facebook*
rm -rf $1/app/Instagram
rm -rf $1/app/JakartaBaca
rm -rf $1/app/NextAppCore
rm -rf $1/app/TwinApps
rm -rf $1/app/TwinAppsService
rm -rf $1/priv-app/*LiveWallpaper*
rm -rf $1/priv-app/AsusCamera
rm -rf $1/priv-app/AsusDataTransfer
rm -rf $1/priv-app/AsusGallery
rm -rf $1/priv-app/Facebook*
rm -rf $1/priv-app/NextApp
rm -rf $1/priv-app/ROGAirTrigger
rm -rf $1/priv-app/ROGGameCenter
rm -rf $1/priv-app/SmartReading
rm -rf $1/priv-app/WeatherTime
rm -rf $1/priv-app/YandexApp
rm -rf $1/priv-app/YandexBrowser
rm -rf $1/product/app/ARCore
rm -rf $1/product/app/ASUSAR
rm -rf $1/product/app/CalendarGoogle
rm -rf $1/product/app/Chrome
rm -rf $1/product/app/Gmail2
rm -rf $1/product/app/GooglePay
rm -rf $1/product/app/GoogleTTS
rm -rf $1/product/app/Maps
rm -rf $1/product/app/Messages
rm -rf $1/product/app/YTMusic
rm -rf $1/product/app/YouTube
rm -rf $1/product/app/talkback
rm -rf $1/product/priv-app/AndroidAutoStub
rm -rf $1/product/priv-app/GoogleLens
rm -rf $1/product/priv-app/SearchSelector
rm -rf $1/product/priv-app/Velvet
rm -rf $1/product/priv-app/Wellbeing
rm -rf $1/system_ext/priv-app/EmergencyInfo
rm -rf $1/system_ext/priv-app/GoogleFeedback

# Drop some useless shits
rm -rf $1/etc/preload/*

# ZenUI debloat
rm -rf $1/app/ATOKIME
rm -rf $1/app/Amight
rm -rf $1/app/Facebook
rm -rf $1/app/FacebookMessenger
rm -rf $1/app/Instagram
rm -rf $1/app/JakartaBaca
rm -rf $1/app/NePlayer
rm -rf $1/app/NetflixActivation
rm -rf $1/app/Netflixstubplus
rm -rf $1/app/NextAppCore
rm -rf $1/app/OpenBeta
rm -rf $1/app/UNISONAIR
rm -rf $1/app/mangaDeals
rm -rf $1/app/slaservice
rm -rf $1/priv-app/AsusCalculator
rm -rf $1/priv-app/AsusCamera
rm -rf $1/priv-app/AsusContacts
rm -rf $1/priv-app/AsusDataTransfer
rm -rf $1/priv-app/AsusDeskClock
rm -rf $1/priv-app/AsusDialer
rm -rf $1/priv-app/AsusEmergencyHelp
rm -rf $1/priv-app/AsusGallery
rm -rf $1/priv-app/AsusGallery
rm -rf $1/priv-app/AsusGalleryBurst
rm -rf $1/priv-app/AsusSoundRecorder
rm -rf $1/priv-app/FacebookInstaller
rm -rf $1/priv-app/FacebookNotificationServices
rm -rf $1/priv-app/GameBroadcaster
rm -rf $1/priv-app/LogUploader
rm -rf $1/priv-app/MyASUS
rm -rf $1/priv-app/NextApp
rm -rf $1/priv-app/ONS
rm -rf $1/priv-app/ScreenRecorder
rm -rf $1/priv-app/TwinViewLauncher
rm -rf $1/priv-app/WeatherTime
rm -rf $1/priv-app/YandexApp
rm -rf $1/priv-app/YandexBrowser
rm -rf $1/priv-app/ZenUIHelp
rm -rf $1/product/app/ARCore
rm -rf $1/product/app/CalendarGoogle
rm -rf $1/product/app/Chrome
rm -rf $1/product/app/Gmail2
rm -rf $1/product/app/GooglePay
rm -rf $1/product/app/GoogleTTS
rm -rf $1/product/app/Maps
rm -rf $1/product/app/Messages
rm -rf $1/product/app/YTMusic
rm -rf $1/product/app/YouTube
rm -rf $1/product/app/talkback
rm -rf $1/product/priv-app/Turbo


app_list2="Amight AsusBoost AsusHBM AsusPAIStubR ATOKIME Game* FocusAppListener JakartaBaca mangaDeals NePlayer NetflixActivation OpenBeta SoterService SMMI_TOOL UNISONAIR AlwaysOn AsusCamera AsusCalculator AsusDataTransfer AsusGallery AsusGalleryBurst DiracAudioControlService GameBroadcaster LogUploader* MyASUS ROG5LiveWallpaper* ROGGameCenter ZenMotion Tag ASUSAR"
for app in $app_list2; do
rm -rf $1/*app/$app
rm -rf $1/*/*app/$app
done
