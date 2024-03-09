#!/bin/bash
# adjust paths to this folder versions
export ESP_IDF_PATH=`pwd`/esp-idf
export IDF_PATH=`pwd`/esp-idf
export ESP_APP_TEMPLATE_PATH=`pwd`

cd app
make app.tgz
cd ../Espruino

rm -r  app
rm -r esp-idf

# copy newly build libs and expand
tar xfz ../../deploy/esp-idf.tgz
tar xfz ../../deploy/app.tgz

git fetch
git checkout $espruino_branch
git pull
# reset the IDF_PATH
source ./scripts/provision.sh ESP32
make clean
BOARD=ESP32 make
ln -s app/build/bootloader/bootloader.bin
ln -s app/build/partitions_espruino.bin
cat targets/esp32/README_flash.txt
