***Settings***
Documentation       Cadastro dados básicos de saúde

Resource        ${EXECDIR}/Resources/Page_config_iniciais.robot

*** Variables ***

&{Campos_DBS}
...  peso=inputPeso
...  altura=inputAltura
...  temperatura=inputTemperatura
...  frequencia_respiratoria=inputFrequenciaRespiratoria
...  frequencia_cardiaca=inputFrequenciaCardiaca
...  pressao_sistolica=inputPressaoSistolica
...  frequencia_diastolica=inputPressaoDiastolica
...  saturacaoO2=inputSaturacaoO2
...  glicemia=inputGlicemia
...  tipo_procedencia=selectTipoProcedencia
...  motivo_consulta=textareaMotivoConsulta
...  descricao_tratamento=textareaDescricaoTratamento
...  utiliza_medicamentos=utilizaMedicamentos
...  medicamentos=inputMedicamento0
...  informacoes_adicionais=inputMedicamentoInformacoesAdicionais0
...  doenca_diagnosticada=possuDoencaDiagnosticada
...  doenca1=//*[@id="buscaDoencaDiv"]/div/div[1]/button/div/div/div
...  doenca2=//*[@id="buscaDoencaDiv"]/div/div[1]/div/div[1]/input
...  selecionar_doença=bs-select-2-0
...  grau_parentesco=selectGrauParentesco0
...  outro_parente=inputOutroParente0
...  descricao_doenca=inputNomeDoencaHistorico0
...  doenca_familiar1=//*[@id="historicoFamiliar0"]/div[4]/div/div[1]/button/div/div/div
...  doenca_familiar2=//*[@id="historicoFamiliar0"]/div[4]/div/div[1]/div/div[1]/input
...  selecionar_doenca_familiar=//*[@id="bs-select-3-1"]/span
...  observacoes_adicionais=textareaObservacoesAdicionais

&{Valor_campos_DBS}
...  peso=10
...  altura=10
...  temperatura=10
...  frequencia_respiratoria=10
...  frequencia_cardiaca=10
...  pressao_sistolica=10
...  frequencia_diastolica=10
...  saturacaoO2=10
...  glicemia=10
...  tipo_iniciativa=INICIATIVA PRÓPRIA
...  motivo_consulta=Teste automatizado
...  descricao_tratamento=Teste automatizado
...  utiliza_medicamentos=SIM
...  medicamentos=Teste automatizados
...  informacoes_adicionais=Teste automatizados
...  doenca_diagnosticada=SIM
...  doenca2=FEBRE AMARELA
...  grau_parentesco=OUTRO
...  outro_parente=Teste automatizados
...  descricao_doenca=Teste automatizados
...  doenca_familiar2=ALGUMAS AFECÇÕES ORIGINADAS NO PERÍODO PERINATAL
...  observacoes_adicionais= Teste automatizado


&{Buttons_DBS}
...  avançar=nextBtn
...  cadastrar=nextBtn
...  OK=/html/body/div[2]/div/div[3]/div/button
...  adicionar_medicamento=buttonAddMedicamento0
...  adicionar_diagnostico=buttonAddDiagnostico0
...  adicionar_doenca_familiar=//*[@id="historicoFamiliar0"]/div[4]/div/div[2]/button



***Keywords***

informar medidas e sinais vitais
    preencher o ${Campos_DBS.peso} com ${Valor_campos_DBS.peso}
    preencher o ${Campos_DBS.altura} com ${Valor_campos_DBS.altura}
    preencher o ${Campos_DBS.temperatura} com ${Valor_campos_DBS.temperatura}
    preencher o ${Campos_DBS.frequencia_respiratoria} com ${Valor_campos_DBS.frequencia_respiratoria}
    preencher o ${Campos_DBS.frequencia_cardiaca} com ${Valor_campos_DBS.frequencia_cardiaca}
    preencher o ${Campos_DBS.pressao_sistolica} com ${Valor_campos_DBS.pressao_sistolica}
    preencher o ${Campos_DBS.frequencia_diastolica} com ${Valor_campos_DBS.frequencia_diastolica}
    preencher o ${Campos_DBS.saturacaoO2} com ${Valor_campos_DBS.saturacaoO2}
    preencher o ${Campos_DBS.glicemia} com ${Valor_campos_DBS.glicemia}

informar procedência do usuário do serviço
    selecionar o ${Valor_campos_DBS.tipo_iniciativa} no ${campos_DBS.tipo_procedencia}

informar historia clinica
     preencher o ${Campos_DBS.descricao_tratamento} com ${Valor_campos_DBS.descricao_tratamento}


informar medicamentos
    selecionar o ${Valor_campos_DBS.utiliza_medicamentos} no ${campos_DBS.utiliza_medicamentos}
    preencher o ${Campos_DBS.medicamentos} com ${Valor_campos_DBS.medicamentos}
    preencher o ${Campos_DBS.informacoes_adicionais} com ${Valor_campos_DBS.informacoes_adicionais}
    clicar no ${Buttons_DBS.adicionar_medicamento}

informar historia patologica pregressa
    selecionar o ${Valor_campos_DBS.doenca_diagnosticada} no ${campos_DBS.doenca_diagnosticada}
    informar a doença
    clicar no ${Buttons_DBS.adicionar_diagnostico}

informar a doença
    Click               xpath=${Campos_DBS.doenca1}
    Type Text            xpath=${Campos_DBS.doenca2}                      ${Valor_campos_DBS.doenca2} 
    Sleep   3s
    Click               id=${Campos_DBS.selecionar_doença}

informar historico médico familiar
    selecionar o ${Valor_campos_DBS.grau_parentesco} no ${campos_DBS.grau_parentesco}
    preencher o ${Campos_DBS.outro_parente} com ${Valor_campos_DBS.outro_parente}
    preencher o ${Campos_DBS.descricao_doenca} com ${Valor_campos_DBS.descricao_doenca}
    informar a doença familiar
    clicar em ${Buttons_DBS.adicionar_doenca_familiar}

informar a doença familiar
    Click               xpath=${Campos_DBS.doenca_familiar1}
    Type Text           xpath=${Campos_DBS.doenca_familiar2}                      ${Valor_campos_DBS.doenca_familiar2} 
    Sleep   3s
    Click               xpath=${Campos_DBS.selecionar_doenca_familiar}

informar observações adicionais 
     preencher o ${Campos_DBS.observacoes_adicionais} com ${Valor_campos_DBS.observacoes_adicionais}


