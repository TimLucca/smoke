#!/usr/bin/env bash

cd ~/prog/ruby/rubyRunner
docker build -t mine2295/rubby_runner:m .
docker push mine2295/rubby_runner:m
bpython -i auto.py