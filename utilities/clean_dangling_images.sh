#!/bin/bash
echo "Found the following dangling images: "
docker images --filter "dangling=true" -q --no-trunc

read -p "Do you with to remove these images to free space? " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
	echo "removing..."
	docker rmi $(docker images --filter "dangling=true" -q --no-trunc)
	echo "done"
else
	echo "exiting... "
fi


