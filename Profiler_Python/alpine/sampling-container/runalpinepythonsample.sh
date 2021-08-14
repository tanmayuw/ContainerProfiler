echo "Enter the command to benchmark: "
read command
echo "Enter output directory: "
read outdir
echo "Enter image tag: "
read imagetag

mkdir $outdir


result=$(docker images -q "$imagetag" )

echo "Result...."
echo "$result"

if [ -n "$result" ] ; then
  echo "image exists"
else
  echo "image missing, building"
  docker build -t "$imagetag" .  
fi

#echo docker run --rm -it -v $PWD/$outdir:/.cprofiles alpinepythonsampler $command
echo "running..."
docker run --rm -it -v ${PWD}/$outdir:/data -e PROFILER_OUTPUT_DIR=/data "$imagetag" "$command"
