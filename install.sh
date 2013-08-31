#!/bin/bash

sudo apt-get update
sudo apt-get upgrade

sudo apt-get install -y git htop make
sudo apt-get install -y openjdk-7-jdk openjdk-7-jre
wget http://scalasbt.artifactoryonline.com/scalasbt/sbt-native-packages/org/scala-sbt/sbt//0.12.2/sbt.deb

cd $HOME
git clone git://github.com/JohnMurray/hello-akka.git hello-akka
cd ./hello-akka/

wget http://downloads.typesafe.com/akka/akka-2.2.1.tgz
tar xzf akka-2.2.1.tgz
mv akka-2.2.1 akka
rm akka-2.2.1.tgz
