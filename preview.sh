#!/usr/bin/env bash

# hexo generate static file
cd ~/project/blog
hexo clean
hexo g
cp ~/project/blog/static/img/* ~/project/blog/public/img

# preview in browser
hexo server