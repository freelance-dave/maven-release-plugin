#!/bin/bash
cd $(dirname ${BASH_SOURCE:-$0})  # Use scalar notation for BASH_SOURCE[0]

echo "Build and run Hello World from the command line"
javac HelloWorld.java
java HelloWorld

echo "Build a Jar file and run that from the command line"
jar cf myjar.jar HelloWorld.class
java -classpath myjar.jar HelloWorld

echo "Build and run Hello World (2) with a dependency"
javac -classpath ./lib/* HelloWorld2.java
java -classpath './lib/*:./' HelloWorld2

