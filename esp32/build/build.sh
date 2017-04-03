if [ ! -d "Espruino" ]; then
git clone https://github.com/espruino/Espruino.git
fi
source ./Espruino/scripts/provision.sh ESP32
make clean && make
