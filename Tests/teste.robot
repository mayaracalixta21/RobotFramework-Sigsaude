*** Settings ***
Library    RPA.Tables
Library    RPA.Excel.Files

Resource        ${EXECDIR}/Resources/login.robot
Resource        ${EXECDIR}/Resources/nav.robot

Resource        ${EXECDIR}/Resources/Page_especialidade_cadastro_copy.robot
Resource        ${EXECDIR}/Resources/Page_colaborador_cadastro.robot


Suite Setup     iniciar navegador sessão "Endocrinologia"


*** Keywords ***
#Read orders as table
#    Open workbook    ${ORDERS_FILE}
#    ${worksheet}=    Read worksheet   header=${TRUE}
#    ${orders}=       Create table     ${worksheet}
#    [Return]         ${orders}
#    [Teardown]       Close workbook

Capturar dados
    Open workbook    Resources/Arquivos/teste.xlsx
    ${table}=    Read worksheet as table
    ${table}=    Get cell value    1    B
    Set Suite Variable     ${table1}         ${table}
    Log To Console	        ${table1}

***Test Cases***
[001] -Cadastro de especialidade (Completo)
    Capturar dados
    #Dado        que o usuario está na tela "cadastro de especialidade"
    #Então       preencher o ${Campos_especialidade.denominacao} com ${Valor_campos_especialidade.denominacao}
    #Log To Console   ${Valor_campos_especialidade.denominacao}
    #Então       preencher o ${Campos_especialidade.descricao} com ${Valor_campos_especialidade.descricao}
    #E           selecionar o ${Valor_campos_especialidade.profissao} no ${Campos_especialidade.profissao}
    #Quando      clicar no ${Buttons.avançar}
    #E           clicar no ${Buttons.cadastrar}
    #Então       mensagem de cadastro realizado com sucesso é exibida
    Sleep      20s




  
   
    

[000] -  DBS