#!/bin/bash
APP_SERVER=$APP_DEV_SERVER
PORT=8888

cd ./appinventor

mkdir -p $HOME/appinventor-logs

nohup $APP_SERVER --port=$PORT --address=0.0.0.0 ./appengine/build/war > $HOME/appinventor-logs/prod-server.out & PID_APPINVENTOR=$!
nohup ant RunLocalBuildServer > $HOME/appinventor-logs/buildserver-log.out & PID_BUILDSERVER=$!

cd ..

echo "$PID_APPINVENTOR $PID_BUILDSERVER"
echo "$PID_APPINVENTOR $PID_BUILDSERVER" > pids