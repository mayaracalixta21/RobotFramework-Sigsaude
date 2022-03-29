***Settings***
Documentation       Cadastro dados básicos de saúde

Resource        ${EXECDIR}/Resources/Page_config_iniciais.robot

*** Variables ***

&{Campos_CON}
...  descricao_conduta=descricaoCt
...  tipo_servico=selectTipoServico
...  ser_interno1=//*[@id="divBuscaServico"]/div[1]/button/div/div/div
...  ser_interno2=//*[@id="divBuscaServico"]/div[1]/div/div[1]/input
...  selecionar_ser=//*[@id="bs-select-6"]/ul
...  ser_externo=inputServicoExterno
...  prioridade=selectPrioridade
...  mod_aten1=//*[@id="divBuscaModalidade"]/div[1]/button/div/div/div
...  mod_aten2=//*[@id="divBuscaModalidade"]/div[1]/div/div[1]/input
...  selecionar_mod_aten=//*[@id="bs-select-7-0"]
...  campo_add=camposH
...  campo_add_d=camposD
...  tipo_receita=tipoReceitaCt
...  resumo_receita=resumoReceitaCt
...  add_campo_rec=campos
...  procedimento1=//*[@id="divBuscaProcedimento"]/div[1]/button/div/div/div
...  procedimento2=//*[@id="divBuscaProcedimento"]/div[1]/div/div[1]/input
...  selecionar_procedimento=//*[@id="bs-select-8"]/ul/li
...  add_campo_exa=camposE
...  hora_atendimento=horaAtendimentoAtestadoCt
...  dias_repouso=diasRepousoAtestadoCt
...  add_CID=selectAddCidAtestado
...  doenca_CID1=//*[@id="divBuscaCid10AtestadoCt"]/div[1]/button/div/div/div
...  doenca_CID2=//*[@id="divBuscaCid10AtestadoCt"]/div[1]/div/div[1]/input
...  selecionar_doenca_CID=//*[@id="bs-select-9"]/ul/li[1]

&{Valor_campos_CON}
...  descricao_conduta=Teste automatizado
...  tipo_servico=INTERNO
...  ser_interno2=FACISA
...  ser_externo=Teste automatizado
...  prioridade=ALTA
...  mod_aten2=ATENDIMENTO A PESSOAS IDOSAS
...  campo_add=DATA DO ATENDIMENTO
...  campo_add_d=DATA DO ATENDIMENTO
...  tipo_receita=NORMAL
...  resumo_receita=Teste automatizado
...  add_campo_rec=DATA DO ATENDIMENTO
...  procedimento2=ATENDIMENTO À DENÚNCIAS/RECLAMAÇÕES
...  add_campo_exa=DATA DO ATENDIMENTO
...  hora_atendimento=10:00
...  dias_repouso=5
...  add_CID=SIM
...  doenca_CID2=FEBRE TIFÓIDE

&{Buttons_CON}
...  avançar=/html/body/div/div[2]/div/div/section/div[2]/div[3]/div[2]/div/div/div[2]/div/div[4]/div/div/div[1]/form[6]/div[3]/div/button[2]
...  cadastrar=/html/body/div/div[2]/div/div/section/div[2]/div[3]/div[2]/div/div/div[2]/div/div[4]/div/div/div[1]/form[6]/div[3]/div/button[2]
...  OK=/html/body/div[2]/div/div[3]/div/button
...  sim=/html/body/div[2]/div/div[3]/div[2]/button
...  nao=/html/body/div[2]/div/div[3]/div[1]/button
...  conduta=ct
...  add_enc=//*[@id="multistepFormCt"]/div[2]/div[1]/div[2]/div[2]/div[1]/div/a[1]
...  add_campo=btnAddH
...  add_campo_d=btnAddD
...  add_encaminhamento=buttonSalvarEn
...  add_campo_rec=btnAdd
...  add_receita=buttonSalvar
...  add_rec=//*[@id="multistepFormCt"]/div[2]/div[1]/div[2]/div[5]/div[1]/div/a[1]
...  add_exa=//*[@id="multistepFormCt"]/div[2]/div[1]/div[2]/div[8]/div[1]/div/a[1]/span
...  add_campo_exa=btnAddE
...  salvar_exame=buttonSalvarE
...  add_atestados=//*[@id="multistepFormCt"]/div[2]/div[1]/div[2]/div[11]/div/div[2]/div/div[1]/div[5]/button


***Keywords***

iniciar conduta terapêutica
    clicar no ${Buttons_CON.conduta}

