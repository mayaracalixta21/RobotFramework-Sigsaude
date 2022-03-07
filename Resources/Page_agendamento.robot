***Settings***
Documentation       Agendamento

Resource            ${EXECDIR}/Resources/Page_agendamento_functions.robot

Library             ${EXECDIR}/Librarys/verificacoes.py

*** Variables ***
${table} =           //*[@id="calendar"]/div/div/table/tbody/tr/td/div/div/
${fim} =             /a/div/div
${aux}
${idconsultas}


&{Agendamento}
...  mes_do_agendamento=nomemes
...  mes_do_cancelamento=nomemes
...  avancar=btNext
...  voltar=btPrevious


&{Filtro_agendamentos}
...  disponiveis=DISPONIVEIS
...  agendados=AGENDADOS
...  identificador=//*[@id="calendario"]/section/div/div/div/div/div[1]/div/


&{Campos_agendamento}
...  filtro_modalidade_inseir=//*[@id="filtro-modal"]/div/div/div[2]/form/div[2]/div/div/div[1]/input
...  usuario_de_servico1=//*[@id="autocompletUsuario"]/div/button/div/div/div
...  usuario_de_servico2=//*[@id="autocompletUsuario"]/div/div/div[1]/input
...  observacao=//*[@id="event-modal"]/div/div/div[2]/form/div[4]/div[8]/textarea
...  identificador_consulta=//*[@id="listTipoAtendimento"]
...  consulta=//*[@id="cfg_atendimento"]/button
...  identificador_status=//*[@id="listStatus"]
...  justificativa=//*[@id="justificativa"]/textarea


&{Valor_campos_agendamento}
...  filtro_modalidade=Nutrição
...  dia=05
...  mes=05
...  ano=2022
...  dia_c=17
...  mes_c=05
...  ano_c=2022
...  usuario_de_servico2=Mayara
...  observacao=Teste automatizado
...  consulta_primeira_vez=primeira vez
...  consulta_retorno=retorno
...  consulta_regular=regular
...  status_agendado=agendado
...  status_atendido=atendido
...  status_cancelado=cancelado
...  status_compareceu=compareceu
...  justificativa=Teste automatizado

&{Buttons_agendamento}
...  deselecionar_todas=//*[@id="filtro-modal"]/div/div/div[2]/form/div[2]/div/div/div[2]/div/button[2]
...  selecionar_modalidade=bs-select-5-11
...  aplicar_filtro=//*[@id="filtro-modal"]/div/div/div[3]/button[1]
...  filtro_busca=//*[@id="calendario"]/section/div/div/div/div/div[1]/div/span[9]
...  filtro_modalidade=//*[@id="filtro-modal"]/div/div/div[2]/form/div[2]/div/button/div/div/div
...  selecionar_usuario=bs-select-4
...  adicionar_observacao=//*[@id="adicionar_observacao"]/div/label/span[1]
...  salvar=//*[@id="botoesModal"]/button[1]
...  envio_email=/html/body/div[5]/div
...  sim=/html/body/div[5]/div/div[4]/div[2]/button
...  status=cfg_status

***Keywords***

filtrar ${VALOR}
   IF   "${VALOR}" == "${Filtro_agendamentos.disponiveis}"
        FOR    ${contador}    IN RANGE    2  6
            Click         xpath=${Filtro_agendamentos.identificador}span[${contador}]
        END
    ELSE IF  "${VALOR}" == "${Filtro_agendamentos.agendados}"
        FOR    ${contador}    IN RANGE    3  7
            Click         xpath=${Filtro_agendamentos.identificador}span[${contador}]
        END
    END

informar modalidade para o filtro ${VALOR}
    Click           xpath=${Buttons_agendamento.filtro_busca}
    Click           xpath=${Buttons_agendamento.filtro_modalidade}
    Click           xpath=${Buttons_agendamento.deselecionar_todas}
    Type Text       xpath=${Campos_agendamento.filtro_modalidade_inseir}        ${VALOR}
    Click           id=${Buttons_agendamento.selecionar_modalidade}
    Click           xpath=${Buttons_agendamento.aplicar_filtro}

