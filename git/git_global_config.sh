#!/usr/bin/env bash
# Git global config

# https://docs.github.com/en/authentication/managing-commit-signature-verification/telling-git-about-your-signing-key
git config --global --unset gpg.format
git config --global commit.gpgsign true
git config --global user.signingkey 750AE4F7043810EE
