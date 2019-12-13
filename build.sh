#!/bin/bash

# Build synthea distribution tar file
./synthea/build_synthea.sh

# Containerize it
docker build -t intersystemsdc/irisdemo-base-synthea:latest .
