#!/bin/sh

# Generate ssh-key
ssh-keygen -t rsa

# print the public key
cat ~/.ssh/id_rsa.pub

# add keys
ssh-add