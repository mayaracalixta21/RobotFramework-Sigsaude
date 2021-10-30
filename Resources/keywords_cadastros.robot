***Settings***
Documentation       Keywords cadastros

Resource        ${EXECDIR}/Resources/Keywords.robot

Library         FakerLibrary    locale=pt_BR

***Keywords***

informar os dados do "${tela}"
   
    ${dados_json}    Get JSON        cadastros.json
    ${dados}        Set Variable    ${dados_json["${tela}"]}

        FOR              ${item}         IN                         @{dados}
            FOR              ${key}          IN                         @{item.keys()}
                
                IF         '${key}' == 'checkboxDesconheceNomeMae' or '${key}' == 'checkboxDesconheceNomePai' or '${key}'== 'checkboxDeficiente' or '${key}' == 'checkboxNomeSocial' or '${key}' == 'checkboxGenero'
                Click        id=${key}

                ELSE IF     '${key}' == 'inputIdentidade' or '${key}' == 'inputSUSF' 
                  ${numbers}=     Evaluate     random.randint(0, sys.maxsize)      random
                   Type Text         id=${key}          ${numbers}
             
                ELSE IF     '${key}' == 'inputEmail'
                   ${email}                  FakerLibrary.Email
                   Type Text                id=${key}                   ${email}
                   Set Global Variable      ${email}

                ELSE IF     '${key}' == 'inputCPF'
                    ${cpf}             FakerLibrary.CPF
                    Type Text               id=${key}          ${cpf}
                    Set Global Variable     ${cpf}
               
                ELSE IF     '${key}' == 'inputNascimentoStr'
                    ${dia_u}             FakerLibrary.Day Of Month
                    ${mes_u}                  FakerLibrary.Month
                    ${ano_u}                  FakerLibrary.Year

                    IF  ${ano_u} >= 2002
                        ${ano_u}    Set Variable        1990
                    END
                        Type Text         id=${key}           ${dia_u}${mes_u}${ano_u}
             
                #ELSE IF    '${key}' == 'inputNome' or '${key}' == 'inputNomePai' or '${key}' == 'inputNomeMae' or '${key}' == 'inputLogin'
                #    ${Nomes}            FakerLibrary.Words
                #    Type Text         id=${key}          ${Nomes}        

                ELSE IF     '${key}' == 'inputLogin'
                        ${login_aux}                    FakerLibrary.Word
                        ${login_colaborador}            Set Variable                ${login_aux}_c1
                        Type Text                       id=${key}                                ${login_colaborador}
                        Set Global Variable             ${login_colaborador}        
                
                ELSE
                     Type Text        id=${key}         ${item["${key}"]}
                        IF          '${key}' == 'inputNome'      
                            Set Global Variable        ${nome}         ${item["${key}"]}
                        ELSE IF     '${key}' == 'inputNomeSocial'
                            Set Global Variable        ${nome_social}         ${item["${key}"]}
                        ELSE IF     '${key}' == 'inputNomeMae'
                            Set Global Variable        ${nome_filiação}         ${item["${key}"]}
                        END
                END

            END
        END     
 
informar endereço

  ${dados_json}    Get JSON        cadastros.json
  ${dados}        Set Variable    ${dados_json["Endereço"]}

    FOR              ${item}         IN                         @{dados}
         FOR              ${key}          IN                         @{item.keys()}
                IF      '${key}' == 'inputCEP'           
                    Type Text        id=${key}           ${item["${key}"]}
                    clicar no "Buscar"
                    Sleep  2
                ELSE IF     '${key}' == 'inputNumero' 
                     ${numbers}=     Evaluate     random.randint(0, sys.maxsize)      random
                     Type Text        id=${key}         ${numbers}
                ELSE IF     '${key}' == 'inputCPF' 
                    ${cpf}             FakerLibrary.CPF
                    Type Text          id=${key}            ${cpf}
                ELSE
                     Type Text        id=${key}         ${item["${key}"]}
                END

        END
    END     

informar contatos "${valor}"
  ${dados_json}    Get JSON        cadastros.json
  ${dados}        Set Variable    ${dados_json["Contato"]}
  
    FOR    ${contador}    IN RANGE    0    ${valor}

        FOR              ${item}         IN                         @{dados}
            FOR              ${key}          IN                         @{item.keys()}
                IF      '${key}' == 'inputTelefone'           
                    ${numeros}=      FakerLibrary.Phone Number
                    Type Text        id=${key}           ${numeros}
                    
                    IF          ${contador} == 1
                        selecionar o checkbox "SMS"
                    ELSE IF     ${contador} == 2
                        selecionar o checkbox "wpp"
                    ELSE IF     ${contador} == 3
                        selecionar o checkbox "Urgencia"
                    END

                ELSE
                    Type Text        id=${key}           ${item["${key}"]}_${contador}

                    clicar no "Adicionar contato" 
                    Sleep  2
                END

            END
        END

    END


Inativar usuario de serviço 
    que o usuario está na tela "listar usuarios de serviço"
    preenchido o "CPF" com o "${cpf}"
    clicar no "Pesquisar"
    o campo "Nome na tabela" na lista deve ser "${nome_social}"
    dar um click no "Botão Inativar"
    preenchido o "Justificativa para inativação" com o "Teste automatizado"
    dar um click no "Inativar"
    mensagem de inatição realizada com sucesso