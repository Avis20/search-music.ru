#!/usr/bin/env bash

export DBIC_TRACE=1
export DBIC_TRACE_PROFILE=/start_catalyst/dbic.json
export APP_DEBUG_LEVEL=0
export CATALYST_DEBUG=1
export SPHINXQL_TRACE=2

START_PL=/home/projects/project/script/server.pl;
if [ $1 ]; then
    START_PL=$1;
fi

unbuffer perl ${START_PL} --debug --port $PORT --restart --restart_delay 1