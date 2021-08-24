#!/bin/bash
echo "Found the following dangling images: "
docker images --filter "dangling=true" -q --no-trunc

read -p "Do you with to remove these images to free space? " -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
	docker rmi $(docker images --filter "dangling=true" -q --no-trunc)
else
	echo "exiting... "
fi


