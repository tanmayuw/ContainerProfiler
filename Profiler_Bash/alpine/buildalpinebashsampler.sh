#!/bin/bash
source $PWD/build.cfg

if [ "$CHECK_ONLINE_RESPONSE" = "${answer#[Yy]}" ] ;
then
	docker pull "$ONLINE_IMAGE" ; # Needs to be set to latest release! #TODO on dockerhub
else
	docker build -t "$BUILD_IMAGE_TAG" .
fi