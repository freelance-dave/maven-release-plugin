#!/bin/bash 
cd "$(dirname "${BASH_SOURCE:-$0}")" || exit  # Use scalar notation for BASH_SOURCE[0]

# Dryrun of releqse creation process 
mvn clean release:prepare -DdryRun=true

# Generates the following files;
echo "
	pom.xml.next
	pom.xml.releaseBackup
	pom.xml.tag
	release.properties
"

# Clean up - removes temp files etc.
mvn clean release:clean

