#!/bin/bash
cd $(dirname ${BASH_SOURCE:-$0})  # Use scalar notation for BASH_SOURCE[0]

function delete_container {
    local nexus_id
    nexus_id=$(docker container ls --all --quiet --filter "name=$1")
    [ ! -z "$nexus_id" ] && docker rm -f "$nexus_id" > /dev/null 2>&1 
}

function drop_all_volumns {
    yes | docker volume prune > /dev/null 2>&1
}

# Start nexus docker container
docker stop --time=120 nexus

delete_container "nexus"
#drop_all_volumns 
