#!/bin/bash

# https://itsfoss.com/reduce-overheating-laptops-linux/
sudo add-apt-repository ppa:linrunner/tlp
sudo apt-get update
sudo apt-get install -y tlp tlp-rdw
sudo apt-get install -y lm-sensors hddtemp psensor
