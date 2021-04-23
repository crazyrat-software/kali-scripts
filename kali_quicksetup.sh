#!/bin/bash

#quick and dirty preparation of kali instance


if [ $UID -ne 0 ]; then
 echo "root privs are required"
 exit
fi

echo "[-] sys update..."
apt update
apt install git python3-pip libxml2-dev libxslt1-dev
apt install -y docker.io


echo "[-] darkarmour"
cd /opt
git clone https://github.com/bats3c/darkarmour
apt install mingw-w64-tools mingw-w64-common g++-mingw-w64 gcc-mingw-w64 upx-ucl osslsigncode


echo "[-] impacket"
cd /opt
git clone https://github.com/SecureAuthCorp/impacket && cd /opt/impacket
pip3 install .

echo "[-] autobrute"
cd /opt
git clone https://github.com/Random936/autobrute && cd /opt/autobrute
pip3 install -r requirements.txt


echo "[-] shad0w"
cd /root
git clone https://github.com/bats3c/shad0w.git && cd /opt/shad0w
./shad0w install


#echo "[-] UDP protocol scanner'
#git clone https://github.com/CiscoCXSecurity/udp-proto-scanner

echo "[-] theHarvester"
cd /opt
git clone https://github.com/laramies/theHarvester

echo "[-] dnsrecon"
cd /opt
git clone https://github.com/darkoperator/dnsrecon

echo "[-] spraying tookit"
cd /opt
git clone https://github.com/byt3bl33d3r/SprayingToolkit && cd /opt/SprayingToolkit
pip3 install -r requirements.txt