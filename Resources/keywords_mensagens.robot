***Settings***
Documentation    Arquivo de keywords de mensagens

***Keywords***

deve mostrar a mensagem "${mensagem}"
    ${elementos_json}    Get JSON                             elementos.json
    Get Text             css=${elementos_json["Mensagem"]}    contains          ${mensagem}

o sistema deve exibir a mensagem "${mensagem}"
    ${elementos_json}    Get JSON                             elementos.json
    Get Text             id=${elementos_json["Nenhum registro encontrado"]}     contains          ${mensagem}

o sistema deve mostrar a mensagem "${mensagem}"
    ${mensagem2} =	              Convert To Upper Case                                  ${mensagem}
    ${elementos_json}             Get JSON                                               elementos.json
    Get Text                      id=${elementos_json["Nenhum registro encontrado"]}     contains          ${mensagem2}

deve haver no campo "${campo}" a mensagem "${mensagem}"
    ${elementos_json}    Get JSON                             elementos.json
    Get Text             css=${elementos_json["${campo}"]}    contains          ${mensagem}

deve mostrar a mensagem externa "${mensagem}"
    ${elementos_json}    Get JSON                                          elementos.json
    Get Text             css=${elementos_json["Mensagem Externa Loja"]}    contains          ${mensagem}
