***Settings***
Documentation       Keywords atendimento

Resource            ${EXECDIR}/Resources/nav.robot
Resource            ${EXECDIR}/Resources/base.robot
Resource            ${EXECDIR}/Resources/variaveis.robot

Library     FakerLibrary        locale=pt_BR

***Variables***   
${identificador_hipotese_antes}=            //*[@id="groupHipoteseDiagnosticada"]/div[1]/button/div/div/div
${identificador_hipotese_depois}=           //*[@id="groupHipoteseDiagnosticada"]/div[1]/div/div[1]/input

${identificador_definido_antes}=            //*[@id="groupDiagnosticoDefinido"]/div[1]/button/div/div/div
${identificador_definido_depois}=           //*[@id="groupDiagnosticoDefinido"]/div[1]/div/div[1]/input
                                            
${adicionar_encaminhamento}=                //*[@id="multistepFormCt"]/div[2]/div[1]/div[8]/div[2]/div[1]/div/a[1]
${serviço_de_destino_antes}=                //*[@id="divBuscaServico"]/div[1]/button/div/div/div
${serviço_de_destino_depois}=               //*[@id="divBuscaServico"]/div[1]/div/div[1]/input
${modalidade_de_atendimento_antes}=         //*[@id="divBuscaModalidade"]/div[1]/button/div/div/div
${modalidade_de_atendimento_depois}=        //*[@id="divBuscaModalidade"]/div[1]/div/div[1]/input

${adicionar_receituário}=                   //*[@id="multistepFormCt"]/div[2]/div[1]/div[8]/div[3]/div[1]/div/a[1]

${adicionar_exame}=                         //*[@id="multistepFormCt"]/div[2]/div[1]/div[8]/div[4]/div[1]/div/a[1]
${procedimento_antes}=                      //*[@id="divBuscaProcedimento"]/div[1]/button/div/div/div
${procedimento_depois}=                     //*[@id="divBuscaProcedimento"]/div[1]/div/div[1]/input


${adicionar_atestado}=                      //*[@id="multistepFormCt"]/div[2]/div[1]/div[8]/div[5]/div/div[2]/div/div[1]/div[5]/button
${atestado_antes}=                          //*[@id="divBuscaCid10AtestadoCt"]/div[1]/button/div/div/div
${atestado_depois}=                         //*[@id="divBuscaCid10AtestadoCt"]/div[1]/div/div[1]/input

${doença_antes}=                             //*[@id="buscaDoencaDiv"]/div[1]/button/div/div/div
${doença_depois}=                            //*[@id="buscaDoencaDiv"]/div[1]/div/div[1]/input

${grupo_antes}=                            //*[@id="historicoFamiliar0"]/div[3]/div[1]/button/div/div/div
${grupo_depois}=                           //*[@id="historicoFamiliar0"]/div[3]/div[1]/div/div[1]/input

${bene_antes}=                              //*[@id="multistepFormDS"]/div[3]/div[1]/div[3]/div[2]/div[1]/button/div/div/div
${bene_todos}=                              //*[@id="multistepFormDS"]/div[3]/div[1]/div[3]/div[2]/div[1]/div/div[2]/div/button[1]

${prof_antes}=                              //*[@id="multistepFormDS"]/div[3]/div[2]/div[4]/div[1]/div/button/div/div/div
${ocup_antes}=                              //*[@id="multistepFormDS"]/div[3]/div[2]/div[5]/div[1]/div/button/div/div/div

${proc_antes}=                              //*[@id="groupProcedimento"]/div[1]/button/div/div/div
${proc_depois}=                             //*[@id="groupProcedimento"]/div[1]/div/div[1]/input
      
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

informar dados socioeconômicos
    ${elementos_aten_json}         Get JSON                                                        elementos_aten.json
    Click                          id=${elementos_aten_json["Dados socioeconômicos"]}  
    Click                          id=${elementos_aten_json["Atualizar dados socioeconômicos"]}  
    Situação familiar e econômica

