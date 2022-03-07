***Settings***
Documentation       Manipulando datas

Library     DateTime

**Keywords***



Procura dia
    [Arguments]        ${dia}           ${aux} 

        FOR    ${contador3}    IN RANGE    1     7
            ${aux_2}      Get Text       xpath=//*[@id="calendar"]/div/div/table/tbody/tr/td/div/div/div[${contador3}]/div[2]/table/thead/tr/td[${aux}]/a
            
            #${dia} =       retirar zero esquerda       ${dia}
            #${aux_2} =     retirar zero esquerda       ${aux_2}
            
            #${dia} =       Convert To Number       ${dia}
            #${aux_2} =     Convert To Number       ${aux_2}
            
            #IF       ${aux_2} < 10
            #    ${aux_2}=       Set Variable        0${aux_2}
            #END
            ${dia_2} =       retirar zero esquerda       ${dia}
            ${aux_3} =      retirar zero esquerda       ${aux_2}
            ${dia_2} =       Convert To Number       ${dia_2}
            ${aux_3} =       Convert To Number       ${aux_3}

            IF    '${dia_2}'=='${aux_3}'
                Exit For Loop
            END

        END
          #  Log To console   Final variavel controle: ${aux_3}

    [Return]   ${contador3}

Mês Convertion 
    [Arguments]        ${mes}
        IF      '${mes}' == '1'
            ${mes}     Set Variable    Janeiro
        ELSE IF     '${mes}' == '2'
            ${mes}     Set Variable    Fevereiro
        ELSE IF     '${mes}' == '3'
            ${mes}     mes Variable    Março
        ELSE IF     '${mes}' == '4'
            ${mes}     Set Variable    Abril
        ELSE IF     '${mes}' == '5'
            ${mes}     Set Variable    Maio
        ELSE IF     '${mes}' == '6'
            ${mes}     Set Variable    Junho
        ELSE IF     '${mes}' == '7'
            ${mes}     Set Variable    Julho
         ELSE IF     '${mes}'== '8'
            ${mes}     mes Variable    Agosto
        ELSE IF     '${mes}' == '9'
            ${mes}     Set Variable    Setembro
        ELSE IF     '${mes}' == '10'
            ${mes}     Set Variable    Outubro
        ELSE IF     '${mes}' == '11'
            ${mes}     Set Variable    Novembro
        ELSE IF     '${mes}' == '12'
            ${mes}     Set Variable    Dezembro
        END
    [Return]   ${mes}
    
Date Convertion 
       [Arguments]        ${Date}
       ${day}=    Convert Date    ${Date}    result_format=%a
            IF      '${day}' == 'Mon'
                ${day}     Set Variable    Segunda-feira
            ELSE IF     '${day}' == 'Tue'
                ${day}     Set Variable    Terça-feira
            ELSE IF     '${day}' == 'Wed'
                ${day}     Set Variable    Quarta-feira
            ELSE IF     '${day}' == 'Thu'
                ${day}     Set Variable    Quinta-feira
            ELSE IF     '${day}' == 'Fri'
                ${day}     Set Variable    Sexta-feira
                 ELSE IF     '${day}' == 'Sat'
                ${day}     Set Variable    Sábado
            ELSE IF     '${day}' == 'Sun'
                ${day}     Set Variable    Domingo
            END
       [Return]   ${day}


Teste lógica Agendamento


    FOR    ${contador}    IN RANGE    3   10

        ${teste}    Set Variable        ${contador} 
        ${data1}    Set Variable    2021/10/0${teste}
        Log To Console	 ${data1} 
        
         ${data}         Date Convertion          ${data1} 
         Log To Console	 ${data} 
    END


    ${data1}        Set Variable         2021 / 10 / 03
    @{words} =	    Split String	      ${data1}	
         
    Log To Console	 ${words[0]}
    
    ${ano}    Set Variable          ${words[0]}
    ${mes}    Set Variable          ${words[2]}
    ${dia}    Set Variable          ${words[4]}

     ${data}         Date Convertion         ${dia}/${mes}/${ano}
     Log To Console	 ${data} 