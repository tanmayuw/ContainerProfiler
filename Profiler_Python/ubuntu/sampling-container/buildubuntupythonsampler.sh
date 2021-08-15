read -r -p "Check online for the image? [y/N] " response
#if [ "$response" =~ ^([yY][eE][sS]|[yY])$ ];
if [ "$response" = "${answer#[Yy]}" ] ;
then
	docker pull biodepot/profiler:ubuntu ; # Needs to be set to latest ubuntu-py release!
else
	echo "enter image tag (all small letters): "
	read imageTag
	docker build -t $imageTag .
fi