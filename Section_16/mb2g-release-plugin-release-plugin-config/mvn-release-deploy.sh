#!/bin/bash 
cd "$(dirname "${BASH_SOURCE:-$0}")" || exit  # Use scalar notation for BASH_SOURCE[0]

# Create and push the release (tag and push to GitHub)
mvn clean release:prepare

exit 0

# Pull the release from GitHub, build and publish to packagecloud
mvn release:perform
