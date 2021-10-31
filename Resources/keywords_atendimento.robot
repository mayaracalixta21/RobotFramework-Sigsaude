***Settings***
Documentation       Keywords atendimento

Resource            ${EXECDIR}/Resources/nav.robot
Resource            ${EXECDIR}/Resources/base.robot
Resource            ${EXECDIR}/Resources/variaveis.robot

Library     FakerLibrary        locale=pt_BR

***Variables***   

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
    Wait For Elements State        css=${elementos_aten_json["Tela de aviso"]}                   visible            6s
    FOR    ${contador}    IN RANGE    1   3
        Click                          css=${elementos_aten_json["Sim"]} 
    END
       
informar dados de diagnóstico
    ${elementos_aten_json}         Get JSON                                                        elementos_aten.json
    Click                          id=${elementos_aten_json["Dados de diagnóstico"]}  
   # ${valor}=                      Padrão descrição 
   
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
    informar dados dos exames laboratoriais


informar dados dos exames laboratoriais
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

        
        IF          '${descrição}' == 'OUTRO'
            Select Options By              id=${elementos_aten_json["Exames"]}                             Text                        ${descrição}
            informar o campo "Outro exame" com o "Teste automatizado${contador}"
            informar o campo "Resultado" com o "${contador}"
            informar o campo "Observação" com o "Teste automatizado${contador}"
            Adicionar item na tabela "Adicionar exame"
            remover item da tabela "Remover exame"
       
        ELSE IF     '${descrição}' == 'NÃO INFORMADO'  
            Select Options By              id=${elementos_aten_json["Exames"]}                             Text                         25-HIDROXIVITAMINA D (NG/ML)
            informar o campo "Resultado" com o "${contador}"
            informar o campo "Observação" com o "Teste automatizado${contador}"
            Select Options By              id=${elementos_aten_json["Exames"]}                             Text                        ${descrição}
            @{lista_campos}             Create List           Resultado      Observação
            Verificar se campos estão vazios             @{lista_campos} 
            Verificar se campos estão desabilitados      @{lista_campos} 
           
        ELSE
            Select Options By              id=${elementos_aten_json["Exames"]}                             Text                        ${descrição}
            informar o campo "Resultado" com o "${contador}"
            informar o campo "Observação" com o "Teste automatizado${contador}"
            Adicionar item na tabela "Adicionar exame"
        END
    END
    Click                          xpath=${elementos_aten_json["Avançar"]}      
    informar dados da medição residencial de pressão arterial (sete dias)

informar dados do step "${step}"
    ${dados_json}    Get JSON        cadastros.json
    ${dados}         Set Variable    ${dados_json["${step}"]}
    FOR              ${item}         IN                         @{dados}
        FOR              ${key}          IN                         @{item.keys()}
            Type text        id=${key}         ${item["${key}"]}
        END
    END  

remover item da tabela "${campo}"
    ${elementos_aten_json}         Get JSON                                                        elementos_aten.json
    IF      '${campo}' == 'Remover exame'
        Click                          css=${elementos_aten_json["${campo}"]}
    ELSE 
        Click                          xpath=${elementos_aten_json["${campo}"]} 
    END
    Wait For Elements State        css=${elementos_aten_json["Tela de aviso"]}                   visible         6s   
    Click                          css=${elementos_aten_json["Sim"]} 

Adicionar item na tabela "${item}"
    ${elementos_aten_json}         Get JSON                 elementos_aten.json
     IF      '${item}' == 'Adicionar exame'
        Click                          css=${elementos_aten_json["${item}"]}
    ELSE IF    '${item}' == 'Adicionar glicemia'
        Click                          id=${elementos_aten_json["${item}"]}
    ELSE                                                      
        Click                          xpath=${elementos_aten_json["${item}"]} 
    END

informar dados da medição residencial de pressão arterial (sete dias)
    ${elementos_aten_json}         Get JSON                        elementos_aten.json
    ${dados_json}    Get JSON        cadastros.json
    ${dados}         Set Variable    ${dados_json["Medição"]}
    FOR  ${contador}     IN RANGE    1   4
        FOR              ${item}         IN                         @{dados}
            FOR              ${key}          IN                         @{item.keys()}
                Type Text        id=${key}         ${item["${key}"]}
            END
        END
        Adicionar item na tabela "Adicionar medição"
        IF     '${contador}' == '1'
            remover item da tabela "Remover medição"
        END 
    END
    Click                          xpath=${elementos_aten_json["Avançar"]}  
    informar dados do controle de glicemia


informar dados do controle de glicemia
    ${elementos_aten_json}         Get JSON                elementos_aten.json
    FOR  ${contador}     IN RANGE    1   5
        ${mes_g}             FakerLibrary.Month
        Type Text           css=input[id='dataControleGlicemia']           10/${mes_g}/2020 
        ${numbers}=     Evaluate     random.randint(0, sys.maxsize)      random
        Type Text           id=medidaControleGlicemia           ${numbers}
        Adicionar item na tabela "Adicionar glicemia"
        IF     '${contador}' == '1'
            remover item da tabela "Remover glicemia"
        END 
    END
    Click                          xpath=${elementos_aten_json["Avançar"]}  

informar outras informações
    informar dados do step "Outras informações"

