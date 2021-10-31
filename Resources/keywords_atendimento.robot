***Settings***
Documentation       Keywords atendimento

Resource            ${EXECDIR}/Resources/nav.robot
Resource            ${EXECDIR}/Resources/base.robot
Resource            ${EXECDIR}/Resources/variaveis.robot
Test Timeout    10 minutes

***Variables***   
${EMPTY}

***Keywords***

informar o campo "${campo}" com o "${valor}"
    ${elementos_aten_json}         Get JSON                                             elementos_aten.json
    Type Text                      id=${elementos_aten_json["${campo}"]}               ${valor}  

pressionar o botão "${botão}" 
    ${elementos_aten_json}         Get JSON                                             elementos_aten.json
    Click                          css=${elementos_aten_json["${botão}"]}

iniciar atendimento
    ${elementos_aten_json}         Get JSON                                                        elementos_aten.json
    Click                          css=${elementos_aten_json["Atendimento"]}  
    Wait For Elements State        css=${elementos_aten_json["Tela de aviso"]}                   visible 
    FOR    ${contador}    IN RANGE    1   3
        Click                          css=${elementos_aten_json["Sim"]} 
    END
       
informar dados de diagnóstico
    ${elementos_aten_json}         Get JSON                                                        elementos_aten.json
    Click                          id=${elementos_aten_json["Dados de diagnóstico"]}  
    ${valor}=                      Padrão descrição 
   
    FOR      ${contador}     IN RANGE    1   4 
        IF      ${contador}==1
            ${campo}        Set Variable        Possui HAS?
            ${descrição}    Set Variable        Descrição da HAS  
        ELSE IF  ${contador}==2
            ${campo}        Set Variable        Possui DM?
            ${descrição}    Set Variable        Descrição da DM 
         ELSE IF  ${contador}==3
            ${campo}        Set Variable        Possui DLP?
            ${descrição}    Set Variable        Descrição da DLP 
        END

        Select Options By              id=${elementos_aten_json["${campo}"]}                             Text                        SIM
        informar o campo "${descrição}" com o "Teste automatizado"
        Click                          xpath=${elementos_aten_json["Avançar"]}  
    END
    Exames laboratoriais


Exames laboratoriais
    ${elementos_aten_json}         Get JSON                                                        elementos_aten.json
    
    FOR  ${contador}     IN RANGE    1   5

        IF      ${contador}==1
            ${descrição}    Set Variable        25-HIDROXIVITAMINA D (NG/ML)  
        ELSE IF  ${contador}==2
            ${descrição}    Set Variable        NÃO INFORMADO
        ELSE IF  ${contador}==3
            ${descrição}    Set Variable        OUTRO
        ELSE IF  ${contador}==4
            ${descrição}    Set Variable        HCM (PG)
        END

        Select Options By              id=${elementos_aten_json["Exames"]}                             Text                        ${descrição}
        IF  '   ${descrição}' == 'OUTRO'
            informar o campo "Outro exame" com o "Teste automatizado${contador}"
        ELSE    '${descrição}' == 'NÃO INFORMADO'  #PRECISO CRIAR VALIDAÇÃO

        END
        informar o campo "Resultado" com o "${contador}"
        informar o campo "Observação" com o "Teste automatizado${contador}"
        Click                          css=${elementos_aten_json["Adicionar exame"]} 

    END


    

