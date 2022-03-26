***Settings***
Documentation       Keywords login

Resource        ${EXECDIR}/Resources/Keywords.robot
Library         OperatingSystem
Library             Browser

**Keywords**
que o usuario está na tela login
    iniciar Navegador
    ${config_json}         Get JSON                   config.json 
    New page              ${config_json["base_url"]}
    Direcionamento da tela "login" 

preecher os dados de login do usuario "${login_usuario}" 
    ${login_json}         Get JSON                          login.json 
    Fill Text             id=login-username                 ${login_json["${login_usuario}"]["login"]}
    Fill Text             id=login-password                 ${login_json["${login_usuario}"]["senha"]}
    
clicar no botão "${botão}"
    Click                 css=[value='${botão}']

mostra a tela inicial do sistema 
    Wait For Elements State         css=#nomeUser         visible     6