#!/bin/bash

# Print the status of all git repositories under the current directory
#
# Author: Justin Lilly (http://justinlilly.com/dotfiles/git.html)
#   Modified by Florian Rathgeber (@frathgeber, https://github.com/kynan)
#
# Installation: place somewhere in your $PATH and make exectuable
#
# Usage: "git allstatus"

# TODO:
#   - Figure out how to make -prune work so I don't have to use grep -v
#   - add the sed command to -exec param
#   - do better filtering of git status. Might require moving this out
#     of bash and using something like dulwich

cd $HOME
echo "Searching for git repositories.."
for dir in `find . -name ".git" -type d 2>/dev/null | grep -v "env" | grep -v ".virtualenv" | sed 's/\/.git//g'`
do
    echo "=== $dir ==="
    pushd $dir
    git status -sb
    popd
done
