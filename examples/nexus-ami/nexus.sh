#!/usr/bin/env bash


sudo yum update -y
sudo yum install default-jdk -y
sudo yum install git -y
udo yum install -y java-1.8.0-openjdk.x86_64

sudo /usr/sbin/alternatives --set java /usr/lib/jvm/jre-1.8.0-openjdk.x86_64/bin/java

sudo /usr/sbin/alternatives --set javac /usr/lib/jvm/jre-1.8.0-openjdk.x86_64/bin/javac

sudo yum remove -y java-1.7*
wget https://download.sonatype.com/nexus/3/latest-unix.tar.gz

sudo tar -xvzf latest-unix.tar.gz

cd nexus-3.7.1-02/
cd bin
sudo ./nexus run
