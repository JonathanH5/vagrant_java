#!/bin/bash

PROJECT_NAME=$1
URL=$2

# load project to user directory and install
echo "SETTING UP $PROJECT_NAME"
cd /vagrant
if [ ! -d "$PROJECT_NAME" ]; then
  echo "CLONING $PROJECT_NAME FROM $URL"
  git clone $2
else
  echo "DIRECTORY FOUND, DON'T NEED TO CLONE"
fi
cd $PROJECT_NAME
mvn clean package
