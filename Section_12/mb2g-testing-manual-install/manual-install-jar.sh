#!/bin/bash
cd $(dirname ${BASH_SOURCE:-$0})  # Use scalar notation for BASH_SOURCE[0]

# manually install a 3rd party JAR (oracle ojdbc11.jar) into local maven repository
mvn install:install-file \
    -Dfile=./ojdbc11.jar \
    -DgroupId=com.oracle \
    -DartifactId=ojdbc11 \
    -Dversion=21.8.0.0 \
    -Dpackaging=jar
