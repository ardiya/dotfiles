#!/usr/bin/env bash
# Git global config

# Signing keys are used to sign Git commits and tags. This process ensures the integrity and authenticity of your commits, verifying that they have not been tampered with and that they indeed come from you. Signing commits adds a layer of security, making it harder for malicious actors to impersonate you.
git config --global user.signingkey ~/.ssh/id_rsa
