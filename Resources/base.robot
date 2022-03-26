
***Settings***
Documentation       Keywords base
Resource        ${EXECDIR}/Resources/Keywords.robot
 
***Keywords***
Get JSON
    [Arguments]         ${file_name}
    
    ${file}             Get file             ${EXECDIR}/Files/${file_name}  
    ${super_var}        Evaluate              json.loads($file)                                         json
    [Return]            ${super_var}  

#Iniciar navegador sessão "${login_usuario}"
  #  Iniciar sessão no browser ${login_usuario} 

iniciar navegador sessão "${login_usuario}" 
    Iniciar Navegador
    ${config_json}         Get JSON                   config.json 
    New page              ${config_json["base_url"]}
    Direcionamento da tela "login" 
    ${login_json}         Get JSON                          login.json 
    Fill Text             id=login-username                 ${login_json["${login_usuario}"]["login"]}
    Fill Text             id=login-password                 ${login_json["${login_usuario}"]["senha"]}
    Click                 css=[value='Entrar']

iniciar Navegador
    ${config_json}         Get JSON                             config.json 
    New Browser            ${config_json["navegador"]}          False