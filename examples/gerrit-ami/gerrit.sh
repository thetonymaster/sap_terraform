#!/usr/bin/env bash

wget https://www.gerritcodereview.com/download/gerrit-2.14.2.war //download gerrit

sudo yum -y update //update  yum

sudo yum install -y git //install git

git --version //verifying git is installed

sudo yum install -y java-1.8.0-openjdk.x86_64 //install java

sudo /usr/sbin/alternatives --set java /usr/lib/jvm/jre-1.8.0-openjdk.x86_64/bin/java 

sudo /usr/sbin/alternatives --set javac /usr/lib/jvm/jre-1.8.0-openjdk.x86_64/bin/javac

sudo yum remove -y java-1.7* //remove java 1.7
java -jar gerrit*.war init --batch --dev -d ~/gerrit_testsite 
git config --file ~/gerrit_testsite/etc/gerrit.config httpd.listenUrl 'http://localhost:8080' // URL that Gerrit listens to from * to localhost. This change helps prevent outside connections from contacting the instance.
~/gerrit_testsite/bin/gerrit.sh restart //restarting gerrit with new configuration //"Localhost" must be declared from the installation into aws










