#!/bin/bash

set -e

#export SAUCE_ACCESS_KEY=`echo $SAUCE_ACCESS_KEY | rev`
BROWSERS="BS_Chrome,BS_Safari,BS_Firefox,BS_IE_8,BS_IE_9,BS_IE_10,BS_IE_11"
E2E_BROWSERS="BS_Chrome"

if [ $JOB = "unit" ]; then
  grunt ci-checks
  grunt test:docgen
  grunt test:promises-aplus
  grunt test:unit --browsers $BROWSERS --reporters dots
elif [ $JOB = "e2e" ]; then
  grunt test:e2e --browsers SL_Chrome --reporters dots
else
  echo "Unknown job type. Please set JOB=unit or JOB=e2e."
fi
