#!/bin/bash

# https://gorails.com/setup/ubuntu/19.10
sudo apt install -y curl

sudo apt-get update -y
sudo apt-get install -y git-core zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev software-properties-common libffi-dev libpq-dev mysql-client libmysqlclient-dev

# https://yoember.com/nodejs/the-best-way-to-install-node-js-with-yarn/
# nvm ls-remote | tail -n9
nvm install 12.13.0
nvm use 12.13.0
nvm alias default 12.13.0
nvm current 12.13.0

npm install -g npm
nvm install 12 --reinstall-packages-from=12 --latest-npm

npm i -g yarn

cd
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.zshrc
echo 'eval "$(rbenv init -)"' >> ~/.zshrc
exec $SHELL

git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.zshrc
exec $SHELL

rbenv install 2.6.5
rbenv global 2.6.5
ruby -v

gem install bundler
rbenv rehash

gem install rails -v 6.0.0
rails -v

# Final Steps
# docker run --name pg -p "5432:5432" -e POSTGRES_USER=myapp -e POSTGRES_PASSWORD=myapp -e POSTGRES_DB=test -v /var/run/postgresql:/var/run/postgresql -d postgres:12

# Note that this will expect a postgres user with the same username
# as your app, you may need to edit config/database.yml to match the
# user you created earlier
# rails new myapp -d postgresql

# Move into the application directory
# cd myapp

# If you setup MySQL or Postgres with a username/password, modify the
# config/database.yml file to contain the username/password that you specified

# Create the database
# rake db:create

# rails server

# docker stop pg
# docker rm pg
