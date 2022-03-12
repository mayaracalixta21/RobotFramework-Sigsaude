#*** Settings ***
#Library    RPA.Tables
#Library    RPA.Excel.Files
#
#Documentation       Teste Agendamento
#
#Resource        ${EXECDIR}/Resources/Page_especialidade_cadastro copy.robot
#
#Resource        ${EXECDIR}/Resources/login.robot
#Resource        ${EXECDIR}/Resources/nav.robot
#Resource        ${EXECDIR}/Resources/Page_profissão_cadastro.robot
#Resource        ${EXECDIR}/Resources/Page_modalidade_cadastro.robot
#Resource        ${EXECDIR}/Resources/Page_profissional_cadastro.robot
#Resource        ${EXECDIR}/Resources/Page_oferta_cadastro.robot
#Resource        ${EXECDIR}/Resources/Page_agendamento.robot
#Resource        ${EXECDIR}/Resources/Page_oferta_listar.robot
#
#
#Suite Setup     iniciar navegador sessão "Endocrinologia"

*** Keywords ***
#Read orders as table
#    Open workbook    ${ORDERS_FILE}
#    ${worksheet}=    Read worksheet   header=${TRUE}
#    ${orders}=       Create table     ${worksheet}
#    [Return]         ${orders}
#    [Teardown]       Close workbook




#***Test Cases***

#[000] - 
#    Open workbook    Resources/Arquivos/teste.xlsx
#    ${table}=    Read worksheet as table
#    ${table}=    Get cell value    1    B
#    Set Global Variable   ${table}
#    Log To Console	     ${table}
#
#   
#    #${sheets}=       List worksheets
#    #Log to console   ${sheets}[-1]
#
#
#[001] -Cadastro de especialidade (Completo)
#    Dado        que o usuario está na tela "cadastro de especialidade"
#    Então       preencher o ${Campos_especialidade.denominacao} com ${Valor_campos_especialidade.denominacao}
#    #Então       preencher o ${Campos_especialidade.descricao} com ${Valor_campos_especialidade.descricao}
#    #E           selecionar o ${Valor_campos_especialidade.profissao} no ${Campos_especialidade.profissao}
#    #Quando      clicar no ${Buttons.avançar}
#    #E           clicar no ${Buttons.cadastrar}
#    #Então       mensagem de cadastro realizado com sucesso é exibida
#    Sleep      20s

*** Settings ***
Documentation     An example robot that reads and writes data
...               into a Google Sheet document.
Library           RPA.Cloud.Google

Suite Setup       Init Sheets      Resources/Arquivos/chave.json

*** Variables ***
${SHEET_ID}          1GceBbjnkBCTczBW52Fki5sT6k2hCMp6qy8UJEuvHkzE
${SHEET_RANGE}       A1:A1

*** Tasks ***
Read values from the Google Sheet
    ${spreadsheet_content}=    Get Sheet Values
    ...    ${SHEET_ID}
    ...    ${SHEET_RANGE}
   # ${spreadsheet_content}     Evaluate             ${spreadsheet_content["values"]}
    Log To Console    ${spreadsheet_content["values"][0][0]}

 #.{'range': 'Mayara!A1:Z1',
 # 'majorDimension': 'ROWS', 
 # 'values': [['aaaaa']]}

     ${values}   Evaluate   [[11]]
     ${result}=  Insert Sheet Values   ${SHEET_ID}  A1:A1  ${values}
     #${result}=  Insert Sheet Values   ${SHEET_ID}  A:B  ${values}  ROWS