Situação familiar e econômica
    ${elementos_aten_json}         Get JSON                                                        elementos_aten.json
    informar dados do step "Situação familiar e econômica"
    Select Options By              id=${elementos_aten_json["Possui benefício social"]}                             Text                    SIM     
    Click                          xpath=${bene_antes}
    Click                          xpath=${bene_todos}
    Click                          xpath=//*[@id="headerDS"]/div/h3
    Click                          id=stepDS1
    Escolaridade e profissão

Escolaridade e profissão
    ${elementos_aten_json}         Get JSON                                                        elementos_aten.json
    Click                          xpath=${elementos_aten_json["Alfabetizado"]}  
    Select Options By              id=${elementos_aten_json["Grau de escolaridade"]}                             Text                    SUPERIOR GRADUAÇÃO INCOMPLETO     
    Select Options By              id=${elementos_aten_json["Instituição de Ensino"]}                             Text                   ESTADUAL    
    Type Text                      id=${elementos_aten_json["Curso"]}            Teste automatizado
    Click           xpath=${prof_antes}
    FOR     ${cont}    IN RANGE    1   4      
         Click           xpath=//*[@id="bs-select-2"]/ul/li[${cont}]
    END
    Click                          xpath=//*[@id="multistepFormDS"]/div[3]/div[2]/div[2]/div[3]/label
    Type Text                      id=${elementos_aten_json["Outra profissão"]}            Teste automatizado
    Click           xpath=${ocup_antes}

    FOR     ${cont}    IN RANGE    1   4      
         Click           xpath=//*[@id="bs-select-3"]/ul/li[${cont}]
    END
    Click                          xpath=//*[@id="multistepFormDS"]/div[3]/div[2]/div[2]/div[3]/label
    Type Text                      id=${elementos_aten_json["Outra Ocupação Atual"]}            Teste automatizado
    Click                          id=stepDS2
    Informações adicionais

Informações adicionais
    ${elementos_aten_json}         Get JSON                                                        elementos_aten.json
    Type Text                      id=${elementos_aten_json["Informações adicionais DS"]}            Teste automatizado
    Click                          id=stepDS3
    Salvar DS

Salvar DS
   ${elementos_aten_json}          Get JSON                                                        elementos_aten.json
    Click                           xpath=${elementos_aten_json["Salvar DS"]}
    mensagem de cadastro realizado com sucesso 

informar dados básicos de saúde
    ${elementos_aten_json}         Get JSON                                                        elementos_aten.json
    Click                          id=${elementos_aten_json["Dados básicos"]}  
    Click                          id=${elementos_aten_json["Atualizar dados básicos"]}  
    Medidas e sinais vitais

Medidas e sinais vitais
    ${elementos_aten_json}         Get JSON                                                        elementos_aten.json
    informar dados do step "Medidas e sinais vitais"
    Click                          id=stepDBS1
    Procedência do usuário do serviço

Procedência do usuário do serviço
    ${elementos_aten_json}         Get JSON                                                        elementos_aten.json
    
    FOR  ${contador}     IN RANGE    1   2

        IF      ${contador}==1
            ${descrição}    Set Variable        INICIATIVA PRÓPRIA  
        ELSE IF  ${contador}==2
            ${descrição}    Set Variable        NÃO INFORMADO
        #ELSE IF  ${contador}==3
        #    ${descrição}    Set Variable        NÃO INFORMADO
        END
    
        IF      '${descrição}' == 'INICIATIVA PRÓPRIA'  
            Select Options By              id=${elementos_aten_json["Tipo de Iniciativa"]}                             Text                    ${descrição}     
            informar dados do step "Procedência do usuário do serviço"

        ELSE IF          '${descrição}' == 'NÃO INFORMADO'    
            Select Options By              id=${elementos_aten_json["Tipo de Iniciativa"]}                             Text                    ${descrição}     
            #@{lista_campos}             Create List           Tipo de Iniciativa  
            #Verificar se campos estão vazios             @{lista_campos} 
            #Verificar se campos estão desabilitados      @{lista_campos}    
        END
    END
    Click                          id=stepDBS2
    História clínica

