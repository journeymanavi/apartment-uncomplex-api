#!/bin/bash

set -e

cat << EOF
Packaging build artifacts for:
  Repo: $TRAVIS_REPO_SLUG
Branch: $TRAVIS_BRANCH
Commit: $TRAVIS_COMMIT
   Tag: $TRAVIS_TAG
Build#: $TRAVIS_BUILD_NUMBER
EOF

# go to the build directory just to be sure
cd $TRAVIS_BUILD_DIR

# extract just the repo owner from TRAVIS_REPO_SLUG and create a dir
repo_owner=`echo ${TRAVIS_REPO_SLUG} | cut -d"/" -f1`
mkdir -p $repo_owner

# cleanup any old package file
rm -rf ${TRAVIS_REPO_SLUG}*.tar.gz

# construct the package file name based on the Github tag
package_file=${TRAVIS_REPO_SLUG}-${TRAVIS_TAG}.tar.gz

# Create the package
tar -czf $package_file package.json yarn.lock server.js LICENSE

echo "Successfully created package: $package_file"