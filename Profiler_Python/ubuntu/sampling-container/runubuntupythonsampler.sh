echo "Enter the command to benchmark: "
read command
echo "Enter the time interval between each sample in seconds (Please enter an interval >= 1 s. Lower or fractional intervals can result in unexpected behavior due to processing overhead): "
read delta
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

echo "running..."

docker run --rm -it -v ${PWD}/$outdir:/.cprofiles -e PROFILER_TIME_STEPS=$delta "$imagetag" "$command"