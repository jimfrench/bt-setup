#!/bin/bash

#Example script for bluesnarfer environment setup

#check we are running as root, otherwise exit
[ "$EUID" -ne 0 ] && { echo "This script needs root privileges, exiting."; exit; }

echo "Setting up environment for bluesnarfer and related exploit tools" $MAC
echo "Creating device nodes..."

#Create device nodes
mkdir -p /dev/bluetooth/rfcomm
mknod -m 666 /dev/bluetooth/rfcomm/0 c 216 0

#Check creation was successful, otherwise exit
[ -e /dev/bluetooth/rfcomm/0 ] && echo "Device node created successfully or already exists." || { echo "Device node creation failure, exiting."; exit; }

#Start bluetooth service if not already started
systemctl start bluetooth

#Show status of bluetooth system service
systemctl status bluetooth

exit
