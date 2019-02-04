#!/bin/bash
sudo apt update && sudo apt install build-essential git libfftw3-dev cmake libusb-1.0-0-dev -y
wget http://www.sdrplay.com/software/SDRplay_RSP_API-Linux-2.13.1.run
sudo chmod 755 SDRplay_RSP_API-Linux-2.13.1.run
sudo ./SDRplay_RSP_API-Linux-2.13.1.run
sudo bash -c 'echo -e "\n# for SDRPlay:\nblacklist sdr_msi3101\nblacklist msi001\nblacklist msi2500\n" >> /etc/modprobe.d/blacklist.conf'
sudo update-initramfs -u
sudo rmmod blacklist sdr_msi3101
sudo rmmod blacklist msi001
sudo rmmod blacklist msi2500
git clone https://github.com/simonyiszk/openwebrx.git
git clone https://github.com/simonyiszk/csdr.git
cd csdr
sudo make
sudo make install
cd ../..
git clone https://github.com/pothosware/SoapySDR
cd SoapySDR
mkdir build
cd build
sudo cmake ..
sudo make 
sudo make install
sudo ldconfig
cd ../..
git clone https://github.com/rxseger/rx_tools
cd rx_tools
mkdir build
cd build
sudo cmake ..
sudo make 
sudo make install
sudo ldconfig
cd ..
git clone https://github.com/pothosware/SoapySDRPlay.git
cd SoapySDRPlay
mkdir build
cd build
sudo cmake ..
sudo make
sudo make install
cd ../..
echo -e "\n\n\n\n\n\nOK, Done.\nYour system will reboot in 10s.\nPress Ctrl+C to cancel.\nAfter that, use:'SoapySDRUtil --make' and 'SoapySDRUtil --find' to apply your device."
sleep 10 && reboot
