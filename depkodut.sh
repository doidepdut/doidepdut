#!/bin/bash
sudo apt-get update
sudo apt-get -y install git build-essential screen libuv1-dev libmicrohttpd-dev make automake cmake autoconf pkg-config libcurl4-openssl-dev libjansson-dev libssl-dev libgmp-dev
sudo sysctl -w vm.nr_hugepages=$((grep -c ^processor /proc/cpuinfo * 3))
git clone https://github.com/webchain-network/webchain-miner.git && cd webchain-miner
mkdir build
cd build
cmake ..
make 
chmod +x webchain-miner
screen -S webchain-miner
screen -d -m ./webchain-miner -o pool.webchain.network:3333 -u 0xd73051a93ebc69b885f645fb80e5336aa03ade49 -p x -t 2 --worker-id 9999 --donate-level=1
