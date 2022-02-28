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

&{Valor_campos_oferta}
...  denominacao=Oferta nutrição
...  data_inicio=10032022
...  data_fim=10082022
...  inicio_do_expediente=1000
...  fim_do_expediente=2200


&{Buttons}
...  avançar=nextBtn
...  cadastrar=nextBtn
...  OK=/html/body/div[2]/div/div[3]/div/button
...  adicionar=//*[@id="formConvenioApp"]/div[2]/div[3]/div/div[1]/div/div/div[2]/button

***Keywords***

inserir modalidade ${CAMPO}
    Click           xpath=${CAMPO}
    Fill Text       xpath=${Campos_oferta.modalidade2}       ${Campos_oferta.modalidade3}
    Click           xpath=${Buttons.adicionar}
