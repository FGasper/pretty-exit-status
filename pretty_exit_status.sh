#!/bin/bash

SIGNAL_NAME=(ZERO $(kill -l `seq 1 64` 2>/dev/null))

function pretty_exit_status {
    local pretty_status;

    if (($1 == 0)); then
        pretty_status=OK;
    else
        local number;

        pretty_status="ERROR $1"

        if (($1 > 128)); then
            number=$(($1 - 128));
            if ( [ -n "${SIGNAL_NAME[$number]}" ] ); then
                pretty_status="$pretty_status (SIG${SIGNAL_NAME[$number]}, $number)"
            fi
        fi
    fi

    echo $pretty_status;

    return $1;
}
