#!/bin/bash


if [ -z "$BASH" ]; then
    echo "Este script requer o Bash para execução. Por favor, execute com bash."
    echo "Exemplo:"
    echo "bash install.sh"
    exit 1
fi


echo simplesmente sera copiado os dois scripts pdftoosdividir e pdftoosmesclar para /usr/bin
cd scripts
sudo cp * /usr/bin/
sudo chmod +x /usr/bin/pdftoosdividir.sh
sudo chmod +x /usr/bin/pdftoosmesclar.sh


# Verifica se o pdftk está instalado
if ! dpkg -l | grep -qw pdftk; then
    echo "pdftk não está instalado. Tentando instalar..."

    # Atualiza a lista de pacotes
    sudo apt-get update

    # Tenta instalar o pdftk
    if sudo apt-get install -y pdftk; then
        echo "pdftk instalado com sucesso."
    else
        echo "Não foi possível encontrar o pacote pdftk nos repositórios padrão."
        echo "Você pode tentar instalar 'pdftk-java' como uma alternativa ou procurar um pacote '.deb' do pdftk online."
    fi
else
    echo "pdftk já está instalado."
fi

