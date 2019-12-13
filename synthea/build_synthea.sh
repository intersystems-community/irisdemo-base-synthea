#!/bin/bash

set -e

rm -rf ./synthea

git clone --depth 1 https://github.com/synthetichealth/synthea.git

docker run --rm -u gradle -v "$PWD/synthea":/home/gradle/project -w /home/gradle/project gradle gradle assemble

rm -rf ./dist
mkdir ./dist
cp ./synthea/build/distributions/synthea.tar ./dist

rm -rf ./synthea