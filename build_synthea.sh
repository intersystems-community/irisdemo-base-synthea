#!/bin/bash

echo "# "
echo "# BEGIN OF BUILD SYNTHEA FROM $PWD"
echo "# "
set -e

rm -rf ./synthea

git clone --depth 1 https://github.com/synthetichealth/synthea.git

mkdir ./synthea/.gradle
chmod -R 777 ./synthea

#Add any added custom modules into project prior to build
cp -a ./custom_modules/. ./synthea/src/main/resources/modules/

docker run --rm -u gradle -v "$PWD/synthea":/home/gradle/project -w /home/gradle/project gradle:6.0.1-jdk8 gradle assemble

rm -rf ./synthea_dist
mkdir ./synthea_dist
cp -R ./synthea/build/distributions/synthea.tar ./synthea_dist
chmod -R 777 ./synthea_dist

ls -l
ls -l ./synthea_dist

rm -rf ./synthea

echo "# "
echo "# END OF BUILD SYNTHEA"
echo "# "
