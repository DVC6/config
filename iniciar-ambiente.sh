#!/bin/bash
wait_time=3s

echo Aguarde processarmos os arquivos necessários...
# Baixando o script para criar as tabelas
./install-scripts
echo Finalizado.
sleep 1s
clear

echo Executando o script de instalacao do banco...
# Executa docker compose para subir o banco de dados com as tabelas
docker compose up --build -d

echo Script finalizado com sucesso!
sleep 1s
echo Limpando o terminal...
sleep $wait_time
clear

cp ./create-tables.sql ./scripts/sql/

# Executa a service java para iniciar a aplicacao
echo Iniciando a aplicacao...
sleep 1s
docker compose run java
