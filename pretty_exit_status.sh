#!/bin/bash

SIGNAL_NAME=(ZERO $(kill -l `seq 1 64` 2>/dev/null))

function pretty_exit_status {
    local pretty_status;

    if (($1 == 0)); then
        pretty_status=OK;
    else
        local name;
        local number;

        if (($1 > 128)); then
            number=$(($1 - 128));
            name=${SIGNAL_NAME[$number]};
        fi

        if [ -z $name ]; then
            pretty_status="ERROR $1"
        else
            pretty_status="SIG$name ($number)"
        fi
    fi

    echo $pretty_status;

    return $1;
}
