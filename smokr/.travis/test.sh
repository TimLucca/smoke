#!/usr/bin/env bash
gem install bundle
bundle install --gemfile=./Gemfile
bundle exec rake
