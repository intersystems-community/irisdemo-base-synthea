#!/bin/bash

#docker run --name synthea-docker phillip/synthea-docker:latest

docker run --rm -v $PWD/output:/output --name synthea-docker intersystemsdc/irisdemo-base-synthea:latest -p 5
