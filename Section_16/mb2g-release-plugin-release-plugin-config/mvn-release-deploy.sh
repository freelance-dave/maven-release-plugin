#!/bin/bash 
cd "$(dirname "${BASH_SOURCE:-$0}")" || exit  # Use scalar notation for BASH_SOURCE[0]

# GIT - to emable fetch/pull set the local branch to track the remote upstream 
git config remote.github.url >&- || git remote add github git@github.com:freelance-dave/maven-release-plugin.git
git branch -u github/Section_16

# Create and push the release (tag and push to GitHub)
mvn clean release:prepare

exit 0

# Pull the release from GitHub, build and publish to packagecloud
mvn release:perform
