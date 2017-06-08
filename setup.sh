#! /usr/bin/env bash
# Downloading submodules
git submodule init
git submodule update

# Install ocsinventoryng plugin
rm -rf glpi/plugins/ocsinventoryng/
cp -avr ocsinventoryng/ glpi/plugins/ocsinventoryng/

# Staring docker stack
docker-compose up --build -d