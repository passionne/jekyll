#!/bin/bash
set -e

bundle exec jekyll build

git checkout gh-pages

rm -rf .sass-cache
rsync -av _site/ .

git add -A
git commit -am "auto-commit generated pages at $(date "+%Y-%m-%d_%H-%M-%S")"

git push origin gh-pages
git checkout master

