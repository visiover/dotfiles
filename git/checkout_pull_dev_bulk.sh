#!/bin/bash

# Checkout and update development branch

REPOS=(
    repo1
    repo2
    )


for REPO in "${REPOS[@]}"; do
     echo "* "$REPO":"
     cd $(pwd)/$REPO
     git checkout development; git pull origin development; git pull;
     echo "\n"
     cd ..
done
