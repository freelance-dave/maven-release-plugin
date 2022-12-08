#!/bin/bash
cd $(dirname ${BASH_SOURCE:-$0})  # Use scalar notation for BASH_SOURCE[0]

echo "Running the Maven dependency tree command"
mvn dependency:tree

