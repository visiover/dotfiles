#!/bin/bash

# Create PRs from development to main for multiple repos in the same folder
# You need hub command in order for this to work

REPOS=(
    repo1
    repo2
    )


for REPO in "${REPOS[@]}"; do
     echo "* "$REPO":"
     cd $(pwd)/$REPO
     hub pull-request -m "Deploy to production" -b main -h development
     echo "\n"
     cd ..
done
