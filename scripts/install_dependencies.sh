#!/bin/bash
set -euo pipefail

echo "--- :rubygems: Install dependencies in Gemfile"
bundle config set path ~/vendor/bundle
bundle install