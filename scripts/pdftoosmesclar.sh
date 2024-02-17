#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Uso: $0 input_folder"
    echo "Deve ser informada a pasta contendo os arquivos PDF a serem concatenados"
    exit 1
fi

input_folder="$1"

# Verificando se a pasta de entrada existe
if [ ! -d "$input_folder" ]; then
    echo "A pasta de entrada não existe: $input_folder"
    exit 1
fi

# Obtendo a lista de arquivos PDF na pasta de entrada
input_files=("$input_folder"/*.pdf)

# Verificando se há arquivos PDF na pasta
if [ ${#input_files[@]} -eq 0 ]; then
    echo "Nenhum arquivo PDF encontrado na pasta: $input_folder"
    exit 1
fi

# Extraindo o nome comum até o caractere "_"
common_name=$(basename "${input_files[0]}" | cut -d "_" -f 1)

# Criando o comando pdftk para concatenar os arquivos
pdftk_command="pdftk ${input_files[@]} cat output ${common_name}_merged.pdf"

# Executando o comando pdftk
eval "$pdftk_command"

echo "Processo concluído. Arquivo de saída: ${common_name}_merged.pdf"
