#!/bin/bash
# INSTALL PLUGINS

function waitForJenkins() {
    echo "Waiting jenkins to launch on 8080..."

    while ! nc -z localhost 8080; do
      sleep 0.1 # wait for 1/10 of the second before check again
    done

    echo "Jenkins launched"
}

PASS=$(sudo bash -c "cat /var/lib/jenkins/secrets/initialAdminPassword")

sudo service jenkins start

waitForJenkins

sleep 10

for i in {1..5}; do sudo java -jar /var/lib/jenkins/jenkins-cli.jar -s http://localhost:8080 -auth admin:$PASS install-plugin ${plugins} && break || sleep 15; done


# RESTART JENKINS TO ACTIVATE PLUGINS
sudo java -jar /var/lib/jenkins/jenkins-cli.jar -s http://localhost:8080 -auth admin:$PASS restart
