***Settings***
Documentation       Listar colaborador

Resource        ${EXECDIR}/Resources/Page_colaborador_cadastro.robot

*** Variables ***

&{Campos_listar_colaborador}
...  nome=inputDenominacao
...  email=email
...  login=login
...  nome_na_tabela=//*[@id="dataTable"]/tbody/tr/td[1]/span
...  nenhum_registro=dataTable
...  justificativa=inputJustificativa

&{Valor_campos_listar_colaborador}
...  nome=${Valor_campos_colaborador.nome}
...  email=${Valor_campos_colaborador.email}
...  login=${Valor_campos_colaborador.login}
...  nome_failed=*[
...  nenhum_registro=Nenhum registro encontrado
...  justificativa=Teste automatizado

&{Buttons_listar}
...  pesquisar=pesquisarColaborador
...  icone_inativar=//*[@id="dataTable"]/tbody/tr[1]/td[4]/div/a[3]
...  inativar=/html/body/div/div[2]/div/div/section/div/div/div/div/form/div[3]/button

***Keywords***
o ${CAMPO} deve ser igual a ${VALOR}
    ${VALOR2} =	                        Convert To Upper Case                ${VALOR}
    Get Text                xpath=${CAMPO}              contains                 ${VALOR2}


o sistema deve mostrar a mensagem ${MENSAGEM}
    ${MENSAGEM2} =	              Convert To Upper Case                                  ${MENSAGEM}
    ${elementos_json}             Get JSON                                               elementos.json
    Get Text                      id=${Campos_listar_colaborador.nenhum_registro}    contains          ${MENSAGEM2}

clicar em ${Button}
    Click                     xpath=${Button}

mensagem de inatição realizada com sucesso é exibida
    mensagem de cadastro realizado com sucesso é exibida