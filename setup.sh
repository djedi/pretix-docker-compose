#!/usr/bin/env bash

# install docker
apt install docker.io

# install portainer
docker volume create portainer_data
docker run -d -p 8000:8000 -p 9443:9443 --name portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce:latest

# Create folder structure for pretix
mkdir /var/pretix-data
chown -R 15371:15371 /var/pretix-data
mkdir /var/pgdata

# Config directory and file for pretix
mkdir /etc/pretix
cp ./pretix.cfg /etc/pretix/pretix.cfg
chown -R 15371:15371 /etc/pretix
chmod 0700 /etc/pretix/pretix.cfg

# Run docker compose file
cp ./pretix.service /etc/systemd/system/pretix.service
systemctl daemon-reload
systemctl enable pretix
systemctl start pretix

# Create cron job
(crontab -l 2>/dev/null; echo "15,45 * * * * /usr/bin/docker exec pretix.service pretix cron") | crontab -