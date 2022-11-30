#!/usr/bin/env bash

PURPLE='0;35'
NC='\033[0m'
VERSAO=11
clear
echo " _____       _____   __          __   ___     ____       __"
echo "|  __ \\     /____ \\  \\ \\        / /  /   |   / ___\\     / /"
echo "| |  \\ \\      ___ /   \\ \\      / /  /_/| |  / /        / /__"
echo "| |   \\ \\    |___ \\    \\ \\    / /      | | | |        /  __ \\"
echo "| |   / /  __    \\ \\    \\ \\__/ /       | | | |       / /   \\ \\"
echo "| |__/ /   \\ \\___/ /     \\    /        | |  \\ \\____  \\ \\___/ /"
echo "|_____/     \\_____/       \\__/         |_|   \\____/   \\_____/"

echo "| - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - |"
echo "|                                                                                         |"
echo "|     Olá Cliente, Tudo bem ?, Prazer eu sou a assistente virtual da empresa DEVICE!      |"
echo "|      Posso instalar os processos necessarios para rodar nossos serviços nessa maquina ? |"
echo "|                                                                                         |"
echo "|            Responda S para sim ou N para Não                                            | "
echo "| - - - - - - - - - - - - - - - - -- - - - - -- - - - - - - - - - - - - - - - - - - - - - |"
read inst
if [ \"$inst\" == \"S\" ]; then
  sleep 2
  java -version

  if [ $? -eq 0 ]; then
    echo "| - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - |"
    echo "|                                                                                         |"
    echo "| Ufaaaa, você ja tem o java Instalado nessa maquina                                      |"
    echo "| Segue o caminho que esta instalado o JAVA:                                              |"
    which java
    echo "| - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - |"
    echo "|                                                                                         |"
  else
    echo "| - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - |"
    echo "|                                                                                         |"
    echo "| Eita! Não identifiquei nenhuma versão do Java instalado, mas sem problemas,             |"
    echo "|                         Estou aqui para te ajudar!                                      |"
    echo "| - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - |"

    echo "|                            Irei baixar agora                                            |"
    echo "|                            Adicionando o repositório!                                   |"
    sleep 2
    sudo add-apt-repository ppa:webupd8team/java -y
    clear
    echo "|                             Atualizando! Quase lá.                                      |"
    sleep 2
    sudo apt update -y
    clear

    if [ $VERSAO -eq 11 ]; then
      echo "| - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - |"
      echo "| Preparando para instalar a versão 11 do Java. Confirme a instalação quando solicitado   |"
      sudo apt install default-jre -y
      apt install openjdk-11-jre-headless -y
      clear
      echo "| - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - |"
      echo "|                      Tudooo Pronto, Java instalado com sucesso!                         |"
      echo "| - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - |"
    fi
  fi

  echo "Verificando se há o Docker instalado na sua maquina..."

  docker -v
  if [ $? -ne 0 ]; then
    echo "O Docker não está instalado na sua maquina"
    echo "Iniciando instalação..."
    sleep 1s
    clear

    echo "| - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - |"
    echo "|                                                                                         |"
    echo "|                Iniciando instalação do Docker na sua maquina!                           |"
    echo "|                                                                                         |"
    echo "| - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - |"
    echo ""

    echo "Atualizando o sistema"
    sudo apt update -y
    clear
    sleep 1s

    echo "Instalando o docker"
    sudo apt install docker.io -y
    sudo systemctl start docker -y
    sudo systemctl enable docker -y

    clear
  else
    echo "Docker já está instalado!"
  fi

  docker-compose --version
  if [ $? -ne 0 ]; then
    echo "O Docker Compose não está instalado na sua maquina"
    echo "Iniciando instalação..."
    sleep 1s
    clear

    echo "Atualizando o sistema..."
    sudo apt update -y
    clear
    sleep 1s

    echo "Instalando o Docker compose"
    echo "Instalando o Docker Compose..."
    sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
    sudo chmod +x /usr/local/bin/docker-compose
    sleep 1s

    echo "Docker compose instalado!"
    docker-compose --version
  else
    echo "Docker compose já está instalado!"
  fi

else
  echo "|       Humm que pena sem os nosso serviços não sei como vai funcionar            |"
fi

# FINAL
echo "| - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - |"
echo "|                                                                                         |"
echo "|                Obrigado por utilizar nossos serviços, bye bye!                          |"
echo "|                                                                                         |"
echo "| - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - |"
echo ""

# ===================================================================
# Sob licença Creative Commons @2020
# Podera modificar e reproduzir para uso pessoal.
# Proibida a comercialização e a exclusão da autoria.
# ===================================================================
