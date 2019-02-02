#!/bin/bash
#esp_idf_branch=${1:-v2.0}
#esp_idf_branch=${1:-v2.1}
#espruino_branch=${2:-master}
#esp_idf_branch=${1:-v3.0}
#espruino_branch=${2:-ESP32-v3.0}
esp_idf_branch=${1:-v3.1.2}
espruino_branch=${2:-master}
#espruino_branch=${2:-ESP32-V3.1}
checkout_mode=${3:-none}
# Fresh cleans down to get new release
checkout_mode=${3:-fresh}
echo using esp-idf branch $esp_idf_branch, espruino branch $espruino_branch, checkout mode $checkout_mode

if [ ! -d "Espruino" ]; then
git clone https://github.com/espruino/Espruino.git
fi

if ! type xtensa-esp32-elf-gcc > /dev/null; then
    echo Looking for xtensa-esp32-elf-gcc
       if [ -d "xtensa-esp32-elf" ]; then
           export PATH=$PATH:`pwd`/xtensa-esp32-elf/bin/
       fi
fi
cd Espruino
source ./scripts/provision.sh ESP32
cd ..
if [ "$checkout_mode" = "fresh" ]
then
        echo "refreshing to new sdk"
	rm -r esp-idf
	curl -L -o esp-idf-$esp_idf_branch.zip https://github.com/espressif/esp-idf/releases/download/$esp_idf_branch/esp-idf-$esp_idf_branch.zip
 	unzip -q esp-idf-$esp_idf_branch.zip -d .
 	mv esp-idf-$esp_idf_branch esp-idf
fi

echo `pwd`

# adjust paths to this folder versions
export ESP_IDF_PATH=`pwd`/esp-idf
export IDF_PATH=`pwd`/esp-idf
export ESP_APP_TEMPLATE_PATH=`pwd`
cd app
make clean
make
#make -j 5
# This is not the firmware - get rid of it!
echo `pwd`
rm build/espruino-esp32.elf
make app.tgz
cd ..
