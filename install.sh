#!/bin/bash

echo "==> Script para configuracao do ambiente Linux."

echo "==> Add Repositorios."
sudo add-apt-repository ppa:videolan/stable-daily -y
sudo add-apt-repository ppa:nilarimogard/webupd8 -y 
sudo add-apt-repository ppa:qbittorrent-team/qbittorrent-stable -y 
sudo apt-add-repository ppa:ansible/ansible -y

wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list

echo "==> Update."
sudo apt update -y
sudo apt upgrade -y
sudo apt dist-upgrade -y

echo "==> Instalando SO lib..."
sudo apt -y install software-properties-common dirmngr apt-transport-https lsb-release ca-certificates zip unzip git curl wget ttf-mscorefonts-installer software-properties-gtk winbind dirmngr

echo "==> Setup python..."
sudo apt install -y make build-essential checkinstall libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev libyaml-dev sqlite3 libxslt1-dev libcurl4-openssl-dev libpq-dev
sudo apt install -y python python3 python3-dev python3-pip python3-venv pipenv
sudo apt install -y ansible python-apt

echo "==> Setup vagrant..."
sudo apt -y install virtualbox virtualbox-ext-pack vagrant
vagrant plugin install vagrant-disksize

echo "==> Setup docker..."
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
sudo usermod -aG docker $USER
rm -rf get-docker.sh

echo "==> Setup minikube..."
curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl
chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl

curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
chmod +x minikube
sudo mv minikube /usr/local/bin/minikube

echo "==> Setup zsh..."
curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -o get-zsh.sh
sudo sh get-zsh.sh
rm -rf get-zsh.sh
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
sudo chsh -s $(which zsh) $USER

echo "==> Instalando SDKMAN!..."
curl -fsSL "https://get.sdkman.io" -o get-sdk.sh
echo 'source "$HOME/.sdkman/bin/sdkman-init.sh"' | sudo tee -a ~/.zshrc > /dev/null
sudo sh get-sdk.sh
rm -rf get-sdk.sh

echo "==> Instalando NVM..."
curl -fsSL https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.0/install.sh -o get-nvm.sh
sudo sh get-nvm.sh
rm -rf get-nvm.sh
echo 'export NVM_DIR="$HOME/.nvm"' | sudo tee -a ~/.zshrc > /dev/null
echo '[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm' | sudo tee -a ~/.zshrc > /dev/null

echo "==> Carregando variaveis de ambiente..."
source ~/.zshrc

echo "==> Configurando ambiente de desenvolvimento..."
sudo chmod -R 777 $HOME/.sdkman
sdk install java 11.33.15-zulu
sdk install kotlin
sdk install micronaut

sudo chmod -R 777 $HOME/.nvm
nvm install --lts
npm install -g generator-jhipster

echo "==> Instalando programas base..."
sudo apt -y install snapd flatpak 
sudo apt -y install vlc bleachbit qbittorrent youtube-dlg gparted hardinfo psensor thunderbird remmina kazam deja-dup mypaint mypaint-data-extras nixnote2 filezilla putty synaptic
sudo apt -y install ffmpeg # Converter video: ffmpeg -i input.mp4 -c:v libvpx-vp9 -crf 30 -b:v 0 -b:a 128k -c:a libopus output.webm

sudo snap install intellij-idea-community --classic
sudo snap install pycharm-community --classic
sudo snap install spotify

sudo snap install google-cloud-sdk --classic
sudo snap install robo3t-snap
sudo snap install zaproxy --classic
sudo snap install slack --classic
sudo snap install insomnia
sudo snap install okular

sudo flatpak install flathub io.dbeaver.DBeaverCommunity
sudo flatpak install flathub com.syntevo.SmartGit
sudo flatpak install flathub org.zealdocs.Zeal
sudo flatpak install flathub com.jgraph.drawio.desktop
sudo flatpak install flathub net.xmind.XMind8
sudo flatpak install flathub com.github.muriloventuroso.easyssh

# Opcionais
sudo snap install wavebox
sudo snap install zenkit
sudo snap install odrive-unofficial
#sudo snap install skype --classic
#sudo flatpak install flathub org.qgis.qgis

echo "==> Instalando sublimetext..."
sudo apt -y install sublime-text

echo "==> Instalando chrome..."
wget -O chrome.deb https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i chrome.deb
sudo apt install -f
sudo rm -rf chrome.deb

echo "==> Instalando opera..."
wget -O opera.deb https://download3.operacdn.com/pub/opera/desktop/63.0.3368.107/linux/opera-stable_63.0.3368.107_amd64.deb
sudo dpkg -i opera.deb
sudo apt install -f
sudo rm -rf opera.deb

echo "==> Instalando MongoDBCompass..."
wget -O mongodbcompass.deb https://downloads.mongodb.com/compass/mongodb-compass_1.19.12_amd64.deb
sudo dpkg -i mongodbcompass.deb
sudo apt install -f
sudo rm -rf mongodbcompass.deb

#echo "==> Instalando office..."
#wget -O wps.deb http://kdl.cc.ksosoft.com/wps-community/download/8865/wps-office_11.1.0.8865_amd64.deb
#sudo dpkg -i wps.deb
# sudo apt install -f
#sudo rm -rf wps.deb

# ou

#flatpak install flathub com.wps.Office

echo "Verificando possiveis erros..."
# https://cleuber.com.br/index.php/2017/09/04/o-que-fazer-depois-de-instalar-o-linux-deepin-15-4-1
# https://cleuber.com.br/index.php/2015/11/27/como-usar-o-comando-rsync-para-transferir-dados-para-diretorios-locais-e-remotos
sudo apt update --fix-missing && sudo apt install -f && sudo dpkg --configure -a && sudo apt-get autoremove && sudo apt-get autoclean

echo "Finalizado!"
