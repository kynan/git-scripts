#!/bin/bash

# Exit whenever an intermediary command fails
set -o errexit

# Permanently delete files/folders from the history of your git repository.
#
# Author: David Underhill (http://dound.com/)
#   Modified by Florian Rathgeber (@frathgeber, https://github.com/kynan)
#   Original credit:
#   http://dound.com/2009/04/git-forever-remove-files-or-folders-from-history/
#
# Installation: place somewhere in your $PATH and make exectuable
#
# Usage: "git purge-files <path1> [<path2> ...]"

if [ $# -eq 0 ]; then
  echo "Usage: git purge-files <path1> [<path2> ...]" 1>&2
  exit 1
fi

# make sure we're at the root of git repo
if [ ! -d .git ]; then
  echo "Error: must run this script from the root of a git repository" 1>&2
  exit 1
fi

# remove all paths passed as arguments from the history of the repo
files=$@
git filter-branch --index-filter "git rm -rf --cached --ignore-unmatch $files" HEAD

# remove the backup original ref git-filter-branch keeps and clean
rm -rf .git/refs/original/
git reflog expire --all
git gc --aggressive --prune
