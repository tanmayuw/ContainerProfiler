echo "Enter the command to benchmark: \n"
read command
echo "Enter output directory: \n"
read outdir 

mkdir $outdir

docker build -t ubuntupythonsampler .

echo docker run --rm -it -v $PWD/$outdir:/.cprofiles ubuntupythonsampler $command
docker run --rm -it -v ${PWD}/$outdir:/data -e PROFILER_OUTPUT_DIR=/data ubuntupythonsampler "$command"
