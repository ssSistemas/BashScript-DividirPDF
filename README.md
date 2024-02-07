# TooSPDF - Scripts Bash para Manipulação de PDF

Este repositório contém dois scripts em Bash para manipulação de arquivos PDF: `pdftoosdividir` e `pdftoosmesclar`. Esses scripts foram desenvolvidos para facilitar tarefas comuns ao lidar com documentos PDF, como dividir um PDF em várias partes ou mesclar vários PDFs em um único arquivo.

## Como Usar

### pdftoosdividir

Este script é usado para dividir um arquivo PDF em várias partes.

#### Uso:

```bash
$ ./pdftoosdividir input_file output_prefix num_parts
```
Parâmetros:
input_file: Nome do arquivo PDF que deseja dividir.

output_prefix: Nome da saída dos arquivos divididos.

num_parts: Número de partes em que o arquivo PDF deve ser dividido.

Exemplo de uso:

``
$ ./pdftoosdividir exemplo.pdf dividido 3
``

Este comando irá dividir o arquivo exemplo.pdf em 3 partes, gerando arquivos de saída com o prefixo dividido.

### pdftoosmesclar
Este script é usado para mesclar vários arquivos PDF em um único arquivo.
#### Uso
``
$ ./pdftoosmesclar input_folder
``

Parâmetros:
input_folder: Pasta contendo os arquivos PDF a serem concatenados.

Exemplo de uso:

``
$ ./pdftoosmesclar pasta_com_pdfs
``

Este comando irá mesclar todos os arquivos PDF na pasta pasta_com_pdfs em um único arquivo.



Requisitos
Ambos os scripts dependem do utilitário pdftk para manipulação de arquivos PDF. Certifique-se de que o pdftk está instalado no seu sistema antes de usar esses scripts.

Contribuindo
Se encontrar algum problema ou tiver sugestões de melhoria, sinta-se à vontade para abrir uma issue ou enviar um pull request.


Este README.md fornece uma visão geral dos scripts, como usá-los e os requisitos necessários para executá-los. Ele também inclui exemplos de uso para cada script.

autor: rodrigodominguessilva@gmail.com
