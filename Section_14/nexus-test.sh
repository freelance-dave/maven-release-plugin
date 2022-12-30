#!/bin/bash
cd $(dirname ${BASH_SOURCE:-$0})  # Use scalar notation for BASH_SOURCE[0]

# test that nexus is up and running
curl http://localhost:8081/
