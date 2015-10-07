#!/usr/bin/env bash

sudo apt-get -y install openjdk-7-jre-headless

#Install Elasticsearch
# wget -qO - https://packages.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -
# echo "deb http://packages.elastic.co/elasticsearch/1.6/debian stable main" | sudo tee -a /etc/apt/sources.list.d/elasticsearch-1.6.list
# sudo apt-get -y update
# sudo apt-get -y install elasticsearch
wget https://download.elastic.co/elasticsearch/elasticsearch/elasticsearch-1.7.1.deb
sudo dpkg -i elasticsearch-1.7.1.deb
sudo update-rc.d elasticsearch defaults 95 10
sudo service elasticsearch restart

#Install Kibana

#Plugin
PATH_PLUGIN="/usr/share/elasticsearch/bin/plugin"
"$PATH_PLUGIN" install royrusso/elasticsearch-HQ

