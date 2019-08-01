#!/bin/bash

declare -r IMAGE_NAME="gps-sdr-sim"
declare -r VERSION="1.0"

BUILD='docker/build'

mkdir -p $BUILD
make 

cp gps-sdr-sim $BUILD
cp brdc3540.14n $BUILD
cp scripts/start.sh $BUILD

cd player
make plutoplayer
cp plutoplayer ../$BUILD
cd ..

cd docker
docker build --tag $IMAGE_NAME:$VERSION .

cd ..

echo "Done"