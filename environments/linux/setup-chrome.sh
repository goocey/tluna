#!/bin/bash
wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo apt update 
sudo apt install -y google-chrome-stable