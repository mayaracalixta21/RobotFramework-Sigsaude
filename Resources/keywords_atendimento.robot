***Settings***
Documentation       Keywords atendimento

Resource            ${EXECDIR}/Resources/nav.robot
Resource            ${EXECDIR}/Resources/base.robot
Resource            ${EXECDIR}/Resources/variaveis.robot

Library     FakerLibrary        locale=pt_BR

***Variables***   
${identificador_hipotese_antes}=            //*[@id="groupHipoteseDiagnosticada"]/div/div[1]/button/div/div
${identificador_hipotese_depois}=           //*[@id="groupHipoteseDiagnosticada"]/div/div[1]/div/div[1]/input
${identificador_definido_antes}=            //*[@id="groupDiagnosticoDefinido"]/div/div[1]/button/div/div/div
${identificador_definido_depois}=           //*[@id="groupDiagnosticoDefinido"]/div/div[1]/div/div[1]/input
${adicionar_encaminhamento}=                //*[@id="multistepFormCt"]/div[2]/div[1]/div[2]/div[2]/div[1]/div/a[1]
${serviço_de_destino_antes}=                //*[@id="divBuscaServico"]/div[1]/button/div/div/div
${serviço_de_destino_depois}=               //*[@id="divBuscaServico"]/div[1]/div/div[1]/input
${modalidade_de_atendimento_antes}=         //*[@id="divBuscaModalidade"]/div[1]/button/div/div/div
${modalidade_de_atendimento_depois}=        //*[@id="divBuscaModalidade"]/div[1]/div/div[1]/input

${adicionar_receituário}=                   //*[@id="multistepFormCt"]/div[2]/div[1]/div[2]/div[5]/div[1]/div/a[1]

${adicionar_exame}=                         //*[@id="multistepFormCt"]/div[2]/div[1]/div[2]/div[8]/div[1]/div/a[1]
${procedimento_antes}=                      //*[@id="divBuscaProcedimento"]/div[1]/button/div/div/div
${procedimento_depois}=                     //*[@id="divBuscaProcedimento"]/div[1]/div/div[1]/input

                                
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
    #FOR    ${contador}    IN RANGE    1   3
        Click                          css=${elementos_aten_json["Sim"]} 
    #END
       
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

informar outras informações
    ${elementos_aten_json}         Get JSON                elementos_aten.json
    informar dados do step "Outras informações"
    Click                          xpath=${elementos_aten_json["Avançar"]} 
    informar dados do diagnóstico

informar dados do diagnóstico
    ${elementos_aten_json}         Get JSON                elementos_aten.json
    informar dados do step "Diagnostico"
     ${aux}           Set Variable               12
    FOR  ${contador}     IN RANGE    1   3
        Click            xpath=${identificador_hipotese_antes}
        Type Text        xpath=${identificador_hipotese_depois}      FEBRE TIFÓIDE
        Sleep            2s
        Click            id=bs-select-${aux}-0
        ${aux}           Set Variable               14
        Click            xpath=${elementos_aten_json["Adicionar hipótese diagnóstica"]} 
        IF      '${contador}' == '1'
           remover item da tabela "Remover hipótese diagnóstica"
        END 
    END
      ${aux2}           Set Variable               13
     FOR  ${contador2}     IN RANGE    1   3
        Click            xpath=${identificador_definido_antes}
        Type Text        xpath=${identificador_definido_depois}      FEBRE TIFÓIDE
        Sleep            2s
        Click            id=bs-select-${aux2}-0
        ${aux2}           Set Variable               16
        Click            xpath=${elementos_aten_json["Adicionar diagnóstico definido"]} 
        IF      '${contador2}' == '1'
           remover item da tabela "Remover diagnóstico definido"
        END
    END
    Click                          xpath=${elementos_aten_json["Avançar"]}  
    Cadastrar dados de diagnóstico    
    
Cadastrar dados de diagnóstico
    ${elementos_aten_json}         Get JSON                elementos_aten.json    
    Click                          xpath=${elementos_aten_json["Cadastrar"]} 
    mensagem de cadastro realizado com sucesso  

