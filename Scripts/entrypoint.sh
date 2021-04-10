#!/bin/sh
set -eu

if [ "$1" = "samba" ]; then
  echo "Executing samba server"
  exec /samba.sh
  echo "Finishing container execution"
  exit 0
fi

if [ "$1" = "shell" ]; then
  echo "Executing /bin/sh shell"
  exec sh
  echo "Finishing shell execution"
  exit 0
fi

if [ "$#" -eq 0 ]; then
  echo "No parameters supplied. Finishing container execution"
  exit 0
fi
