#!/bin/bash

cleanup_pid_files() {
    if [ -f /run/squid.pid ]; then
        rm -f /run/squid.pid
    fi
    find /var/spool/squid -type f -name '*.pid' -delete
}

if [ -f /run/squid.pid ]; then
    PID=$(cat /run/squid.pid)
    if ps -p $PID > /dev/null; then
        echo "Stopping existing Squid process with PID $PID"
        squid -k shutdown
        sleep 5
    fi
    cleanup_pid_files
fi

echo "Initializing cache directories"
squid -z

echo "Starting Squid"
cleanup_pid_files
squid -N -d 1
