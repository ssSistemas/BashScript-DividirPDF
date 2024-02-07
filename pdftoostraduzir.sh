#!/bin/bash
Echo em desenvolvimento...
exit 1

if [ "$#" -ne 4 ]; then
    echo "Uso: $0 input_file output_prefix num_parts translation"
    echo "Deve ser informados quatro parametros na seguinte sequência"
    echo "Parametro 1: Nome do Arquivo PDF que deseja dividir"
    echo "Parametro 2: Nome da saida de arquivos dividios"
    echo "Parametro 3: Quantidade que deve ser dividio o arquivo PDF"
    echo "Parametro 4: 1 caso deseja traduzir para o português, ou 0 caso não deseja traduzir"
    exit 1
fi

input_file="$1"
output_prefix="$2"
num_parts="$3"
traduzir="$4"



# Definindo a chave de API do Google Tradutor
API_KEY="dsfgsdgasdfasfa65sdf4a6sdf4"

# Criando uma pasta com o nome especificado pelo output_prefix
output_folder="${output_prefix}_output"
mkdir -p "$output_folder"


# Criando uma pasta para os arquivos traduzidos
translation_folder="${output_folder}/traducao"
if [ "$traduzir" -eq 1 ]; then
    mkdir -p "$translation_folder"
fi

# Obtendo a contagem total de páginas do PDF
total_pages=$(pdftk "$input_file" dump_data | grep "NumberOfPages" | awk '{print $2}')

# Calculando a quantidade de páginas em cada parte
pages_per_part=$((total_pages / num_parts))

# Inicializando variáveis
current_page=1
current_output=1
output_file="${output_folder}/${output_prefix}_${current_output}.pdf"

while [ "$current_output" -le "$num_parts" ]; do
    # Definindo o nome do arquivo de saída
    output_file="${output_folder}/${output_prefix}_${current_output}.pdf"

    # Extraindo páginas até atingir a quantidade desejada por parte
    pdftk "$input_file" cat "$current_page-$((current_page + pages_per_part - 1))" output "$output_file"

    # Traduzindo o arquivo para português usando a API do Google Tradutor

    if [ "$traduzir" -eq 1 ]; then
        translation_output_file="${translation_folder}/${output_prefix}_${current_output}_traduzido.pdf"
        curl -s -d "q=$(cat $output_file | base64)" -d "source=en" -d "target=pt" -d "format=pdf" -d "key=$API_KEY" \
            https://translation.googleapis.com/language/translate/v2 > "$translation_output_file"
    fi


    # Atualizando a página inicial para a próxima iteração
    current_page=$((current_page + pages_per_part))
    # Incrementando o número do arquivo de saída
    current_output=$((current_output + 1))
done

# Páginas finais que podem não se ajustar perfeitamente à divisão igual
pages_per_partfinal=$((total_pages-(pages_per_part*num_parts)))
output_file="${output_folder}/${output_prefix}_${current_output}.pdf"
pdftk "$input_file" cat "$current_page-$((current_page + pages_per_partfinal - 1))" output "$output_file"

if [ "$traduzir" -eq 1 ]; then
    # Traduzindo o arquivo final para português usando a API do Google Tradutor
    translation_output_file="${translation_folder}/${output_prefix}_${current_output}_traduzido.pdf"
    curl -s -d "q=$(cat $output_file | base64)" -d "source=en" -d "target=pt" -d "format=pdf" -d "key=$API_KEY" \
        https://translation.googleapis.com/language/translate/v2 > "$translation_output_file"
fi
