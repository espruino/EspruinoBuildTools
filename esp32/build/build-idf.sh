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
# initialise the submodule folder
# This will need to be tied to a release
git submodule update --init
cd esp-idf
git checkout v2.0-rc2
git submodule update --init
cd ../app
make clean
make -j 5
# This is not the firmware - get rid of it!
rm build/espruino-esp32.bin
make app.tgz
cd ../Espruino
make clean
make
echo flashing instructions here...
