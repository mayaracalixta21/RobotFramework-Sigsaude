***Settings***
Library         RequestsLibrary
Library         Collections
Suite Setup     Conectar API

***Variables***
${URL_API}               https://swapi.dev/api/

***Test Cases***
Acessando API
    Requisitar
    conferir status code        200
    Conferir reason     OK
    conferir se há item     Luke Skywalker


***Keywords***
Conectar API
    Create session        fakeAPI       ${URL_API}

Requisitar
    ${RESPOSTA}       GET On Session      fakeAPI        people/1/
    Log         ${RESPOSTA.json()}
    Set Test Variable           ${RESPOSTA}

conferir status code
    [Arguments]         ${STATUSCODE_DESEJADO}
    Should Be Equal As Strings     ${RESPOSTA.status_code}          ${STATUSCODE_DESEJADO}

conferir reason
    [Arguments]         ${REASON_DESEJADO}
    Should Be Equal     ${RESPOSTA.reason}          ${REASON_DESEJADO}

conferir se há item
    [Arguments]         ${ITEM_DESEJADO}
    Dictionary Should Contain Value     ${RESPOSTA.json()}     ${ITEM_DESEJADO}