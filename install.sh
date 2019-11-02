#!/bin/bash

echo "==> Script para configuracao do ambiente Linux."


echo "==> Update..."
sudo apt update -y


echo "==> Instalando SO lib..."
sudo apt install -y  make build-essential checkinstall software-properties-common ppa-purge dirmngr apt-transport-https lsb-release ca-certificates zip unzip git curl wget winbind zsh terminator baobab vim


echo "==> Instalando driver video..."
sudo apt-add-repository -y ppa:graphics-drivers/ppa && sudo apt update -y && sudo ubuntu-drivers autoinstall


echo "==> Upgrade..."
sudo apt upgrade -y
sudo apt dist-upgrade -y


echo "==> Setup python..."
sudo apt install -y libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev libyaml-dev sqlite3 libxslt1-dev libcurl4-openssl-dev libpq-dev
sudo apt install -y postgresql-client-11
sudo apt install -y python python3
sudo apt install -y python-setuptools python3-setuptools
sudo apt install -y python3-dev
sudo apt install -y python3-pip
sudo apt install -y python3-venv
sudo pip3 install pipenv
pip3 install pipenv


# echo "==> Aplicando ajuste no Linux Deepin..."
# https://unix.stackexchange.com/questions/520715/deepin-15-10-error-could-not-find-a-distribution-template-for-deepin-stable
# ls /etc/apt/sources.list.d
# sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys <KEY>
# sudo sed -i 's/unstable/stable/g' /usr/share/python-apt/templates/Deepin.info


echo "==> Add Repositorios."
sudo apt-add-repository ppa:ansible/ansible -y

wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list

sudo apt update -y
sudo apt upgrade -y


echo "==> Setup ansible..."
sudo apt install -y ansible


echo "==> Setup virtualbox..."
sudo apt install -y virtualbox


# echo "==> Setup vagrant..."
# sudo apt install -y vagrant
# vagrant plugin install vagrant-disksize


echo "==> Setup docker..."
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
sudo usermod -aG docker $USER
rm -rf get-docker.sh

sudo curl -L "https://github.com/docker/compose/releases/download/1.24.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose


echo "==> Setup kubectl e minikube..."
curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl
chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl

curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
chmod +x minikube
sudo mv minikube /usr/local/bin/minikube


echo "==> Instalando SDKMAN!..."
curl -fsSL "https://get.sdkman.io" -o get-sdk.sh
echo 'source "$HOME/.sdkman/bin/sdkman-init.sh"' | sudo tee -a ~/.zshrc > /dev/null
sh get-sdk.sh
rm -rf get-sdk.sh


echo "==> Instalando NVM..."
curl -fsSL https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.0/install.sh -o get-nvm.sh
sh get-nvm.sh
rm -rf get-nvm.sh
echo 'export NVM_DIR="$HOME/.nvm"' | sudo tee -a ~/.zshrc > /dev/null
echo '[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm' | sudo tee -a ~/.zshrc > /dev/null

echo "==> Carregando variaveis de ambiente..."
mkdir "$HOME/bin"
echo 'export PATH="$HOME/bin:$PATH"' | sudo tee -a ~/.zshrc > /dev/null
source ~/.zshrc


echo "==> Configurando ambiente de desenvolvimento..."
sudo chmod -R 777 $HOME/.sdkman
sdk install java 11.0.4-zulu
sdk install kotlin
sdk install micronaut


sudo chmod -R 777 $HOME/.nvm
nvm install --lts
npm install -g generator-jhipster


echo "==> Instalando programas base..."
sudo apt install -y snapd flatpak 
sudo apt install -y vlc bleachbit gparted hardinfo psensor thunderbird remmina kazam deja-dup mypaint mypaint-data-extras nixnote2 filezilla putty synaptic
sudo apt install -y qbittorrent youtube-dlg
sudo apt install -y ffmpeg # Converter video: ffmpeg -i input.mp4 -c:v libvpx-vp9 -crf 30 -b:v 0 -b:a 128k -c:a libopus output.webm

sudo snap install code-insiders --classic
sudo snap install intellij-idea-community --classic
sudo snap install pycharm-community --classic
sudo snap install spotify

sudo snap install google-cloud-sdk --classic
sudo snap install robo3t-snap

sudo snap install insomnia

sudo flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
sudo flatpak install flathub com.syntevo.SmartGit


# Opcionais
# sudo snap install zaproxy --classic
# sudo snap install okular
# sudo snap install slack --classic
# sudo snap install wavebox
# sudo snap install zenkit
# sudo snap install odrive-unofficial
# sudo snap install skype --classic
# sudo flatpak install flathub com.jgraph.drawio.desktop
# sudo flatpak install flathub net.xmind.XMind8
# sudo flatpak install flathub com.github.muriloventuroso.easyssh
# sudo flatpak install flathub org.qgis.qgis
# sudo flatpak install flathub org.zealdocs.Zeal


echo "==> Instalando sublimetext..."
sudo apt install -y sublime-text


echo "==> Instalando chromium"
sudo apt install -y chromium-browser


echo "==> Instalando chrome..."
wget -O chrome.deb https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i chrome.deb
sudo apt install -f
sudo rm -rf chrome.deb

echo "==> Instalando dropbox..."
wget -O dropbox.deb https://www.dropbox.com/download?dl=packages/ubuntu/dropbox_2019.02.14_amd64.deb
sudo dpkg -i dropbox.deb
sudo apt install -f
sudo rm -rf dropbox.deb

echo "==> Instalando MongoDBCompass..."
wget -O mongodbcompass.deb https://downloads.mongodb.com/compass/mongodb-compass_1.19.12_amd64.deb
sudo dpkg -i mongodbcompass.deb
sudo apt install -f
sudo rm -rf mongodbcompass.deb

echo "==> Instalando dbeaver..."
wget -O dbeaver.deb https://dbeaver.io/files/dbeaver-ce_latest_amd64.deb
sudo dpkg -i dbeaver.deb
sudo apt install -f
sudo rm -rf dbeaver.deb

echo "==> Instalando office..."
wget -O wps.deb http://kdl.cc.ksosoft.com/wps-community/download/8865/wps-office_11.1.0.8865_amd64.deb
sudo dpkg -i wps.deb
sudo apt install -f
sudo rm -rf wps.deb

# ou

#flatpak install flathub com.wps.Office


echo "==> Verificando possiveis erros..."
# https://cleuber.com.br/index.php/2017/09/04/o-que-fazer-depois-de-instalar-o-linux-deepin-15-4-1
# https://cleuber.com.br/index.php/2015/11/27/como-usar-o-comando-rsync-para-transferir-dados-para-diretorios-locais-e-remotos
sudo apt update --fix-missing && sudo apt install -f && sudo dpkg --configure -a && sudo apt-get autoremove && sudo apt-get autoclean


echo "==> Instalando temas..."
sudo add-apt-repository ppa:system76/pop -y
sudo apt update -y && sudo apt install -y gnome-tweaks dconf-editor pop-theme ttf-mscorefonts-installer fonts-firacode


echo "==> Setup oh-my-zsh..."
curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -o get-zsh.sh
sh get-zsh.sh
rm -rf get-zsh.sh
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
sudo chsh -s $(which zsh) $USER


echo "==> Finalizado!"

