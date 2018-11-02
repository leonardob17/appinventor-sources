# Bem vindo ao App Inventor - UFRGS

## Introdução

## Como instalar no meu servidor ou máquina

1. Faça a clonagem do repositório executando `git clone https://github.com/leonardob17/appinventor-sources.git`;
2. Entre na pasta do projeto e em seguida execute `git submodule update --init`;
3. *(Opcional)* Faça uma cópia do arquivo *sample-.gitignonre* executando `cp sample-.gitignore .gitignore`;
4. Entre na pasta *appinventor* e faça o build;
5. Feitos estes passos, você já pode executar o buiçd.


## Como executar

Antes de qualquer coisa, você deve fazer o build
### Fazendo Build

Depois de feitas as alterações que deseja, basta executar, dentro da pasta **appinventor** o seguinte:

`ant clean` *(Irá remover todos os dados da build anterior, por isso recomendo que você faça backup do banco de dados antes de executar este comando)*

`ant` *(Irá gerar uma nova build)*

### Executando o Build

Caso você esteja utilizando o sistema operacional Linux, existem dois scripts que ajudam na hora de iniciar e parar os serviços do MIT App Inventor. Porém para utilizá-los, você deve criar uma variável de ambiente com o nome **APP_DEV_SERVER** com a localização do **dev_appserver.sh** que está no [App Engine SDK](https://cloud.google.com/appengine/downloads). Feito isto, estando na pasta raíz do projeto basta executar:

`sh appinventor-start.sh`

Caso esteja tudo correto, o appinventor estará rodando na porta 8888 do localhost. Para parar os serviços do MIT App Inventor, basta executar:

`sh appinventor-stop.sh`

Estes scripts não executarão apenas o appengine, mas também o buildserver, que é necessário para compilar os projetos.

### Fazendo backup do banco de dados

Quando feito um build, uma pasta dentro de **appinventor/appengine** com o nome de **build** é criada. Nesta pasta estão os dados da build mais recente. Para fazer um backup do banco de dados mais atual, recomedo parar os serviços do MIT App Inventor para depois copiar o arquivo situado dentro da pasta **build/war/WEB-INF/appengine-generated** com o nome de **local_db.bin**. Feito isto, você está seguro para executar o `ant clean` e após, fazer a build. Então, antes de iniciar novamente os processos, cole o backup(com o mesmo nome de antes) na mesma pasta, e substitua caso necessário.