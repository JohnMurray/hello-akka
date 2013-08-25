all: build deploy
run: build deploy start

build:
	sbt package:clean
	sbt package

start:
	./akka/bin/akka HelloWorldKernel

deploy:
	mv target/scala-2.10/hello-akka_2.10-0.0.1.jar akka/deploy/


view-jar-conf:
	rm -rf /tmp/jar
	mkdir -p /tmp/jar
	cd /tmp/jar && jar xf /Users/jmurray/IdeaProjects/HelloAkka/akka/deploy/hello-akka_2.10-0.0.1.jar
	vim /tmp/jar/application.conf
