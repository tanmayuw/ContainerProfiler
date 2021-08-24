#!/bin/bash
source $PWD/build.cfg

if [ "$CHECK_ONLINE_RESPONSE" = "${answer#[Yy]}" ] ;
then
	docker pull "$ONLINE_IMAGE" ;
else
	docker build -t "$BUILD_IMAGE_TAG" .
fi