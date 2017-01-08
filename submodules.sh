#! /bin/sh

# Sorry.

git submodule init
git submodule update

echo 'Initializing engine dependencies...'
cd libs/engine
git submodule init
git submodule update
