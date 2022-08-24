#!/bin/bash

echo "==> Script para configuracao do ambiente Linux."

echo "==> Setup asdf..."
git clone https://github.com/asdf-vm/asdf.git ~/.asdf
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# vim .zshrc
# plugins=(git zsh-syntax-highlighting zsh-autosuggestions asdf)

source ~/.zshrc

echo "==> Finalizado!"
