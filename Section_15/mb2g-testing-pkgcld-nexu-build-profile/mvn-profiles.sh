#!/bin/bash 
cd $(dirname ${BASH_SOURCE:-$0})  # Use scalar notation for BASH_SOURCE[0]

# List active profiles
mvn help:active-profiles

# Confirm that both packagecloud and nexus_distro profiles exist
mvn help:active-profiles -P packagecloud,nexus_distro

# Buld/deploy using the packagecloud and not nexus_distro profile
# (use ! or - to disable a profile)
mvn clean deploy -P packagecloud,!nexus_distro

# Buld/deploy using the nexus_distro and not packagecloud profile
# (use ! or - to disable a profile)
#mvn clean deploy -P \!packagecloud,nexus_distro

