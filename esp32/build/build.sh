if [ ! -d "Espruino" ]; then
git clone https://github.com/espruino/Espruino.git
fi
source ./Espruino/scripts/provision-framework.sh ESP32
cd Espruino
make clean && make
