#!/bin/bash

echo "==> Script para configuracao do ambiente Linux."

echo "==> Setup asdf plugins..."
asdf plugin-add nodejs git@github.com:asdf-vm/asdf-nodejs.git
asdf plugin-add java https://github.com/halcyon/asdf-java.git
asdf plugin-add golang https://github.com/kennyp/asdf-golang.git

asdf plugin list

asdf install nodejs lts
asdf reshim nodejs
asdf global nodejs lts

asdf install java corretto-17.0.4.9.1
asdf reshim java
asdf global java corretto-17.0.4.9.1

asdf install golang 1.19
asdf reshim golang
asdf global golang 1.19

echo "==> Finalizado!"
