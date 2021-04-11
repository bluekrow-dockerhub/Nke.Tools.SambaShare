#!/bin/bash

if [ "$#" -eq 0 ]; then
  echo "Error: must supply a Volume Name or Path."
  exit 1
fi

if [ "$#" -ne 1 ]; then
  echo "Error: Too many arguments. Only one argument expected."
  exit 1
fi

SHARED_VOL=$1
CONTAINER_NAME="sambashare"
IMAGE_NAME="nke-tools-sambashare"

echo "SAMBA SHARE CONTAINER"
if [ "$(sudo docker ps -q -f name=$CONTAINER_NAME)" ]; then
  echo "Stopping currently running container"
  sudo docker stop $CONTAINER_NAME
fi

if [ "$(sudo docker ps -aq -f status=exited -f name=$CONTAINER_NAME)" ]; then
  echo "Removing currently running container"
  sudo docker rm $CONTAINER_NAME
fi

echo "Starting container. Sharing $SHARED_VOL"
sudo docker run \
  -dt \
  -p 445:445 \
  --name $CONTAINER_NAME \
  --rm \
  --volume $SHARED_VOL:/media/storage \
  $IMAGE_NAME
echo "Container is running"
