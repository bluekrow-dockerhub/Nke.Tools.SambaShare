#!/bin/bash

echo "SAMBA SHARE CONTAINER"

echo "Running container"
sudo docker run \
  -dt \
  -p 445:445 \
  --name sambashare \
  --rm \
  nke-tools-sambashare

echo "Container is running"