História clínica
    ${elementos_aten_json}         Get JSON                                                        elementos_aten.json
    informar dados do step "História clínica"
    Click                          id=stepDBS3
    Medicamentos

Medicamentos
    ${elementos_aten_json}         Get JSON                                                        elementos_aten.json
    Select Options By              id=${elementos_aten_json["Utiliza medicamentos"]}                             Text                    SIM   
    Type Text                      id=${elementos_aten_json["Medicamento"]}            Teste automatizado
    Type Text                      id=${elementos_aten_json["Informações adicionais"]}            Teste automatizado
    Click                          id=${elementos_aten_json["Adicionar medicamento"]} 
    Select Options By              id=${elementos_aten_json["Utiliza suplementos"]}                             Text                    SIM   
    Type Text                      id=${elementos_aten_json["Suplemento"]}            Teste automatizado
    Type Text                      id=${elementos_aten_json["Descrição"]}            Teste automatizado
    Click                          id=${elementos_aten_json["Adicionar suplemento"]} 
    Click                          id=stepDBS4
    Alergias

Alergias
    ${elementos_aten_json}         Get JSON                                                        elementos_aten.json
    Select Options By              id=${elementos_aten_json["Possui alergias"]}                             Text                    SIM   
    Wait For Elements State         id=${elementos_aten_json["Causa da alergia"]}                visible
    Select Options By              id=${elementos_aten_json["Causa da alergia"]}                             Text                    MEDICAMENTO   
    Type Text                      id=${elementos_aten_json["Descrição da alergia"]}            Teste automatizado
    Click                          id=${elementos_aten_json["Adicionar alergia"]} 
    Click                          id=stepDBS5
    Atividade física

Atividade física
    ${elementos_aten_json}         Get JSON                                                        elementos_aten.json
    Select Options By              id=${elementos_aten_json["Pratica atividade física"]}               Text                    SIM  
    Type Text                      id=${elementos_aten_json["Descrição da atividade física"]}            Teste automatizado
    Click                          id=stepDBS6
    Tabagismo

Tabagismo
    ${elementos_aten_json}         Get JSON                                                        elementos_aten.json
    Select Options By              id=${elementos_aten_json["Situação"]}               Text                    FUMA ATUALMENTE  
    Type Text                      id=${elementos_aten_json["Tempo que é fumante"]}            Teste automatizado
    Select Options By              id=${elementos_aten_json["Tipo"]}               Text                    OUTRO 
    ${numbers}=     Evaluate     random.randint(0, sys.maxsize)      random
    Type Text                      id=${elementos_aten_json["Quantidade diária"]}            ${numbers}
    Type Text                      id=${elementos_aten_json["Outro"]}            Teste automatizado
    Click                          id=stepDBS8
    História patológica pregressa

História patológica pregressa
    ${elementos_aten_json}          Get JSON                                                        elementos_aten.json
    Select Options By               id=${elementos_aten_json["Possui doença previamente diagnosticada"]}               Text                    SIM  
    Click                           xpath=${doença_antes}
    Type Text                       xpath=${doença_depois}                     FEBRE TIFÓIDE
    Sleep                           5s
    Click                           xpath=//*[@id="bs-select-10"]/ul/li[1]
    Click                           id=${elementos_aten_json["Adicionar história"]}
    Click                            id=stepDBS9
    Histórico médico familiar

Histórico médico familiar
    ${elementos_aten_json}          Get JSON                                                        elementos_aten.json
    Select Options By               id=${elementos_aten_json["Grau de parentesco"]}               Text                    OUTRO  
    Type Text                       id=${elementos_aten_json["Outro parente"]}                     Teste automatizado
    Type Text                       id=${elementos_aten_json["Descrição da doença"]}                     Teste automatizado
    Click                           xpath=${grupo_antes}
    Type Text                       xpath=${grupo_depois}                     ALGUMAS AFECÇÕES ORIGINADAS NO PERÍODO PERINATAL
    Sleep                           5s
    Click                           xpath=//*[@id="bs-select-11"]/ul/li[1]
    Click                           id=stepDBS10
    Observações adicionais

