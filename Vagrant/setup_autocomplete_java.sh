#!/bin/bash

# get the maven project file-name, file must be stored at /vagrant
MAVEN_PROJECT=$1

echo "SYNCHING MAVEN DIRECTORY"
rsync -a ~/.m2/ /vagrant/Vagrant/.m2
echo "BUILDING DEFAULT .classpath FILE for /vagrant/$MAVEN_PROJECT"
cd /vagrant/$MAVEN_PROJECT
mvn dependency:build-classpath -Dmdep.outputFile=.classpath
echo "REBUILDING .classpath FILE"
sed -i "s/\/home\/vagrant\/.m2/..\/Vagrant\/.m2/g" .classpath
