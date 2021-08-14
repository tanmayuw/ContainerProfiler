read -r -p "Check online for the image? [y/N] " response
#if [ "$response" =~ ^([yY][eE][sS]|[yY])$ ];
if [ "$response" = "${answer#[Yy]}" ] ;
then
	docker pull biodepot/profiler:alpine_3.7 ; # Needs to be set to latest release!
else
	echo "enter image tag (all small letters): "
	read imageTag
	docker build -t $imageTag .
fi
