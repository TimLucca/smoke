#!/usr/bin/env bash
gem install bundle
bundle install --gemfile=./Gemfile
ruby test/test_runner.rb