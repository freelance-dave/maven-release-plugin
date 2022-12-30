#!/bin/bash
cd $(dirname ${BASH_SOURCE:-$0})  # Use scalar notation for BASH_SOURCE[0]

# For x64 use offical image:
# docker run -d -p 8081:8081 --name nexus sonatype/nexus3

# else, For aarch64 use unoffical image:
docker pull klo2k/nexus3:latest
docker run -d -p 8081:8081 --name nexus --platform 'linux/arm64' klo2k/nexus3


