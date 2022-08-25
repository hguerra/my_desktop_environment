#!/bin/bash

echo "==> Script para configuracao do ambiente Linux."

echo "==> Setup others..."
sudo apt install -y vlc bleachbit gparted hardinfo psensor kazam mypaint mypaint-data-extras synaptic ffmpeg flameshot dos2unix gnome-shell-extensions chrome-gnome-shell gir1.2-gtop-2.0 lm-sensors

sudo snap install insomnia
sudo snap install spotify

echo "==> Verificando possiveis erros..."
sudo apt update --fix-missing && sudo apt install -f && sudo apt-get autoremove && sudo apt-get autoclean

echo "==> Finalizado!"
