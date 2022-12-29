#!/bin/bash
cd $(dirname ${BASH_SOURCE:-$0})  # Use scalar notation for BASH_SOURCE[0]

# Generate master passward encryption
mvn --encrypt-master-password <password>
