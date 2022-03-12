*** Settings ***
Documentation     An example robot that reads and writes data
...               into a Google Sheet document.
Library           RPA.Cloud.Google

*** Variables ***
${SHEET_ID}          1GceBbjnkBCTczBW52Fki5sT6k2hCMp6qy8UJEuvHkzE
#${SHEET_RANGE}       A1:A1
#${AUX}             Não testado


***Keywords***
Atualizar
    ${values}   Evaluate   [['Não testado']]
    Clear Sheet Values     ${SHEET_ID}  B2
    Insert Sheet Values    ${SHEET_ID}  B2  ${values}
    ${DATA}         Get Current Date
    ${DATA}         Evaluate   [['${DATA}']]
    Clear Sheet Values     ${SHEET_ID}  C2
    Insert Sheet Values   ${SHEET_ID}   C2  ${DATA}


Atualizar dash colaborador
    ${values}   Evaluate   [['Sucesso']]
    Clear Sheet Values     ${SHEET_ID}  B2
    Insert Sheet Values    ${SHEET_ID}  B2  ${values}
    ${DATA}         Get Current Date
    ${DATA}         Evaluate   [['${DATA}']]
    Clear Sheet Values     ${SHEET_ID}  C2
    Insert Sheet Values   ${SHEET_ID}   C2  ${DATA}