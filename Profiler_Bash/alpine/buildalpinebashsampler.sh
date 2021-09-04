#!/bin/bash
#author: Tanmay Shah <tanmay@uw.edu>
source $PWD/build.cfg

if [ "$CHECK_ONLINE_RESPONSE" = "${answer#[Yy]}" ] ;
then
	docker pull "$ONLINE_IMAGE" ; # Needs to be set to latest release! #TODO on dockerhub
else
	cp ../src/entrypoint.sh .
	cp ../src/rudataall.sh .
	docker build -t "$BUILD_IMAGE_TAG" .
	rm -rf ./entrypoint.sh
	rm -rf ./rudataall.sh
fi
