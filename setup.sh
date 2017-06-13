#! /usr/bin/env bash
# Downloading submodules
git submodule init
git submodule update

# Install ocsinventoryng plugin
rm -rf glpi/plugins/ocsinventoryng/
cp -ar ocsinventoryng/ glpi/plugins/ocsinventoryng/
cp config_db.php glpi/config/

# Staring docker stack
unset CHECK
docker-compose up --build -d && \
until [[ $CHECK == 0 ]]; do
	docker logs glpi-server 2>&1 | grep 'fpm is running' > /dev/null 2>&1
	export CHECK=$?
done \
&& echo "ENV is up & running"
