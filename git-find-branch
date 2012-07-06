#!/bin/bash

# Search all branches in a git repository for a filename with given regex
#
# Author: Handyman5 (http://stackoverflow.com/users/459089/handyman5)
#   Modified by Florian Rathgeber (@frathgeber, https://github.com/kynan)
#   Original credit: http://stackoverflow.com/a/372654/396967
#
# Installation: place somewhere in your $PATH and make exectuable
#
# Usage: "git find-branch <regex>"

LOC=refs/remotes/origin
#LOC=refs/heads  # to search local branches only

for branch in `git for-each-ref --format="%(refname)" $LOC`; do
  found=$(git ls-tree -r --name-only $branch | grep "$1")
  if [ $? -eq 0 ]; then
    echo ${branch#$LOC/}:; echo "  $found"
  fi
done
