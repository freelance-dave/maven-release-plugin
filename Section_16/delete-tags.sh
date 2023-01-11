#!/opt/homebrew/bin/bash
#
# Script to delete unwanted release tags

tags=(
mb2g-release-plugin-1.10
mb2g-release-plugin-1.11
mb2g-release-plugin-1.12
mb2g-release-plugin-1.13
mb2g-release-plugin-1.14
mb2g-release-plugin-1.15
mb2g-release-plugin-1.16
mb2g-release-plugin-1.2
mb2g-release-plugin-1.3
mb2g-release-plugin-1.4
mb2g-release-plugin-1.5
mb2g-release-plugin-1.6
mb2g-release-plugin-1.7
mb2g-release-plugin-1.8
mb2g-release-plugin-1.9
)

for t in "${tags[@]}"
do
    git tag -d $t
    git push --delete github "$t"
done
