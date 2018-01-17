#!/usr/bin/env bash

set -e

target=""
if [ ${ANDROID_TARGET} -gt 25 ] 
then
	target="system-images;android-${ANDROID_TARGET};google_apis_playstore;x86"
else	
	target="system-images;android-${ANDROID_TARGET};default;armeabi-v7a"	
fi

echo y | sdkmanager --update
echo y | sdkmanager --install $target
avdmanager create avd --force -n test -k $target -no-accel --device "Nexus 4" -c 2048M
QEMU_AUDIO_DRV=none $ANDROID_HOME/emulator/emulator -avd test -no-window -memory 2048 &

exit 0
