#!/bin/bash
set -eo pipefail

function do_err() {
    code=$?
    echo "Command failed with code $code: $BASH_COMMAND"
    exit $code

}
trap do_err ERR

# initialize
/bin/bash /scripts/init

exec /usr/bin/supervisord -n
