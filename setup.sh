#! /usr/bin/env bash
# Downloading submodules
git submodule init
git submodule update

# Symlink for ocsinventoryng plugin
ln -s $(readlink -f ocsinventoryng/) $(readlink -f glpi/plugins/ocsinventoryng/)

# Staring docker stack
docker-compose up --build -d