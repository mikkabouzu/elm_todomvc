#!/usr/bin/env bash

rm -rf dist
yarn build

tail -n+2 .gitignore > .gitignore-without-dist
rm .gitignore
mv .gitignore-without-dist .gitignore

git add .
git commit -m "deploy"
git push origin `git subtree split --prefix dist -b gh-pages`:gh-pages --force
git b -D gh-pages

git reset --hard HEAD~1
