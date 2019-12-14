#!/bin/bash

echo "# "
echo "# BEGIN OF BUILD SYNTHEA FROM $PWD"
echo "# "
set -e

rm -rf ./synthea

git clone --depth 1 https://github.com/synthetichealth/synthea.git

mkdir ./synthea/.gradle
chmod -R 777 ./synthea
docker run --rm -u gradle -v "$PWD/synthea":/home/gradle/project -w /home/gradle/project gradle:6.0.1-jdk8 gradle assemble

rm -rf ./dist
mkdir ./dist
cp ./synthea/build/distributions/synthea.tar ./dist
chmod -R 777 ./dist
ls -l ./dist

rm -rf ./synthea

echo "# "
echo "# END OF BUILD SYNTHEA"
echo "# "
