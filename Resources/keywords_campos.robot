***Settings***
Documentation       Keywords cadastros

Resource        ${EXECDIR}/Resources/Keywords.robot
Library         String 

***Variables***
#${elementos_json}         Get JSON                                   elementos.json

***Keywords***

preenchido o "${campo}" com o "${valor}"
    ${elementos_json}         Get JSON                                   elementos.json
    Type Text                 id=${elementos_json["${campo}"]}           ${valor}   

preenchido o campo "${campo}" com o "${valor}"
    ${elementos_json}         Get JSON                                          elementos.json
    Type Text                 css=[name='${elementos_json["${campo}"]}']        ${valor}    
 
preencher o campo "${campo}" com o "${valor}"
    ${elementos_json}         Get JSON                                          elementos.json
    Type Text                  xpath=${elementos_json["${campo}"]}              ${valor}    

selecione "${valor}" no campo "${campo}"
    ${elementos_json}         Get JSON                                   elementos.json
    Select Options By         id=${elementos_json["${campo}"]}           Text                   ${valor}
   
clicar em "${botão}" 
    ${elementos_json}         Get JSON                                   elementos.json
    Click                     css=${elementos_json["${botão}"]}

clicar no "${botão}" 
    ${elementos_json}         Get JSON                                   elementos.json
    Click                     id=${elementos_json["${botão}"]}

dar um click no botão Salvar
    # ${elementos_json}         Get JSON                                   elementos.json
    #Click                     xpath=${elementos_json["${botão}"]}
    Click                     xpath= //*[@id="botoesModal"]/button[1]

dar um click no "${botão_i}"
    ${elementos_json}         Get JSON                                   elementos.json
    Click                     xpath=${elementos_json["${botão_i}"]}

selecionar o checkbox "${checkbox}"
    ${elementos_json}         Get JSON                                   elementos.json
    Check checkbox            id=${elementos_json["${checkbox}"]} 

mensagem de inatição realizada com sucesso
    mensagem de cadastro realizado com sucesso

mensagem de cadastro realizado com sucesso  
    Wait For Elements State     xpath=/html/body/div[2]/div                    visible   
    Click                       xpath=/html/body/div[2]/div/div[3]/div/button
    #Handle Future Dialogs       action=accept

confirmação do envio do email "${opção}" 
    ${opção} =	                        Convert To Upper Case                ${opção}
    ${elementos_json}         Get JSON                                   elementos.json
    Wait For Elements State         xpath=${elementos_json["Mensagem"]}       visible 
    IF      '${opção}' == 'SIM'   
        Click                           xpath=${elementos_json["Sim"]} 
    END

capturar código do usuario de serviço
    ${elementos_json}            Get JSON                     elementos.json
    ${codigo}=                   Get Text                     xpath=${elementos_json["Codigo usuario de serviço"]}    
    @{lista_info_cods} =	     Split String	              ${codigo} 
    ${codigo_usuario}=           Set Variable                 ${lista_info_cods[2]}
    Set Global Variable          ${codigo_usuario}                        

a mensagem de sucesso aparece na tela
    a mensagem de e-mail enviado aparece na tela 

a mensagem de e-mail enviado aparece na tela 
    Wait For Elements State         css=.toast-message         visible           
    #${aux_teste}=        Get Text                    css=.toast-message
    #Log to console      ${aux_teste}  

a mensagem de impressão do comprovante de agendamento "${opção_p}" 
   confirmação do envio do email "${opção_p}" 

o campo "${campo}" na lista deve ser "${valor}"
    ${valor2} =	                    Convert To Upper Case                ${valor}
    ${elementos_json}               Get JSON                                                        elementos.json
    Get Text                        css=${elementos_json["${campo}"]}                               contains                ${valor2}      
    #Wait For Elements State         xpath= //*[@id="dataTable"]/tbody/tr[1]/td[4]/div/a[6]          visible                  6   

o campo "${campo}" deve ser igual a "${valor}"
    ${valor2} =	                        Convert To Upper Case                ${valor}
    ${elementos_json}                   Get JSON                                                           elementos.json
    Get Text                            id=${elementos_json["${campo}"]}                                   contains                 ${valor2} 
    
    IF      '${campo}' == 'Nome na tabela'
        Wait For Elements State             xpath=//*[@id="dataTable"]/tbody/tr[1]/td[4]/div/a[6]             visible                    
    ELSE IF     '${campo}' == 'Nome na tabela colaborador'
        Wait For Elements State             xpath=//*[@id="dataTable"]/tbody/tr[1]/td[4]/div/a[1]             visible                    
    END

selecionar opções em "${opção}"
    ${elementos_json}               Get JSON                elementos.json
    Click          id=${elementos_json["${opção}"]}  
    Click          css=${elementos_json["Opções procedimento"]} 
    