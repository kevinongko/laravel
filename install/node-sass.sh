#!/bin/sh
#

apk --update --no-cache add git build-base perl python

BRANCH="master"

echo "Building branch $BRANCH"

mkdir -p "/build/$BRANCH"

git clone https://github.com/sass/node-sass.git

cd node-sass
git checkout "$BRANCH"
git submodule update --init --recursive

npm install
node scripts/build -f

cd vendor
for file in $(find . -type f); do
	DEST=$(echo "$file" | awk 'BEGIN { FS = "/" } ; {print $2"_"$3}')
	cp $file "/build/$BRANCH/$DEST"
done