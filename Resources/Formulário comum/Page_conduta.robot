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

&{Valor_campos_CON}
...  descricao_conduta=Teste automatizado
...  tipo_servico=INTERNO
...  ser_interno2=FACISA
...  ser_externo=Teste automatizado
...  prioridade=ALTA
...  mod_aten2=ATENDIMENTO A PESSOAS IDOSAS
...  campo_add=DATA DO ATENDIMENTO
...  campo_add_d=DATA DO ATENDIMENTO

&{Buttons_CON}
...  avançar=/html/body/div/div[2]/div/div/section/div[2]/div[3]/div[2]/div/div/div[2]/div/div[3]/div/div/div[1]/form/div[3]/div/button[2]
...  cadastrar=/html/body/div/div[2]/div/div/section/div[2]/div[3]/div[2]/div/div/div[2]/div/div[3]/div/div/div[1]/form/div[3]/div/button[2]
...  OK=/html/body/div[2]/div/div[3]/div/button
...  conduta=ct
...  add_enc=//*[@id="multistepFormCt"]/div[2]/div[1]/div[2]/div[2]/div[1]/div/a[1]
...  add_campo=btnAddH
...  add_campo_d=btnAddD
...  add_encaminhamento=buttonSalvarEn

***Keywords***

iniciar conduta terapêutica
    clicar no ${Buttons_CON.conduta}

informar dados da conduta terapêutica
    iniciar conduta terapêutica
    preencher o ${Campos_CON.descricao_conduta} com ${Valor_campos_CON.descricao_conduta}
    clicar em ${Buttons_CON.add_enc}
    encaminhamento

encaminhamento
    selecionar o ${Valor_campos_CON.tipo_servico} no ${Campos_CON.tipo_servico}
    serviço de destino ${Valor_campos_CON.tipo_servico}
    selecionar o ${Valor_campos_CON.prioridade} no ${Campos_CON.prioridade}
    selecionar modalidade de atendimento
    adicionar campo
    adicionar campo dúvidas
    clicar no ${Buttons_CON.add_encaminhamento}

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


upload de arquivo ${CAMPO}
    ${promise}=    Promise To Upload File          C:/Users/Mayara/Documents/TCC/RobotFramework-Sigsaude/Resources/Arquivos/b.png
    Click           id=${CAMPO}
    ${upload_result}=  Wait For  ${promise}

