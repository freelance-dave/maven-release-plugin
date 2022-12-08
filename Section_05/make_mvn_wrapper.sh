#!/bin/bash
cd $(dirname ${BASH_SOURCE:-$0})  # Use scalar notation for BASH_SOURCE[0]

# Create the maven wrapper for your prokect, it makes your build self contained
# and portable as the user/CI doesn't need the maven executable installed.

version=3.6.1
regex="Apache Maven ([0-9]+.[0-9]+.[0-9]+)*"
[[ "$(mvn --version)" =~ $regex ]] && version="${BASH_REMATCH[1]}"

echo "Making Maven wrapper (mvnw) script"
mvn -N io.takari:maven:wrapper -Dmaven="${version}"

