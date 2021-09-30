#!/bin/bash
say() {
    echo $1
}

log() {
    say "[[ log ]] $1\n"
}

error() {
    say "[[ error ]] $1"
}

# Taken from "https://superuser.com/a/1607383/940117"
show_timer() {  
    local now=$(date +%s)
    local end=$((now + $1))
    while (( now < end )); do
        printf "$2 in %s\r" "$(date -u -j -f %s $((end - now)) +%T)"  
        sleep 0.25  
        now=$(date +%s)
    done  
}

set -e

clear

log "⚐ → Starting Docker !!"

open --background -a Docker

show_timer 60 "Starting SQL Server"

log "⚐ → Starting SQL Server !!"

docker run -d -e "ACCEPT_EULA=1" -e "MSSQL_SA_PASSWORD=K2u3q^ntfHXU87r!" -e "MSSQL_PID=Developer" -e "MSSQL_USER=SA" -p 1433:1433 --name=sql mcr.microsoft.com/azure-sql-edge

show_timer 5 "Starting Azure SQL Client"

log "⚐ → Starting Azure SQL Client !!"

open -a Azure\ Data\ Studio

log "⚑ → All done !!!"
