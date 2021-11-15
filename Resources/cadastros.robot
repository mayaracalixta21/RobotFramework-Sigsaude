***Settings***
Documentation       Keywords cadastros

Resource        ${EXECDIR}/Resources/Keywords.robot

Library         FakerLibrary    locale=pt_BR

***Keywords***

informar os dados cadastrais "${dados}"
  ${dados_json}    Get JSON        cadastros.json
  ${dados}         Set Variable    ${dados_json["${dados}"]}
  FOR              ${item}         IN                         @{dados}
      FOR              ${key}          IN                         @{item.keys()}
         # Type Text        id=${key}       ${item["${key}"]}
         ${aux}     FakerLibrary.Word 
         Type Text        id=${key}         ${aux} 
     END
  END

selecionar no menu ocupações "${opção}"
  ${elementos_json}               Get JSON                                                        elementos.json
  Click                           xpath=${elementos_json["Ocupa_antes"]} 
  #Click                           xpath=//*[@id="regForm"]/div/div[4]/div[1]/div[4]/div[2]/div/div/div[2]/div/button[1]
  FOR     ${cont}    IN RANGE    0  4      
    Click                           xpath=//*[@id="bs-select-1-${cont}"]
  END
  Click                           xpath=//*[@id="regForm"]/div/div[1]/h3
