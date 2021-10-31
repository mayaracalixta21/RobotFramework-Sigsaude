***Settings***
Documentation       Keywords variaveis

Resource            ${EXECDIR}/Resources/nav.robot
Resource            ${EXECDIR}/Resources/base.robot

Library         ${EXECDIR}/Librarys/verificacoes.py

***Variables***  
${descrição}

***Keywords***
Padrão descrição 
   # ${descrição}=       Get File      ${EXECDIR}/Resources/Auxiliar/descrição.txt         UTF-8           strict
    [Return]        ${descrição}

Verificar se campos estão vazios 
    [Arguments]        @{lista_campos}
        ${elementos_aten_json}         Get JSON                   elementos_aten.json
        ${tam}         Get Length	         ${lista_campos}
        FOR         ${contador2}     IN RANGE    0   ${tam}
            ${campo_verificar}      Get Text                      id=${elementos_aten_json["${lista_campos}[${contador2}]"]}     
            ${aux}                  campos vazios                 ${campo_verificar}
            adicionar lista                 ${aux}
        END
        @{aux2}          recuperar lista  
        FOR         ${contador2}     IN RANGE    0   ${tam}
            Should Contain	@{aux2}${contador2}  	true  
        END
  

Verificar se campos estão desabilitados 
    [Arguments]        @{lista_campos}
        ${elementos_aten_json}         Get JSON                   elementos_aten.json
        ${tam}         Get Length	         ${lista_campos}
        FOR         ${contador2}     IN RANGE    0   ${tam}
            ${aux}      Get Element State    id=${elementos_aten_json["${lista_campos}[${contador2}]"]}          disabled
            adicionar lista                 ${aux}
        END
         @{aux2}          recuperar lista  
        FOR         ${contador2}     IN RANGE    0   ${tam}
            Should Contain	@{aux2}${contador2}  	True
        END

    
        
