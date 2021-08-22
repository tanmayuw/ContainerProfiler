#!/bin/bash
echo "Found the following dangling images: "
docker images --filter "dangling=true" -q --no-trunc

echo "remove all to free space?(y/N)"
read response

if [ "$response" = "${answer#[Yy]}" ] ;
then
	docker rmi $(docker images --filter "dangling=true" -q --no-trunc)
else
	echo "exiting... "
fi