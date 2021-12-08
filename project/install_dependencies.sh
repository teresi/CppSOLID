#!/bin/bash

PROJECT_DIR=$(pwd)

sudo add-apt-repository ppa:mhier/libboost-latest
sudo apt update

# NB the author used 1.68 in his lectures
sudo apt install libboost1.70-dev
cat /usr/include/boost/version.hpp | grep "BOOST_LIB_VERSION"

sudo apt-get install -y libgtest-dev google-mock cmake valgrind

cd /usr/src/gtest/
sudo cmake CMakeLists.txt
sudo make -j all install

cd /usr/src/gmock
sudo cmake CMakeLists.txt
sudo make -j all install

cd $PROJECT_DIR
