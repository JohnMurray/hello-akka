#!/bin/bash

sudo apt-get update
sudo apt-get upgrade

sudo apt-get install -y git htop make dos2unix
sudo apt-get install -y openjdk-7-jdk openjdk-7-jre
wget http://scalasbt.artifactoryonline.com/scalasbt/sbt-native-packages/org/scala-sbt/sbt//0.12.2/sbt.deb
sudo dpkg -i sbt.deb

cd $HOME
rm -rf dotfiles
git clone git://github.com/JohnMurray/dotfiles.git
cd dotfiles
./install.py

cd $HOME
rm -rf hello-akka
git clone git://github.com/JohnMurray/hello-akka.git hello-akka
cd ./hello-akka/

wget http://downloads.typesafe.com/akka/akka-2.2.1.tgz
tar xzf akka-2.2.1.tgz
mv akka-2.2.1 akka
rm akka-2.2.1.tgz
dos2unix akka/bin/akka


echo
echo
echo 'Getting ready to run...'
echo
echo

sleep 2

make run
