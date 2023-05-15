#!/usr/bin/env zsh
#shellcheck shell=bash
# GH login
if ! (gh auth status); then gh auth login; fi
