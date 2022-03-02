***Settings***
Documentation       Agendamento

Resource            ${EXECDIR}/Resources/Page_agendamento_functions.robot

Library             ${EXECDIR}/Librarys/verificacoes.py

*** Variables ***


&{Agendamento}
...  mes_do_agendamento=nomemes
...  avancar=btNext
...  voltar=btPrevious


&{Filtro_agendamentos}
...  disponiveis=DISPONIVEIS
...  agendados=AGENDADOS
...  identificador=//*[@id="calendario"]/section/div/div/div/div/div[1]/div/


&{Campos_agendamento}
...  filtro_modalidade_inseir=//*[@id="filtro-modal"]/div/div/div[2]/form/div[2]/div/div/div[1]/input
...  usuario_de_servico1= //*[@id="autocompletUsuario"]/div/button/div/div/div
...  usuario_de_servico2= //*[@id="autocompletUsuario"]/div/div/div[1]/input

&{Valor_campos_agendamento}
...  filtro_modalidade=Nutrição
...  dia=18
...  mes=05
...  ano=2022
...  usuario_de_servico2=Mayara

&{Buttons_agendamento}
...  deselecionar_todas=//*[@id="filtro-modal"]/div/div/div[2]/form/div[2]/div/div/div[2]/div/button[2]
...  selecionar_modalidade=bs-select-5-10
...  aplicar_filtro=//*[@id="filtro-modal"]/div/div/div[3]/button[1]
...  filtro_busca=//*[@id="calendario"]/section/div/div/div/div/div[1]/div/span[9]
...  filtro_modalidade=//*[@id="filtro-modal"]/div/div/div[2]/form/div[2]/div/button/div/div/div
...  selecionar_usuario=bs-select-4

***Keywords***

filtrar ${VALOR}
   IF   "${VALOR}" == "${Filtro_agendamentos.disponiveis}"
        FOR    ${contador}    IN RANGE    1  5
            Click         xpath=${Filtro_agendamentos.identificador}span[${contador}]/i[2]
        END
    ELSE IF  "${VALOR}" == "${Filtro_agendamentos.agendados}"
        FOR    ${contador}    IN RANGE    2  6
            Click         xpath==${Filtro_agendamentos.identificador}span[${contador}]/i[2]
        END
    END

informar modalidade para o filtro ${VALOR}
    Click           xpath=${Buttons_agendamento.filtro_busca}
    Click           xpath=${Buttons_agendamento.filtro_modalidade}
    Click           xpath=${Buttons_agendamento.deselecionar_todas}
    Fill Text       xpath=${Campos_agendamento.filtro_modalidade_inseir}        ${VALOR}
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
            ${aux}            Set Variable            2
            ${cont}=          Procura dia             ${Valor_campos_agendamento.dia}        ${aux}
            Click             xpath=${table}div[${cont}]/div[2]/table/tbody/tr[1]/td[2]${fim}
        ELSE IF     '${diadasemana}' == 'Terça-feira'
            ${aux}            Set Variable            3
            ${cont}=          Procura dia             ${Valor_campos_agendamento.dia}        ${aux}
            Click             xpath=${table}div[${cont}]/div[2]/table/tbody/tr[1]/td[3]${fim}
        ELSE IF     '${diadasemana}' == 'Quarta-feira'
            ${aux}            Set Variable            4
            ${cont}=          Procura dia             ${Valor_campos_agendamento.dia}        ${aux}
            Click             xpath=${table}div[${cont}]/div[2]/table/tbody/tr[1]/td[4]${fim}
        ELSE IF     '${diadasemana}' == 'Quinta-feira'
            ${aux}            Set Variable            5
            ${cont}=          Procura dia             ${Valor_campos_agendamento.dia}        ${aux}
            Click             xpath=${table}div[${cont}]/div[2]/table/tbody/tr[1]/td[5]${fim}
        ELSE IF     '${diadasemana}' == 'Sexta-feira'
            ${aux}            Set Variable            6
            ${cont}=          Procura dia             ${Valor_campos_agendamento.dia}        ${aux}
            Click             xpath=${table}div[${cont}]/div[2]/table/tbody/tr[1]/td[6]${fim}
        END

informe o usuario de serviço ${VALOR}
    Click                            xpath=${Campos_agendamento.usuario_de_servico1}
    Type Text                        xpath=${Campos_agendamento.usuario_de_servico2}        ${VALOR}
    Sleep   3s
    Click                            id=${Buttons_agendamento.selecionar_usuario}

