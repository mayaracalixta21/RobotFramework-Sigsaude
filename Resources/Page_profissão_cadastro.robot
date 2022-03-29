***Settings***
Documentation       Cadastro profissão
Library         String

*** Variables ***

&{Campos_profissao}
...  nome_da_profissao=inputNome
...  sigla=inputSigla
...  nivel_formacao=selectNivel
...  conselho_profissional=selectConselho
...  ocupacao1=//*[@id="regForm"]/div/div[4]/div[1]/div[4]/div[2]/div/button/div/div/div
...  ocupacao2=bs-select-1-0

&{Valor_campos_profissao}
...  nome_da_profissao=TESTE ANALISE
...  sigla=TAN
...  nivel_formacao=SUPERIOR
...  conselho_profissional=CFBM - CONSELHO FEDERAL DE BIOMEDICINA

&{Buttons}
...  avançar=nextBtn
...  cadastrar=nextBtn
...  OK=/html/body/div[2]/div/div[3]/div/button

***Keywords***

preencher o ${CAMPO} com ${VALOR}
    Type Text               id=${CAMPO}        ${VALOR}

selecionar o ${VALOR} no ${CAMPO}
    ${VALOR2}               Convert To Upper Case                ${VALOR}
    Select Options By       id=${CAMPO}       Text           ${VALOR2}

clicar no ${Button}
    Click                     id=${Button}

mensagem de cadastro realizado com sucesso é exibida
    Wait For Elements State         css=.swal-modal         visible
    Click           xpath=${Buttons.OK}

informar o ${CAMPO}
    Click           xpath=${CAMPO}
    Click           id=${Campos_profissao.ocupacao2}
 
