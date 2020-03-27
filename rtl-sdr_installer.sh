#!/bin/bash
apt install build-essential git libfftw3-dev cmake libusb-1.0-0-dev -y
#git clone https://github.com/keenerd/rtl-sdr.git
git clone https://github.com/bclswl0827/rtl-sdr.git
cd rtl-sdr/
mkdir build
cd build
cmake ../ -DINSTALL_UDEV_RULES=ON
make
make install
ldconfig
cd ../..
bash -c 'echo -e "\n# for RTL-SDR:\nblacklist dvb_usb_rtl28xxu\n" >> /etc/modprobe.d/blacklist.conf'
update-initramfs -u
rmmod dvb_usb_rtl28xxu
git clone https://github.com/simonyiszk/openwebrx.git
git clone https://github.com/jketterl/csdr
cd csdr
make
make install
cd /root
echo -e "\n\n\n\n\n\nOK, Done.\nAfter that, edit 'openwebrx/config_webrx.py' and run 'python openwebrx.py'.\nEnjoy!"
