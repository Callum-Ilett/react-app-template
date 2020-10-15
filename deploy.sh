#!/bin/bash
set -xe

if [ $TRAVIS_BRANCH == 'main' ] ; then
  eval "$(ssh-agent -s)"
  ssh-add
  npm run build
  rsync -a build/ travis@142.93.36.116:/home/callum/public
else
  echo "Not deploying, since this branch isn't main."
fi