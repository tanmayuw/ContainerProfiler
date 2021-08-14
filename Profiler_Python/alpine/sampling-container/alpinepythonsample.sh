echo "Enter the command to benchmark: \n"
read command
echo "Enter output directory: \n"
read outdir 

mkdir $outdir

if [[ "$(docker images -q myimage:mytag 2> /dev/null)" == "" ]]; then
  docker build -t alpinepythonsampler . #can be set to standard name
fi

echo docker run --rm -it -v $PWD/$outdir:/.cprofiles alpinepythonsampler $command
docker run --rm -it -v ${PWD}/$outdir:/data -e PROFILER_OUTPUT_DIR=/data alpinepythonsampler "$command"
