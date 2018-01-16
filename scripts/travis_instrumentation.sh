#!/usr/bin/env bash

set -e

echo "Starting emulator for $COMPONENT tests"
./scripts/travis_create_emulator.sh &

./gradlew assembleDebug \
  assembleDebugAndroidTest \
  --parallel \
  -PDISABLE_ERROR_PRONE

echo "Waiting for emulator..."
android-wait-for-emulator

for i in {1..3}; do ./gradlew connectedDebugAndroidTest && break; done

