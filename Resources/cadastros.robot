***Settings***
Documentation       Keywords cadastros

***Keywords***

informar os dadosaaaaa ${dados}
   ${dados_json}    Get JSON        cadastros.json
    ${dados}        Set Variable    ${dados_json[${dados}]}
    FOR              ${item}         IN                         @{dados}
        FOR              ${key}          IN                         @{item.keys()}
               # Run Keyword If     '${key}' == 'inputEmail' or '${key}' == 'inputNome' 
                #IF      "${lista_campos}" == "CPF"     
                IF    '${keyy}' == 'inputNome' or '${keyy}' == 'inputNome'   
                    ${CPF}            FakerLibrary.cpf
                    Type Text         id=${keyy}          ${CPF}
            #ELSE IF     "${item}" == "inputEmail"
             #   ${EMAIL}            FakerLibrary.Email
              #  Type Text         id=${item}       ${EMAIL}
            #ELSE
             #   ${NOME}            FakerLibrary.Nome
              #  Type Text        id=${item}      FakerLibrary.Name
            
            END
                END

        END
    END
    
    Sleep   10

