#!/usr/bin/env bash

wget -q -O - https://pkg.jenkins.io/debian/jenkins-ci.org.key | sudo apt-key add -
echo deb https://pkg.jenkins.io/debian-stable binary/ | sudo tee /etc/apt/sources.list.d/jenkins.list
sudo apt-get update
sudo apt-get install default-jre -y
sudo apt-get install default-jdk -y

sudo apt-get install jenkins -y
sudo ufw allow OpenSSH -y
sudo ufw enable
sudo ufw allow 8080
sudo ufw status
sudo systemctl start jenkins -y
sudo systemctl status jenkins
sudo java -jar jenkins-cli.jar -s http://127.0.0.1:8080/ install-plugin swarm -y




if ! [ -L /var/www ]; then
  rm -rf /var/www
  ln -fs /vagrant /var/www
fi
