#!/usr/bin/env bash

# hexo generate static file
cd ~/project/blog
hexo clean
hexo g
cp ~/project/blog/static/img/* ~/project/blog/public/img

# copy static file into local github.io repository
rm -rf ~/project/bluzoey.github.io/*
cp -r ~/project/blog/public/* ~/project/bluzoey.github.io/

# push to origin blog management repository
cd ~/project/blog
git pull
git add .
git commit -m "deploy.sh: update blog management repository"
git push origin

# push to origin deployment repository
cd ~/project/bluzoey.github.io
git pull
git add .
git commit -m "deploy.sh: deploy new file"
git push origin
