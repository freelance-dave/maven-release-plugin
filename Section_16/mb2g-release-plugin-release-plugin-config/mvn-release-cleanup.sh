#!/bin/bash 
cd "$(dirname "${BASH_SOURCE:-$0}")" || exit  # Use scalar notation for BASH_SOURCE[0]

# Clean up after a release - removes temp files etc.
mvn clean release:clean


