read -r -p "Check online for the image? [y/N] " response
if [ "$response" = "${answer#[Yy]}" ] ;
then
	docker pull biodepot/profiler:alpine_3.7 ; # Needs to be set to latest release! #TODO on dockerhub
else
	echo "enter image tag (all small letters): "
	read imageTag
	docker build -t $imageTag .
fi