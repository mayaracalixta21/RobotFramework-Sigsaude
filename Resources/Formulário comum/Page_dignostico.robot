***Settings***
Documentation       Cadastro dados básicos de saúde

Resource        ${EXECDIR}/Resources/Page_config_iniciais.robot

*** Variables ***

&{Campos_DIG}
...  descricao_diagnostico=descricaoDiagnostico
...  diagnostico1=//*[@id="divBuscaDoencaDadosDiagnostico"]/div/button/div/div/div
...  diagnostico2=//*[@id="divBuscaDoencaDadosDiagnostico"]/div/div/div[1]/input
...  selecionar_diagnostico=//*[@id="bs-select-5-0"]/span[2]
...  des_exame=descDocExame
...  des_doc=descDoc

&{Valor_campos_DIG}
...  descricao_diagnostico=Teste automatizado
...  diagnostico2=FEBRE TIFÓIDE
...  des_exame=Teste automatizado
...  des_doc=Teste automatizado


&{Buttons_DIG}
...  avançar=/html/body/div/div[2]/div/div/section/div[2]/div[3]/div[2]/div/div/div[2]/div/div[3]/div/div/div[1]/form/div[3]/div/button[2]
...  cadastrar=/html/body/div/div[2]/div/div/section/div[2]/div[3]/div[2]/div/div/div[2]/div/div[3]/div/div/div[1]/form/div[3]/div/button[2]
...  OK=/html/body/div[2]/div/div[3]/div/button
...  diagnostico=dd
...  exames=docExame
...  doc_gerais=docGerais
...  add_exame=//*[@id="exames"]/div/div[1]/div[3]/button
...  add_doc=//*[@id="multistepFormDd"]/div[2]/div[3]/div/div[3]/div/div[1]/div[3]/button


***Keywords***

iniciar dados de diagnostico
    clicar no ${Buttons_DIG.diagnostico}

informar descrição
    preencher o ${Campos_DIG.descricao_diagnostico} com ${Valor_campos_DIG.descricao_diagnostico}

informar diagnóstico
    Click               xpath=${Campos_DIG.diagnostico1}
    Type Text           xpath=${Campos_DIG.diagnostico2}                      ${Valor_campos_DIG.diagnostico2} 
    Sleep   3s
    Click               xpath=${Campos_DIG.selecionar_diagnostico}

informar documentos
    preencher o ${Campos_DIG.des_exame} com ${Valor_campos_DIG.des_exame}
    upload de arquivo ${Buttons_DIG.exames}
    clicar em ${Buttons_DIG.add_exame}
    preencher o ${Campos_DIG.des_doc} com ${Valor_campos_DIG.des_doc}
    upload de arquivo ${Buttons_DIG.doc_gerais}
    clicar em ${Buttons_DIG.add_doc}

upload de arquivo ${CAMPO}
    ${promise}=    Promise To Upload File         /home/m.calixta/Sigsaude/RobotFramework-Sigsaude/Resources/Arquivos/b.png
    Click           id=${CAMPO}
    ${upload_result}=  Wait For  ${promise}

