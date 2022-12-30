#!/bin/bash 
cd $(dirname ${BASH_SOURCE:-$0})  # Use scalar notation for BASH_SOURCE[0]

# !!IMPORATNT!! 
# Only run this script once Nexus is up and displaying it's welcome page

# Test: How to Open docker VM and view container volumn contents.
#docker run -it --rm --privileged --pid=host justincormack/nsenter1 

# Get the nexus server's admin password.
container_id=$(docker container ls --all --quiet --filter "name=nexus")
volumne_id=$(docker inspect --format '{{ range .Mounts }}{{ .Name }} {{ end }}' "$container_id")
mount_path=$(docker volume inspect --format '{{ .Mountpoint }}' $volumne_id)
password=$(docker run --rm --privileged --pid=host justincormack/nsenter1 /bin/bash -c "cat ${mount_path}/admin.password")

# Default user/password
# admin/admin123

echo "User: admin"
echo "Pass: $password"

