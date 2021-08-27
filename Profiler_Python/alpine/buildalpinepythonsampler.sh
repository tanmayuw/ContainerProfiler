#!/bin/bash
source $PWD/build.cfg

if [ "$CHECK_ONLINE_RESPONSE" = "${answer#[Yy]}" ] ;
then
	docker pull "$ONLINE_IMAGE" ;
else
	cp ../src/profiler .
	cp ../src/rudataall-psutil.py .
	docker build -t "$BUILD_IMAGE_TAG" .
	rm ./profiler
	rm ./rudataall-psutil.py
fi
