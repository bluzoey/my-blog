#!/usr/bin/env bash

# hexo generate static file
cd ~/project/blog
hexo clean
hexo g
cp static/img/* public/img

# preview in browser
hexo server