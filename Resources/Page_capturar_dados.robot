*** Settings ***
Library    RPA.Tables
Library    RPA.Excel.Files

Resource        ${EXECDIR}/Resources/Page_profissão_cadastro.robot

*** Keywords ***

Capturar dados profissão
    Open workbook        Resources/Arquivos/teste.xlsx
    ${table_pro}=    Read worksheet as table
    ${table_pro}=    Get cell value    2    B
    ${Valor_campos_profissao.nome_da_profissao}    Set Variable      ${table_pro}
    ${table_pro}=    Get cell value    3    B
    ${Valor_campos_profissao.sigla}   Set Variable      ${table_pro}
    ${table_pro}=    Get cell value    4    B
    ${Valor_campos_profissao.nivel_formacao}   Set Variable      ${table_pro}
    ${table_pro}=    Get cell value    5    B
    ${Valor_campos_profissao.conselho_profissional}   Set Variable      ${table_pro}


Capturar dados especialidade
    Open workbook        Resources/Arquivos/teste.xlsx
    ${table_pro}=    Read worksheet as table
    ${table_pro}=    Get cell value    10   B
    ${Valor_campos_especialidade.denominacao}    Set Variable      ${table_pro}
    ${table_pro}=    Get cell value    11    B
    ${Valor_campos_especialidade.descricao}      Set Variable      ${table_pro}


Capturar dados modalidade
    Open workbook        Resources/Arquivos/teste.xlsx
    ${table_pro}=    Read worksheet as table
    ${table_pro}=    Get cell value    17   B
    ${Valor_campos_modalidade.denominacao}    Set Variable      ${table_pro}

Capturar dados profissional
    Open workbook        Resources/Arquivos/teste.xlsx
    ${table_pro}=    Read worksheet as table
    ${table_pro}=    Get cell value    24    B
    ${Valor_campos_profissional.nome}    Set Variable       ${table_pro}
    ${table_pro}=    Get cell value    25    B
    ${Valor_campos_profissional.CPF}    Set Variable      ${table_pro}      
    ${table_pro}=    Get cell value    26    B
    #${Valor_campos_profissional.perfil}    Set Variable      ${table_pro}
    #${table_pro}=    Get cell value    27    B
    ${Valor_campos_profissional.email}    Set Variable      ${table_pro}
    ${table_pro}=    Get cell value    28    B
    ${Valor_campos_profissional.login}    Set Variable      ${table_pro}
    ${table_pro}=    Get cell value    29    B
    ${Valor_campos_profissional.vinculo}    Set Variable    ${table_pro}
    ${table_pro}=    Get cell value    30    B
    ${Valor_campos_profissional.UF}    Set Variable         ${table_pro}
    ${table_pro}=    Get cell value    31    B
    ${Valor_campos_profissional.registro_profissional}    Set Variable      ${table_pro}