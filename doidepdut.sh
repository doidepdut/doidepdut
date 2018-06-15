#!/bin/bash
sudo apt-get update
sudo apt-get -y install screen git make automake build-essential autoconf pkg-config libcurl4-openssl-dev libjansson-dev libssl-dev libgmp-dev
sudo sysctl -w vm.nr_hugepages=$((`grep -c ^processor /proc/cpuinfo` * 3))
git clone https://github.com/JayDDee/cpuminer-opt && cd cpuminer-opt && chmod +x build.sh && ./build.sh
CFLAGS="-march=native" ./configure
make
echo "cpuminer is starting"
screen -S cpuminer 
screen -d -m ./cpuminer -a lyra2z330 -o stratum+tcp://hxx-pool2.chainsilo.com:3032 -u nodata.1 -p x -t 3
