#!/bin/bash
APP_SERVER=$1
PORT=8888

cd ./appinventor

nohup $APP_SERVER --port=$PORT ./appengine/build/war & PID_APPINVENTOR=$!
nohup ant RunLocalBuildServer > ../../buildserver-log.out & PID_BUILDSERVER=$!

cd ..

echo "$PID_APPINVENTOR $PID_BUILDSERVER"
echo "$PID_APPINVENTOR $PID_BUILDSERVER" > pids