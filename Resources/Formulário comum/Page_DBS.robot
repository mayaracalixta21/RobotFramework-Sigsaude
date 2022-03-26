***Settings***
Documentation       Cadastro dados básicos de saúde

Resource        ${EXECDIR}/Resources/Page_keywords.robot

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
...  informacoes_adicionai=inputMedicamentoInformacoesAdicionais0
...  doenca_diagnosticada=possuDoencaDiagnosticada
...  doenca1=//*[@id="buscaDoencaDiv"]/div/div[1]/button/div/div/div
...  doenca2=//*[@id="buscaDoencaDiv"]/div/div[1]/div/div[1]/input
...  selecionar_doença=bs-select-2-0

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
...  medicamentoo=Teste automatizados
...  doenca_diagnosticada=SIM
...  doenca2=FEBRE AMARELA

&{Buttons_DBS}
...  avançar=nextBtn
...  cadastrar=nextBtn
...  OK=/html/body/div[2]/div/div[3]/div/button
...  adicionar_medicamento=buttonAddMedicamento0
...  adicionar_diagnostico=buttonAddDiagnostico0



***Keywords***

medidas e sinais vitais
    preencher o ${Campos_DBS.peso} com ${Valor_campos_DBS.peso}
    preencher o ${Campos_DBS.altura} com ${Valor_campos_DBS.altura}
    preencher o ${Campos_DBS.temperatura} com ${Valor_campos_DBS.temperatura}
    preencher o ${Campos_DBS.frequencia_respiratoria} com ${Valor_campos_DBS.frequencia_respiratoria}
    preencher o ${Campos_DBS.frequencia_cardiaca} com ${Valor_campos_DBS.frequencia_cardiaca}
    preencher o ${Campos_DBS.pressao_sistolica} com ${Valor_campos_DBS.pressao_sistolica}
    preencher o ${Campos_DBS.frequencia_diastolica} com ${Valor_campos_DBS.frequencia_diastolica}
    preencher o ${Campos_DBS.saturacaoO2} com ${Valor_campos_DBS.saturacaoO2}
    preencher o ${Campos_DBS.glicemia} com ${Valor_campos_DBS.glicemia}

procedência do usuário do serviço
    selecionar o ${Valor_campos_DBS.tipo_iniciativa} no ${campos_DBS.tipo_iniciativa}


medicamentos
    selecionar o ${Valor_campos_DBS.utiliza_medicamentos} no ${campos_DBS.utiliza_medicamentos}
    preencher o ${Campos_DBS.medicamentos} com ${Valor_campos_DBS.medicamentos}
    preencher o ${Campos_DBS.informacoes_adicionai} com ${Valor_campos_DBS.informacoes_adicionai}
    clicar no ${Buttons_DBS.adicionar_medicamento}

história patológica pregressa
    selecionar o ${Valor_campos_DBS.doenca_diagnosticada} no ${campos_DBS.doenca_diagnosticada}
    informar a doença
    clicar no ${Buttons_DBS.adicionar_diagnostico}

informar a doença
    Click               xpath=${Campos_DBS.doenca1}
    Fill Text           xpath=${Campos_DBS.doenca2}                      ${Valor_campos_DBS.doenca2} 
    Click               id=${Campos_DBS.selecionar_doença}
