#!/bin/bash

for filename in ./l7_config/*.json; do
  curl localhost:8500/v1/config -XPUT -d @$filename
  echo "Loaded $filename"
done 
