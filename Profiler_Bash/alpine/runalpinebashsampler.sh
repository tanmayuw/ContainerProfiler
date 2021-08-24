#!/bin/bash
source run.cfg
mkdir $OUTDIR

result=$(docker images -q "$RUN_IMAGE_TAG" )

echo "Result...."
echo "$result"

if [ -n "$result" ] ; then
  echo "image exists"
else
  echo "image missing, building"
  docker build -t "$RUN_IMAGE_TAG" .  
fi

#echo docker run --rm -it -v $PWD/$outdir:/.cprofiles alpinepythonsampler $command
echo "running..."
#docker run --rm -it -v ${PWD}/$outdir:/.cprofiles -e DELTA="$delta" "$imagetag" "$command"

docker run --rm  -it -v $PWD/$OUTDIR:"/$PROFILER_OUTPUT_DIR" -e OUTPUTDIR="$PROFILER_OUTPUT_DIR" -e VERBOSITY="$VERBOSITY" -e DELTA="$DELTA" "$RUN_IMAGE_TAG" "$COMMAND"