#!/bin/bash
APP_SERVER=$APP_DEV_SERVER
PORT=8888

cd ./appinventor

nohup $APP_SERVER --port=$PORT --address=0.0.0.0 ./appengine/build/war & PID_APPINVENTOR=$!
nohup ant RunLocalBuildServer > ../../buildserver-log.out & PID_BUILDSERVER=$!

cd ..

echo "$PID_APPINVENTOR $PID_BUILDSERVER"
echo "$PID_APPINVENTOR $PID_BUILDSERVER" > pids