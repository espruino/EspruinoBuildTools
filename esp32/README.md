Is this the repository you are looking for?
===========================================

This repository is used to build the esp-idf libaries required to link to espruino, and used used by the Travis CI system to check the compilation of pushes to Github.


Prerequisites
=============

```
sudo apt-get update
sudo apt-get install -y \
  build-essential git python python-pip curl libncurses-dev gperf
sudo pip install --upgrade pip
sudo pip install pyserial
```

If you want build espruino,this is all that is required for 64 bit linux:

```
git clone https://github.com/espruino/Espruino.git
cd Espruino
source scripts/provision.sh ESP32
make clean && BOARD=ESP32 make
```

If you want to build using the latest esp-idf sources, then perhaps you want to build the complete source.

```
git clone --recursive https://github.com/espruino/EspruinoBuildTools.git
cd EspruinoBuildTools/esp32/build
source ./build-idf.sh v4.4.4 master fresh
```
