***Settings***
Documentation       Keywords base

Resource        ${EXECDIR}/Resources/Keywords.robot

Library           Collections


***Variables***   
${table} =           //*[@id="calendar"]/div/div/table/tbody/tr/td/div/div/
${fim} =             /a/div/div
${aux} 
${idconsultas}

***Keywords***

informar o dia:"${dia_a}", mês:"${mês_a}" e o ano:"${ano_a}" para realizar o atendimento
    informar o dia:"${dia_a}", mês:"${mês_a}" e o ano:"${ano_a}" para realizar o agendamento

informar o dia:"${dia_c}", mês:"${mês_c}" e o ano:"${ano_c}" para realizar o cancelamento
    informar o dia:"${dia_c}", mês:"${mês_c}" e o ano:"${ano_c}" para realizar o agendamento

informar o dia:"${dia}", mês:"${mês}" e o ano:"${ano}" para realizar o agendamento

   ${elementos_json}         Get JSON               elementos.json 
   ${mês_aux}                Mês Convertion         ${mês}
   
    FOR    ${i}    IN RANGE    9999999
        ${mês_agendamento}=             Get Text             id=${elementos_json["Mês do agendamento"]}   
        @{lista_mês_agendamento} =	    Split String	      ${mês_agendamento} 
        
        Exit For Loop If    '${lista_mês_agendamento[0]}' == '${mês_aux}' and '${lista_mês_agendamento[2]}' == '${ano}'
       
       ${mês_ver} = 	Get Current Date	result_format=%m
        
        IF  ${mês} > ${mês_ver} 
            Click       id=btNext
        ELSE IF     ${mês} < ${mês_ver} 
            Click       id=btPrevious
        END
    END

   # filtrar ${Filtro_agendamentos.disponiveis}

        ${diadasemana}         Date Convertion         ${ano}/${mês}/${dia}

        IF     '${diadasemana}' == 'Segunda-feira'      
            ${aux}            Set Variable            2
            ${cont}=          Procura dia             ${dia}        ${aux} 
            Click             xpath=${table}div[${cont}]/div[2]/table/tbody/tr[1]/td[2]${fim}
        ELSE IF     '${diadasemana}' == 'Terça-feira'  
            ${aux}            Set Variable            3
            ${cont}=          Procura dia             ${dia}        ${aux} 
            Click             xpath=${table}div[${cont}]/div[2]/table/tbody/tr[1]/td[3]${fim}
        ELSE IF     '${diadasemana}' == 'Quarta-feira'  
            ${aux}            Set Variable            4
            ${cont}=          Procura dia             ${dia}        ${aux} 
            Click             xpath=${table}div[${cont}]/div[2]/table/tbody/tr[1]/td[4]${fim}   
        ELSE IF     '${diadasemana}' == 'Quinta-feira'  
            ${aux}            Set Variable            5
            ${cont}=          Procura dia             ${dia}        ${aux} 
            Click             xpath=${table}div[${cont}]/div[2]/table/tbody/tr[1]/td[5]${fim}    
        ELSE IF     '${diadasemana}' == 'Sexta-feira'  
            ${aux}            Set Variable            6
            ${cont}=          Procura dia             ${dia}        ${aux} 
            Click             xpath=${table}div[${cont}]/div[2]/table/tbody/tr[1]/td[6]${fim}           
        END
        
informar o usuario de serviço "${usuario}"
    Click            xpath=//*[@id="autocompletUsuario"]/div/button/div/div/div
    Type Text        xpath=//*[@id="autocompletUsuario"]/div/div/div[1]/input       ${usuario}
    Sleep            5s
    Click            id=bs-select-4      





informar o tipo de consulta "${consulta}"
    Click               xpath=//*[@id="cfg_atendimento"]/button
    ${consulta} =	    Convert To Upper Case                       ${consulta}
        IF          '${consulta}'=='PRIMEIRA VEZ'
            ${idconsultas}      Set Variable            1
           Click           xpath=//*[@id="listTipoAtendimento"]/a[${idconsultas}]      
        ELSE IF     '${consulta}'=='RETORNO'
            ${idconsultas}      Set Variable            2
            Click          xpath=//*[@id="listTipoAtendimento"]/a[${idconsultas}]       
        ELSE
            ${idconsultas}      Set Variable            3
            Click          xpath=//*[@id="listTipoAtendimento"]/a[${idconsultas}]       
        END

informar os status do agendamento "${status}"
    Click              id=cfg_status
    ${status} =	    Convert To Upper Case                       ${status}
        IF          '${status}'=='AGENDADO'
            ${idstatus}      Set Variable            1
           Click           xpath=//*[@id="listStatus"]/a[${idstatus}]     
        ELSE IF     '${status}'=='ATENDIDO'
            ${idstatus}      Set Variable            2
            Click          xpath=//*[@id="listStatus"]/a[${idstatus}]       
        ELSE IF     '${status}'=='CANCELADO'
            ${idstatus}      Set Variable            3
            Click          xpath=//*[@id="listStatus"]/a[${idstatus}]  
        ELSE IF     '${status}'=='COMPARECEU'
            ${idstatus}      Set Variable            4
            Click          xpath=//*[@id="listStatus"]/a[${idstatus}]     
        ELSE 
            ${idstatus}      Set Variable            5
            Click          xpath=//*[@id="listStatus"]/a[${idstatus}]  
        END

