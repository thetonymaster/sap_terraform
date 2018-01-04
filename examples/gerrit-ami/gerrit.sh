#!/usr/bin/env bash

wget https://www.gerritcodereview.com/download/gerrit-2.14.2.war

sudo apt-get update -y
sudo apt-get install default-jdk -y
sudo apt-get install git -y
java -jar gerrit*.war init --batch --dev -d ~/gerrit_testsite
git config --file ~/gerrit_testsite/etc/gerrit.config httpd.listenUrl 'http://localhost:8080'
~/gerrit_testsite/bin/gerrit.sh restart










if ! [ -L /var/www ]; then
  rm -rf /var/www
  ln -fs /vagrant /var/www
fi
