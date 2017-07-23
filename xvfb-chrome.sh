#!/bin/bash

_kill_procs() {
  kill -TERM $chrome_proc
  wait $chrome_proc
  kill -TERM $xvfb_proc
}

# Setup a trap to catch SIGTERM and relay it to child processes
trap _kill_procs SIGTERM

XVFB_WHD=${XVFB_WHD:-1024x768x16}

# Start Xvfb
Xvfb :99 -ac -screen 1 $XVFB_WHD +extension RANDR -nolisten tcp &
xvfb_proc=$!

export DISPLAY=:99

google-chrome-stable --no-sandbox $@ &
chrome_proc=$!

wait $chrome_proc
wait $xvfb_proc