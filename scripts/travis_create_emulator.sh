#!/usr/bin/env bash

set -e

target="system-images;android-${ANDROID_TARGET};google_apis_playstore;x86"
echo y | sdkmanager --update
echo y | sdkmanager --install $target
avdmanager create avd --force -n test -k $target --device "Pixel" -c 2048M
QEMU_AUDIO_DRV=none $ANDROID_HOME/emulator/emulator -avd test -no-window -memory 2048 &

exit 0
