*** Settings ***
Documentation     Atualização da dashboard

Library           RPA.Cloud.Google

*** Variables ***
${SHEET_ID}          1GceBbjnkBCTczBW52Fki5sT6k2hCMp6qy8UJEuvHkzE

***Keywords***
Atualizar dash falha ${contador3} 

        ${values}   Evaluate   [['Falhou']]
        Clear Sheet Values     ${SHEET_ID}  B${contador3}
        Insert Sheet Values    ${SHEET_ID}  B${contador3}  ${values}
        ${DATA}         Get Current Date
        ${DATA}         Evaluate   [['${DATA}']]
        Clear Sheet Values     ${SHEET_ID}  C${contador3}
        Insert Sheet Values   ${SHEET_ID}   C${contador3}  ${DATA}


Atualizar dash sucesso ${contador1}
    ${values}   Evaluate   [['Sucesso']]
    Clear Sheet Values     ${SHEET_ID}  B${contador1}
    Insert Sheet Values    ${SHEET_ID}  B${contador1}  ${values}
    ${DATA}         Get Current Date
    ${DATA}         Evaluate   [['${DATA}']]
    Clear Sheet Values     ${SHEET_ID}  C${contador1}
    Insert Sheet Values   ${SHEET_ID}   C${contador1}  ${DATA}


Atualizar dash não testado ${contador2}
    ${values}   Evaluate   [['Não testado']]
    Clear Sheet Values     ${SHEET_ID}  B${contador2}
    Insert Sheet Values    ${SHEET_ID}  B${contador2}  ${values}
    ${DATA}         Get Current Date
    ${DATA}         Evaluate   [['${DATA}']]
    Clear Sheet Values     ${SHEET_ID}  C${contador2}
    Insert Sheet Values   ${SHEET_ID}   C${contador2}  ${DATA}