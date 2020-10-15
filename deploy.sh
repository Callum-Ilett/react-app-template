#!/bin/bash
set -xe

if [ $TRAVIS_BRANCH == 'main' ] ; then
  eval "$(ssh-agent -s)"
  ssh-add
  npm run build
  rsync -rq --delete --rsync-path="cd public && rsync" \
  $TRAVIS_BUILD_DIR travis@142.93.36.116
else
  echo "Not deploying, since this branch isn't main."
fi