#!/usr/bin/env zsh
#shellcheck shell=bash
# Cleanup log from previous attach
rm -f nohup.out
# GH login
if ! (gh auth status); then gh auth login; fi
