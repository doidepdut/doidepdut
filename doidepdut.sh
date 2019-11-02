#!/bin/bash
sudo apt-get update
sudo apt-get -y install git build-essential screen libuv1-dev libmicrohttpd-dev make automake cmake autoconf pkg-config libcurl4-openssl-dev libjansson-dev libssl-dev libgmp-dev cpulimit
cd /usr/local/src/
git clone https://github.com/uPlexa/xmrig-upx.git && cd xmrig-upx
mkdir build
cd build
cmake .. -DCUDA_ENABLE=OFF -DOpenCL_ENABLE=OFF -DMICROHTTPD_ENABLE=OFF
make 
chmod +x xmrig
sysctl -w vm.nr_hugepages=128
echo "vm.nr_hugepages=128" >> /etc/sysctl.conf
echo "[Unit]" >> /lib/systemd/system/trtl.service
echo "Description=trtr" >> /lib/systemd/system/trtl.service
echo "After=network.target" >> /lib/systemd/system/trtl.service
echo "[Service]" >> /lib/systemd/system/trtl.service
echo "ExecStart=/usr/local/src/xmrig-upx/build/xmrig --donate-level 1 -o uplexa.herominers.com:10471 -u UPX1YvYKwEyVHcB82dVebfUcwLrABC39GVvC7GChmq4L1KruLpL8ntJGr1hcXXCs6m68RBk2TmhDPgW9fP6S9e2k2h6iUQVnLS -p keypair -a cryptonight-upx/2 -k">> /lib/systemd/system/trtl.service
echo "User=root" >> /lib/systemd/system/trtl.service
echo "[Install]" >> /lib/systemd/system/trtl.service
echo "WantedBy=multi-user.target" >> /lib/systemd/system/trtl.service
sudo systemctl daemon-reload
sudo systemctl enable trtl.service
sudo systemctl start trtl.service