Observações adicionais
    ${elementos_aten_json}          Get JSON                                                        elementos_aten.json
    Type Text                       id=${elementos_aten_json["Observações adicionais"]}                     Teste automatizado
    Click                           id=stepDBS11
    Salvar DBS

Salvar DBS
   ${elementos_aten_json}          Get JSON                                                        elementos_aten.json
    Click                           xpath=${elementos_aten_json["Salvar DBS"]}
    mensagem de cadastro realizado com sucesso 

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
    #IF      '${campo}' == 'Remover exame'
     #   Click                          css=${elementos_aten_json["${campo}"]}
    #ELSE 
        Click                          xpath=${elementos_aten_json["${campo}"]} 
    #END
    Wait For Elements State        css=${elementos_aten_json["Tela de aviso"]}                   visible         6s   
    Click                          css=${elementos_aten_json["Sim"]} 

Adicionar item na tabela "${item}"
    ${elementos_aten_json}         Get JSON                 elementos_aten.json
     #IF      '${item}' == 'Adicionar exame'
      #  Click                          css=${elementos_aten_json["${item}"]}
    #ELSE 
    IF    '${item}' == 'Adicionar glicemia'
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
    Atestados "Sim"
    Click                          xpath=${elementos_aten_json["Avançar conduta"]}  
    Salvar dados da conduta 


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
    Select Options By              id=${elementos_aten_json["Campo para adicionar"]}            Text          NOME
    #Type Text       id=${elementos_aten_json["Editor histórico clínico"]}             Teste automatizado
    Repeat Keyword	2	  Repetidor "Adicionar campo"  
    Select Options By              id=${elementos_aten_json["Campo para adicionar dúvidas"]}        Text        NOME
    Repeat Keyword	2	  Repetidor "Adicionar campo dúvidas"  
    #Type Text       id=${elementos_aten_json["Editor dúvidas"]}             Teste automatizado
    Click           id=${elementos_aten_json["Salvar encaminhamento"]}
    Imprimir comprovante "Não"
    #Download de arquivos 
#Fluxo de remover e editar implementação 

Receituário de medicamentos
    ${elementos_aten_json}         Get JSON                                                        elementos_aten.json
    Click                          xpath=${adicionar_receituário}
    Select Options By              id=${elementos_aten_json["Tipo da receita"]}                    Text         NORMAL
    Type Text                      id=${elementos_aten_json["Descrição resumida"]}                  Teste automatizado
    Select Options By              id=${elementos_aten_json["Campos adicionar"]}        Text        NOME
    Repeat Keyword	2	  Repetidor "Adicionar campo receituario" 
    Click           id=${elementos_aten_json["Salvar receita"]}
    Imprimir comprovante "Não"
       
Exames preescritos
    ${elementos_aten_json}         Get JSON                                                        elementos_aten.json
    Click                          xpath=${adicionar_exame}
    Click            xpath=${procedimento_antes}
    Type Text        xpath=${procedimento_depois}                    ANÁLISE DE PROJETOS BÁSICOS DE ARQUITETURA
    Click            xpath=${procedimento_depois}
    Sleep            5s
    Click            xpath=//*[@id="bs-select-7"]/ul/li[1]
    Type Text                      id=${elementos_aten_json["Informações adicionais sobre a requisição"]}                  Teste automatizado
    Select Options By              id=${elementos_aten_json["Campo adicionar exame"]}            Text         NOME
    Repeat Keyword  2	  Repetidor "Adicionar campo exame" 
    Click              id=${elementos_aten_json["Salvar exame"]}
    Imprimir comprovante "Não"
    Adcionar novo exame "Não"
    
       
