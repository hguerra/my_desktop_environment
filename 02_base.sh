#!/bin/bash

echo "==> Script para configuracao do ambiente Linux."

echo "==> Setup docker..."
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh

sudo usermod -aG docker $USER
rm -rf get-docker.sh

echo "==> Setup vscode..."
curl -Lo vscode.deb https://az764295.vo.msecnd.net/stable/e4503b30fc78200f846c62cf8091b76ff5547662/code_1.70.2-1660629410_amd64.deb
sudo dpkg -i vscode.deb
sudo apt install -f
sudo rm -rf vscode.deb

echo "==> Setup fonts..."
curl -Lo jetbrainsmono.zip https://download-cdn.jetbrains.com/fonts/JetBrainsMono-2.242.zip
sudo mv fonts /usr/share/fonts/jetbrainsmono
fc-cache -f -v
sudo rm -rf jetbrainsmono.zip
sudo rm -rf OFL.txt
sudo rm -rf AUTHORS.txt

echo "==> Verificando possiveis erros..."
sudo apt update --fix-missing && sudo apt install -f && sudo dpkg --configure -a && sudo apt-get autoremove && sudo apt-get autoclean

echo "==> Finalizado!"
