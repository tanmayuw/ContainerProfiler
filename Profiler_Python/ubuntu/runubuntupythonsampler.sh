#!/bin/bash
source $PWD/run.cfg

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

echo "running..."

docker run --rm -it -v ${PWD}/$OUTDIR:"/$PROFILER_OUTPUT_DIR" -e PROFILER_OUTPUT_DIR="/$PROFILER_OUTPUT_DIR" -e PROFILER_TIME_STEPS="$DELTA" -e VERBOSITY="$VERBOSITY" "$RUN_IMAGE_TAG" "$COMMAND"