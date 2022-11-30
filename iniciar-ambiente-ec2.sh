#!/bin/bash
wait_time=3s

echo Executando o script de instalacao do banco...

sudo mkdir scripts
sudo mkdir ./scripts/sql
sudo cp ./create-tables.sql ./scripts/sql/

# Executa a service java para iniciar a aplicacao
echo Iniciando a aplicacao...
sleep 1s
sudo docker-compose run java

