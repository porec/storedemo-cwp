#!/bin/bash
desired_label='"app":"damn_small_vulnerable_web"'
label=$(docker image inspect --format '{{json .}}' $IMAGE_NAME | jq -r '. | {Labels: .Config.Labels}' | grep  '"application": "damn_small_vulnerable_web"' | tr -d ' ')
if [ "$label" == "$desired_label" ]; then
   echo "all good"
   exit 0
else
   echo "all bad"
   exit 1
fi
