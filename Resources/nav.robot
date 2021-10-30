***Settings***
Documentation       Navegação

**Keywords**

que o usuario está na tela "${tela}"
    Direcionamento da tela "${tela}"
    #Wait For Elements State         css=[value='Entrar']         visible    6 

Direcionamento da tela "${page}"
    ${telas_json}         Get JSON                                      telas.json 
    ${config_json}        Get JSON                                      config.json 
    Go to                 ${config_json["base_url"]}${telas_json["${page}"]}  
