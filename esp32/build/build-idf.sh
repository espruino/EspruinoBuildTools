if [ ! -d "Espruino" ]; then
git clone https://github.com/espruino/Espruino.git
fi

if ! type xtensa-esp32-elf-gcc > /dev/null; then
    echo Looking for xtensa-esp32-elf-gcc
       if [ -d "xtensa-esp32-elf" ]; then
           export PATH=$PATH:`pwd`/xtensa-esp32-elf/bin/
       fi
fi

source ./Espruino/scripts/provision-framework.sh ESP32
#cd Espruino
#make clean && make
export IDF_PATH=$ESP_IDF_PATH
cd esp-idf
git submodule update --init
cd ../app
make -j 5
build/espruino-esp32.bin
make build.tar
