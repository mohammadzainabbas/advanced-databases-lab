say() {
    echo $1
}

log() {
    say "[[ log ]] $1"
}

error() {
    say "[[ error ]] $1"
}

log "Starting Docker !!"

open --background -a Docker

sleep 60s

log "Starting SQL Server !!"

docker run -d -e "ACCEPT_EULA=1" -e "MSSQL_SA_PASSWORD=K2u3q^ntfHXU87r!" -e "MSSQL_PID=Developer" -e "MSSQL_USER=SA" -p 1433:1433 --name=sql mcr.microsoft.com/azure-sql-edge

sleep 5s

log "Starting Azure SQL Client !!"

open -a Azure\ Data\ Studio

log "All done !!!"
