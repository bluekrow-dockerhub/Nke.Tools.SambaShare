#!/bin/sh
set -eu

smbd --foreground --no-process-group --log-stdout --debuglevel=2
