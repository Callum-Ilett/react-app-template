#!/bin/bash
set -xe

if [ $TRAVIS_BRANCH == 'main' ] ; then
  eval "$(ssh-agent -s)"
  ssh-add ~/.ssh/id_rsa
  npm run build
  rsync -a --exclude={'/node_modules','/src','/public'} build/ travis@142.93.36.116:/home/callum/hello
else
  echo "Not deploying, since the branch isn't main."
fi