informar dados da conduta terapêutica
    iniciar conduta terapêutica
    preencher o ${Campos_CON.descricao_conduta} com ${Valor_campos_CON.descricao_conduta}
    clicar em ${Buttons_CON.add_enc}
    encaminhamento
    clicar em ${Buttons_CON.add_rec}
    receituário de medicamentos
    clicar em ${Buttons_CON.add_exa}
    exames prescritos
    atestados

encaminhamento
    selecionar o ${Valor_campos_CON.tipo_servico} no ${Campos_CON.tipo_servico}
    serviço de destino ${Valor_campos_CON.tipo_servico}
    selecionar o ${Valor_campos_CON.prioridade} no ${Campos_CON.prioridade}
    selecionar modalidade de atendimento
    adicionar campo
    adicionar campo dúvidas
    clicar no ${Buttons_CON.add_encaminhamento}
    imprimir

serviço de destino ${CAMPO}
    IF  '${CAMPO}' == 'INTERNO'
        Click               xpath=${Campos_CON.ser_interno1}
        Type Text           xpath=${Campos_CON.ser_interno2}                      ${Valor_campos_CON.ser_interno2}
        Sleep   2s
        Click               xpath=${Campos_CON.selecionar_ser}
    ELSE
        preencher o ${Campos_CON.ser_externo} com ${Valor_campos_CON.ser_externo}
    END

selecionar modalidade de atendimento
    Click               xpath=${Campos_CON.mod_aten1}
    Type Text           xpath=${Campos_CON.mod_aten2}                      ${Valor_campos_CON.mod_aten2}
    Sleep   2s
    Click               xpath=${Campos_CON.selecionar_mod_aten}


adicionar campo
     selecionar o ${Valor_campos_CON.campo_add} no ${Campos_CON.campo_add}
    FOR     ${contador}      IN RANGE    1    6
        clicar no ${Buttons_CON.add_campo}
    END

adicionar campo dúvidas
    selecionar o ${Valor_campos_CON.campo_add_d} no ${Campos_CON.campo_add_d}
    FOR     ${contador}      IN RANGE    1    6
        clicar no ${Buttons_CON.add_campo_d}
    END

imprimir
    clicar em ${Buttons_CON.sim}

receituário de medicamentos
    selecionar o ${Valor_campos_CON.tipo_receita} no ${Campos_CON.tipo_receita}
    preencher o ${Campos_CON.resumo_receita} com ${Valor_campos_CON.resumo_receita}
    adicionar campo encaminhamento
    clicar no ${Buttons_CON.add_receita}
    imprimir

adicionar campo encaminhamento
    selecionar o ${Valor_campos_CON.add_campo_rec} no ${Campos_CON.add_campo_rec}
    FOR     ${contador}      IN RANGE    1    6
        clicar no ${Buttons_CON.add_campo_rec}
    END

exames prescritos
    Click               xpath=${Campos_CON.procedimento1}
    Type Text           xpath=${Campos_CON.procedimento2}                      ${Valor_campos_CON.procedimento2}
    Sleep   2s
    Click               xpath=${Campos_CON.selecionar_procedimento}
    selecionar o ${Valor_campos_CON.add_campo_exa} no ${Campos_CON.add_campo_exa}
    FOR     ${contador}      IN RANGE    1    6
        clicar no ${Buttons_CON.add_campo_exa}
    END
    clicar no ${Buttons_CON.salvar_exame}
    imprimir
    clicar em ${Buttons_CON.nao}


atestados
    preencher o ${Campos_CON.hora_atendimento} com ${Valor_campos_CON.hora_atendimento}
    preencher o ${Campos_CON.dias_repouso} com ${Valor_campos_CON.dias_repouso}
    selecionar o ${Valor_campos_CON.add_CID} no ${Campos_CON.add_CID}
    Click               xpath=${Campos_CON.doenca_CID1}
    Type Text           xpath=${Campos_CON.doenca_CID2}                      ${Valor_campos_CON.doenca_CID2}
    Sleep   2s
    Click               xpath=${Campos_CON.selecionar_doenca_CID}
    clicar em ${Buttons_CON.add_atestados}

analise upload de arquivo ${CAMPO}
    ${promise}=    Promise To Upload File          C:/Users/Mayara/Documents/TCC/RobotFramework-Sigsaude/Resources/Arquivos/b.png
    Click           id=${CAMPO}
    ${upload_result}=  Wait For  ${promise}


Analise função para download
    ${dl_promise}        Promise To Wait For Download    /path/to/download/file.name
    ${file_obj}=         Wait For  ${dl_promise}
    File Should Exist    ${file_obj}[saveAs]
    Should Be True       ${file_obj.suggestedFilename}

