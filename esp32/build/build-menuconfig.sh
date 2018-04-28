cd Espruino
source ./scripts/provision.sh ESP32
cd ..
export IDF_PATH=$ESP_IDF_PATH
# adjust paths to this folder versions
export ESP_IDF_PATH=`pwd`/esp-idf
export ESP_APP_TEMPLATE_PATH=`pwd`
cd app
make menuconfig
