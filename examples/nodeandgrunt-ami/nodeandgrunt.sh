#!/usr/bin/env bash

yum clean all -y
sudo yum update -Y
curl --silent --location https://rpm.nodesource.com/setup_4.x | bash -
sudo yum -y install nodejs
sudo yum install gcc-c++ make
sudo npm install -g grunt-cli
