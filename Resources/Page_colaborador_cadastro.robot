***Settings***
Documentation       Cadastro colaborador
*** Variables ***

&{Campos_colaborador}
...  CPF=inputCPF
...  nome=inputNome
...  telefone=inputTelefone
...  perfil=selectPerfil
...  email=inputEmail
...  login=inputLogin
...  vinculo=selectTipoVinculo


&{Valor_campos_colaborador}
...  nome=Bruna Guedes
...  CPF=191.297.360-05
...  telefone=84999999999
...  perfil=ADM GERAL
...  email=teste692@email.com
...  login=bruguess
...  vinculo=EXTERNO

&{Buttons}
...  avançar=nextBtn
...  cadastrar=nextBtn
...  OK=/html/body/div[2]/div/div[3]/div/button


***Keywords***

selecionar o ${VALOR} no ${CAMPO}
    Select Options By       id=${CAMPO}        Text        ${VALOR}

preencher o ${CAMPO} com ${VALOR}
    Type Text               id=${CAMPO}        ${VALOR}

clicar no ${Button}
    Click                     id=${Button}

mensagem de cadastro realizado com sucesso é exibida
    Wait For Elements State         css=.swal-modal         visible
    Click           xpath=${Buttons.OK}



