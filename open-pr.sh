#!/bin/bash

pushd ../nupic.core
git pull upstream master
SHA=`git log -1 --pretty=oneline | sed -E "s/^([^[:space:]]+).*/\1/" | tr -d ' '`
popd
git checkout -b core-update-${SHA}
echo $SHA > nupic_sha.txt
git add nupic_sha.txt
git commit -m "Updated NuPIC Core SHA."
# git push origin core-update-${SHA}
git pull-request -m "Updates nupic.core to ${SHA}."
git checkout master