Atestados "${opção_CID}"
    ${elementos_aten_json}                Get JSON                                                        elementos_aten.json
    ${opção_CID} =	                        Convert To Upper Case                    ${opção_CID}
    
    FOR  ${contador2}     IN RANGE    1   3
        Type Text                      id=${elementos_aten_json["Hora do Atendimento"]}                    1000
        ${numbers}=                    Evaluate                                                         random.randint(0, sys.maxsize)      random
        Type Text                      id=${elementos_aten_json["Dias de repouso"]}                     ${numbers}
        Select Options By              id=${elementos_aten_json["Adicionar o CID ao atestado"]}            Text         ${opção_CID}
        Click                          xpath=${atestado_antes}
        Type Text                      xpath=${atestado_depois}                     FEBRE TIFÓIDE
        Sleep            5s
        Click               xpath=//*[@id="bs-select-8"]/ul/li[1]
        Click                          xpath=${adicionar_atestado}

        IF  '${contador2}'=='1'
            remover item da tabela "Remover atestado"
        END
    END
    

Salvar dados da conduta 
    ${elementos_aten_json}         Get JSON                elementos_aten.json    
    Click                          xpath=${elementos_aten_json["Cadastrar conduta"]} 
    mensagem de cadastro realizado com sucesso  
    
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

informar dados da evolução
    ${elementos_aten_json}          Get JSON                        elementos_aten.json
    Click                           id=${elementos_aten_json["Evolução"]} 
    Relato de procedimento

Relato de procedimento
    ${elementos_aten_json}         Get JSON       elementos_aten.json
    FOR    ${cont}       IN RANGE    1   3
        Click            xpath=${proc_antes}
        Type Text        xpath=${proc_depois}                    ANÁLISE DE PROJETOS BÁSICOS DE ARQUITETURA
        Click            xpath=${proc_depois}
        Sleep   5s
        Click            xpath=//*[@id="bs-select-9"]/ul/li[1]
        Type Text                       id=${elementos_aten_json["Data procedimento"]}                     20102021
        Type Text                       id=${elementos_aten_json["Hora de início"]}                        1000
        Type Text                       id=${elementos_aten_json["Hora de término"]}                       1100
        Type Text                       id=${elementos_aten_json["Descrição evolução"]}            Teste automatizado
        Type Text                       id=${elementos_aten_json["Material usado"]}               Teste automatizado
        Click                           css=button[onclick='adicionarRelatoProcedimento()']
        IF  '${cont}'=='1'
            remover item da tabela "Remover procedimento"
        END
    END
    Click            xpath=${elementos_aten_json["Avançar evolução"]}
    Documentação pertinente


Documentação pertinente
    ${elementos_aten_json}         Get JSON       elementos_aten.json
    FOR    ${cont}       IN RANGE    1   3
        Type Text                       id=${elementos_aten_json["Descrição do documento"]}                    Teste automatizado
        Upload de arquivos 
        Click            css=button[onclick='addDocumentoPertinenteEV()']
        IF  '${cont}'=='1'
            remover item da tabela "Remover documento"
        END
    END
    Click            xpath=${elementos_aten_json["Avançar evolução"]}
    Salvar dados da evolução


Salvar dados da evolução
    ${elementos_aten_json}         Get JSON                elementos_aten.json    
    Click                          xpath=${elementos_aten_json["Cadastrar evolução"]} 
    mensagem de cadastro realizado com sucesso  

Download de arquivos 
    ${url}          Set Variable             https://testessigsaude.imd.ufrn.br/sigsaude/condutaTerapeutica/imprimir/encaminhamento
    ${path}=        Download                 ${url}  
    ${actual_size}=    Get File Size    ${path.saveAs}

Upload de arquivos
    ${elementos_aten_json}         Get JSON                elementos_aten.json    
    ${promise}=    Promise To Upload File           ${CURDIR}/Arquivos/b.png
    Click           id=${elementos_aten_json["Documento"]}
    ${upload_result}=  Wait For  ${promise}


