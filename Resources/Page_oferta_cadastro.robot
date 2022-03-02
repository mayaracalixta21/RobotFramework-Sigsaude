***Settings***
Documentation       Cadastro oferta de atendimento


*** Variables ***

&{Campos_oferta}
...  denominacao=inputDenominacao
...  data_inicio=inputDataInicio
...  data_fim=inputDataFim
...  inicio_do_expediente=inputHorarioInicio
...  fim_do_expediente=inputHorarioFim
...  modalidade1=//*[@id="formConvenioApp"]/div[2]/div[3]/div/div[1]/div/div/div[1]/div/div[2]
...  modalidade2=//*[@id="formConvenioApp"]/div[2]/div[3]/div/div[1]/div/div/div[1]/div/div[2]/input
...  modalidade3= ${Valor_campos_modalidade.denominacao} - Especialidade: ${Valor_campos_especialidade.denominacao}
...  descrição_escala=inputDescricaoEscala
...  data_inicio_escala=inputDataInicioEscala
...  data_fim_escala=inputDataFimEscala


&{Valor_campos_oferta}
...  denominacao=Oferta nutriçãoo
...  data_inicio=10032022
...  data_fim=10082022
...  inicio_do_expediente=1000
...  fim_do_expediente=2200
...  descricao_escala=Escala1
...  data_inicio_escala=11/03/2022
...  data_fim_escala=09092022


&{Buttons_oferta}
...  avançar=nextBtn
...  cadastrar=nextBtn
...  OK=/html/body/div[2]/div/div[3]/div/button
...  selecionar=//*[@id="formConvenioApp"]/div[2]/div[3]/div/div[1]/div/div/div[1]/div/div[3]/ul/li[1]
...  adicionar=//*[@id="formConvenioApp"]/div[2]/div[3]/div/div[1]/div/div/div[2]/button
...  adicionar_escala=//*[@id="formConvenioApp"]/div[2]/div[3]/div/div[2]/div/ul/li/div/button[1]
...  concluir_escala=salvarE
...  tempo_medio_escala=tempoMedio
...  salvar=nextBtn

***Keywords***

inserir modalidade ${CAMPO}
    Click           xpath=${CAMPO}
    Fill Text       xpath=${Campos_oferta.modalidade2}       ${Campos_oferta.modalidade3}
    Click           xpath=${Buttons_oferta.selecionar}
    Click           xpath=${Buttons_oferta.adicionar}


Adicionar escala ${VALOR}
    Click           xpath=${Buttons_oferta.adicionar_escala}
    Fill Text       id=${Campos_oferta.descrição_escala}         ${VALOR}
    #Click           id=${Buttons_oferta.tempo_medio_escala}
    #Click           id=${Campos_oferta.data_inicio_escala}
    # Fill Text       id=${Campos_oferta.data_inicio_escala}       11/11/1111
    #Fill Text       id=${Campos_oferta.data_fim_escala}          ${Valor_campos_oferta.data_fim_escala}

    FOR     ${cont}    IN RANGE    3   8
        Click           xpath=//*[@id="calendar"]/div[2]/div/table/tbody/tr/td/div/div/div[3]/table/tbody/tr/td[${cont}]
    END

 