realizar agendamento

    FOR    ${i}    IN RANGE    9999999
        ${mes_agendamento}=             Get Text             id=${Agendamento.mes_do_agendamento}
        @{lista_mes_agendamento} =	    Split String	      ${mes_agendamento}

        ${mes_aux} =           retirar zero esquerda        ${Valor_campos_agendamento.mes}
        ${mes_aux2} =           Mês Convertion               ${mes_aux}


        Exit For Loop If    '${lista_mes_agendamento[0]}' == '${mes_aux2}' and '${lista_mes_agendamento[2]}' == '${Valor_campos_agendamento.ano}'

       ${mes_ver} = 	Get Current Date	        result_format=%m
       ${mes_ver} =     retirar zero esquerda       ${mes_ver}
       ${mes_ver2} =    retirar zero esquerda       ${Valor_campos_agendamento.mes}


        IF  ${mes_ver2} > ${mes_ver}
            Click       id=${Agendamento.avancar}
        ELSE IF     ${mes_ver2} < ${mes_ver}
            Click       id=${Agendamento.voltar}
        END
    END

    ${diadasemana}         Date Convertion         ${Valor_campos_agendamento.ano}/${Valor_campos_agendamento.mes}/${Valor_campos_agendamento.dia}

        IF     '${diadasemana}' == 'Segunda-feira'
            ${aux}            Set Variable            1
            ${cont}=          Procura dia             ${Valor_campos_agendamento.dia}        ${aux}
            Click             xpath=${table}div[${cont}]/div[2]/table/tbody/tr[1]/td[1]${fim}
        ELSE IF     '${diadasemana}' == 'Terça-feira'
            ${aux}            Set Variable            2
            ${cont}=          Procura dia             ${Valor_campos_agendamento.dia}        ${aux}
            Click             xpath=${table}div[${cont}]/div[2]/table/tbody/tr[1]/td[2]${fim}
        ELSE IF     '${diadasemana}' == 'Quarta-feira'
            ${aux}            Set Variable            3
            ${cont}=          Procura dia             ${Valor_campos_agendamento.dia}        ${aux}
            Click             xpath=${table}div[${cont}]/div[2]/table/tbody/tr[1]/td[3]${fim}
        ELSE IF     '${diadasemana}' == 'Quinta-feira'
            ${aux}            Set Variable            4
            ${cont}=          Procura dia             ${Valor_campos_agendamento.dia}        ${aux}
            Click             xpath=${table}div[${cont}]/div[2]/table/tbody/tr[1]/td[4]${fim}
        ELSE IF     '${diadasemana}' == 'Sexta-feira'
            ${aux}            Set Variable            5
            ${cont}=          Procura dia             ${Valor_campos_agendamento.dia}        ${aux}
            Click             xpath=${table}div[${cont}]/div[2]/table/tbody/tr[1]/td[5]${fim}
        END



informe o usuario de serviço ${VALOR}
    Click                            xpath=${Campos_agendamento.usuario_de_servico1}
    Type Text                        xpath=${Campos_agendamento.usuario_de_servico2}        ${VALOR}
    Sleep   3s
    Click                            id=${Buttons_agendamento.selecionar_usuario}

adicionar observação ao comprovante de agendamento e e-mail
    Click    xpath=${Buttons_agendamento.adicionar_observacao}

informar a observação do ${VALOR}
    Fill Text           xpath=${Campos_agendamento.observacao}          ${VALOR}

clicar em ${CAMPO}
    Click    xpath=${CAMPO}

imprimir comprovante de agendamento ${CAMPO}
    Click     xpath=${CAMPO}
    ${previous} =    Switch Page              NEW
    Close Page          CURRENT

avisar por email ${CAMPO}
    Click     xpath=${CAMPO}


informar qual o tipo de consulta ${VALOR}
    Click               xpath=${Campos_agendamento.consulta}
    ${VALOR} =	    Convert To Upper Case          ${VALOR}
    Log To Console     ${VALOR}
       IF       '${VALOR}' == 'PRIMEIRA VEZ'
           ${idconsultas}      Set Variable            1
          Click           xpath=${Campos_agendamento.identificador_consulta}/a[${idconsultas}]
       ELSE IF    '${VALOR}' == 'RETORNO'
           ${idconsultas}      Set Variable            2
           Click          xpath=${Campos_agendamento.identificador_consulta}/a[${idconsultas}]
       ELSE
           ${idconsultas}      Set Variable            3
           Click          xpath=${Campos_agendamento.identificador_consulta}/a[${idconsultas}]
       END

