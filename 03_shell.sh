#!/bin/bash

echo "==> Script para configuracao do ambiente Linux."

echo "==> Setup oh-my-zsh..."
curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -o get-zsh.sh
sh get-zsh.sh
rm -rf get-zsh.sh
sudo chsh -s $(which zsh) $USER

echo "==> Finalizado!"