informar dados da conduta terapêutica
    ${elementos_aten_json}         Get JSON                                                        elementos_aten.json
    Click                          id=${elementos_aten_json["Conduta terapêutica"]} 
    Type Text                      id=${elementos_aten_json["Decrição"]}            Teste automatizado
    Encaminhamento
    Receituário de medicamentos
    Exames preescritos

Encaminhamento 
    ${elementos_aten_json}         Get JSON                                                        elementos_aten.json
    Click                          xpath=${adicionar_encaminhamento}
    Select Options By              id=${elementos_aten_json["Tipo de encaminhamento"]}                    Text         INTERNO                        SIM
    Click            xpath=${serviço_de_destino_antes}
    Type Text        xpath=${serviço_de_destino_depois}      DAS
    Sleep            2s
    Click            id=bs-select-5-0
    Select Options By              id=${elementos_aten_json["Prioridade"]}                Text             ALTA                        
    Click            xpath=${modalidade_de_atendimento_antes}
    Type Text        xpath=${modalidade_de_atendimento_depois}                  ANALISES CLINICAS
    Sleep            2s
    Click            id=bs-select-6-0
    Select Options By              id=${elementos_aten_json["Campo para adicionar"]}            Text          CPF
    #Type Text       id=${elementos_aten_json["Editor histórico clínico"]}             Teste automatizado
    Repeat Keyword	2	  Repetidor "Adicionar campo"  
    Select Options By              id=${elementos_aten_json["Campo para adicionar dúvidas"]}        Text        CPF
    Repeat Keyword	2	  Repetidor "Adicionar campo dúvidas"  
    #Type Text       id=${elementos_aten_json["Editor dúvidas"]}             Teste automatizado
    Click           id=${elementos_aten_json["Salvar encaminhamento"]}
    Imprimir comprovante "Sim"
    #Download de arquivos 
#Fluxo de remover e editar implementação 

Receituário de medicamentos
    ${elementos_aten_json}         Get JSON                                                        elementos_aten.json
    Click                          xpath=${adicionar_receituário}
    Select Options By              id=${elementos_aten_json["Tipo da receita"]}                    Text         NORMAL
    Type Text                      id=${elementos_aten_json["Descrição resumida"]}                  Teste automatizado
    Select Options By              id=${elementos_aten_json["Campos adicionar"]}        Text        CPF
    Repeat Keyword	2	  Repetidor "Adicionar campo receituario" 
    Click           id=${elementos_aten_json["Salvar receita"]}
    Imprimir comprovante "Sim"
       
Exames preescritos
    ${elementos_aten_json}         Get JSON                                                        elementos_aten.json
    Click                          xpath=${adicionar_exame}
    Click            xpath=${procedimento_antes}
    Type Text        xpath=${procedimento_depois}      ANÁLISE DE PROJETOS BÁSICOS DE ARQUITETURA
    Sleep            3s
   #Refatorar Click            id=bs-select-7-0
    Type Text                      id=${elementos_aten_json["Informações adicionais sobre a requisição"]}                  Teste automatizado
    Select Options By              id=${elementos_aten_json["Campo adicionar exame"]}            Text         CPF
    Repeat Keyword  2	  Repetidor "Adicionar campo exame" 
    Click              id=${elementos_aten_json["Salvar exame"]}
    Imprimir comprovante "Sim"
    Adcionar novo exame "Não"
       

Adcionar novo exame "${opção}"
    ${opção} =	                        Convert To Upper Case                    ${opção}
    Imprimir comprovante "${opção}"

Repetidor "${campo}"     
    ${elementos_aten_json}         Get JSON                                                        elementos_aten.json
    Click           id=${elementos_aten_json["${campo}"]} 

Imprimir comprovante "${opção}"
    ${opção} =	                        Convert To Upper Case                    ${opção}
    ${elementos_aten_json}         Get JSON                                          elementos_aten.json
    Wait For Elements State         css=${elementos_aten_json["Mensagem"]}           visible 
    IF      '${opção}' == 'SIM'   
        Click                           css=${elementos_aten_json["Sim"]} 
    ELSE 
        Click                           css=${elementos_aten_json["Não"]} 
    END

Download de arquivos 
    ${url}          Set Variable             https://testessigsaude.imd.ufrn.br/sigsaude/condutaTerapeutica/imprimir/encaminhamento
    ${path}=        Download                 ${url}  
    ${actual_size}=    Get File Size    ${path.saveAs}



