#!/bin/bash

PIDS=`cat pids`
kill $PIDS
rm -rf pids