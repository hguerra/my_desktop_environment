#!/bin/bash

echo "==> Script para configuracao do ambiente Linux."

echo "==> Update..."
sudo apt update -y

echo "==> Upgrade..."
sudo apt upgrade -y
sudo apt dist-upgrade -y

echo "==> Instalando SO lib..."
sudo apt install -y make build-essential checkinstall software-properties-common ppa-purge dirmngr apt-transport-https lsb-release ca-certificates gnupg zip unzip git curl wget winbind zsh terminator baobab vim

echo "==> Setup python..."
sudo apt install -y libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev libyaml-dev sqlite3 libxslt1-dev libcurl4-openssl-dev libpq-dev
sudo apt install -y postgresql-client-14
sudo apt install -y python python3
sudo apt install -y python-setuptools python3-setuptools
sudo apt install -y python3-dev
sudo apt install -y python3-pip
sudo apt install -y python3-venv
sudo pip3 install pipenv
pip3 install pipenv

echo "==> Setup chrome..."
curl -Lo chrome.deb https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i chrome.deb
sudo apt install -f
sudo rm -rf chrome.deb

echo "==> Verificando possiveis erros..."
sudo apt update --fix-missing && sudo apt install -f && sudo dpkg --configure -a && sudo apt-get autoremove && sudo apt-get autoclean

echo "==> Finalizado!"
