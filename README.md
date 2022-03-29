# RobotFramework-Sigsaude

## Instalação/Configuração do projeto 

### Instalar o Node.js
https://nodejs.org/

````
sudo apt install nodejs
````


### Instalar o Python 3
https://www.python.org/downloads/

````
sudo apt install python3

sudo apt install python-is-python3

````


venv — Criação de ambientes virtuais
Acessando a pasta do projeto de automação, execute os comandos abaixo:

````
python -m venv .venv

source .venv/bin/activate
````

Instalar dependencias do projeto 

````
pip install -r requirements.txt
````


Configurar biblioteca do Browser

````
rfbrowser init

python -m Browser.entry init
````


Executar o projeto 

````
robot -d output .


robot -d ./output -t "[000] -  DS" Tests

robot -d ./output -i Comum Tests 