realizar o cancelamento

      FOR    ${i}    IN RANGE    9999999
        ${mes_cancelamento}=             Get Text             id=${Agendamento.mes_do_cancelamento}
        @{lista_mes_cancelamento} =	    Split String	      ${mes_cancelamento}

        ${mes_auxc} =           retirar zero esquerda        ${Valor_campos_agendamento.mes_c}
        ${mes_auxc2} =           Mês Convertion               ${mes_auxc}


        Exit For Loop If    '${lista_mes_cancelamento[0]}' == '${mes_auxc2}' and '${lista_mes_cancelamento[2]}' == '${Valor_campos_agendamento.ano_c}'

       ${mes_verc} = 	Get Current Date	        result_format=%m
       ${mes_verc} =     retirar zero esquerda       ${mes_verc}
       ${mes_ver2c} =    retirar zero esquerda       ${Valor_campos_agendamento.mes_c}


        IF  ${mes_ver2c} > ${mes_verc}
            Click       id=${Agendamento.avancar}
        ELSE IF     ${mes_ver2c} < ${mes_verc}
            Click       id=${Agendamento.voltar}
        END
    END

    ${diadasemana}         Date Convertion         ${Valor_campos_agendamento.ano_c}/${Valor_campos_agendamento.mes_c}/${Valor_campos_agendamento.dia_c}

        IF     '${diadasemana}' == 'Segunda-feira'
            ${aux}            Set Variable            1
            ${cont}=          Procura dia             ${Valor_campos_agendamento.dia}        ${aux}
            Click             xpath=${table}div[${cont}]/div[2]/table/tbody/tr[1]/td[1]${fim}
        ELSE IF     '${diadasemana}' == 'Terça-feira'
            ${aux}            Set Variable            2
            ${cont}=          Procura dia             ${Valor_campos_agendamento.dia}        ${aux}
            Click             xpath=${table}div[${cont}]/div[2]/table/tbody/tr[1]/td[2]${fim}
        ELSE IF     '${diadasemana}' == 'Quarta-feira'
            ${aux}            Set Variable            3
            ${cont}=          Procura dia             ${Valor_campos_agendamento.dia}        ${aux}
            Click             xpath=${table}div[${cont}]/div[2]/table/tbody/tr[1]/td[3]${fim}
        ELSE IF     '${diadasemana}' == 'Quinta-feira'
            ${aux}            Set Variable            4
            ${cont}=          Procura dia             ${Valor_campos_agendamento.dia}        ${aux}
            Click             xpath=${table}div[${cont}]/div[2]/table/tbody/tr[1]/td[4]${fim}
        ELSE IF     '${diadasemana}' == 'Sexta-feira'
            ${aux}            Set Variable            5
            ${cont}=          Procura dia             ${Valor_campos_agendamento.dia}        ${aux}
            Click             xpath=${table}div[${cont}]/div[2]/table/tbody/tr[1]/td[5]${fim}
        END

informar os status do agendamento ${VALOR}
    Click              id=${Buttons_agendamento.status}
    ${VALOR} =	    Convert To Upper Case                       ${VALOR}
        IF          '${VALOR}'=='AGENDADO'
            ${idstatus}      Set Variable            1
           Click           xpath=${Campos_agendamento.identificador_status}/a[${idstatus}]     
        ELSE IF     '${VALOR}'=='ATENDIDO'
            ${idstatus}      Set Variable            2
            Click          xpath=${Campos_agendamento.identificador_status}/a[${idstatus}]       
        ELSE IF     '${VALOR}'=='CANCELADO'
            ${idstatus}      Set Variable            3
            Click          xpath=${Campos_agendamento.identificador_status}/a[${idstatus}]  
        ELSE IF     '${VALOR}'=='COMPARECEU'
            ${idstatus}      Set Variable            4
            Click          xpath=${Campos_agendamento.identificador_status}/a[${idstatus}]     
        ELSE
            ${idstatus}      Set Variable            5
            Click          xpath=${Campos_agendamento.identificador_status}/a[${idstatus}]  
        END

informar a justificativa do cancelamento ${VALOR}
    Fill Text           xpath=${Campos_agendamento.justificativa}        ${VALOR}        
