***Settings***
Documentation      Teste download

Library         ${EXECDIR}/Librarys/verificacoes.py

***Test Cases***

#[000] - Teste download
#    New Browser         chromium        False  
#    New page            https://pt-br.imgbb.com/
#    ${promise}=    Promise To Upload File           ${CURDIR}/Arquivos/b.png
#    Click          xpath=//*[@id="home-cover-content"]/div[2]/a
#    ${upload_result}=  Wait For  ${promise}
#    Sleep       20s

#[000] - Teste nova library
#    ${teste}=       Set Variable            
#    ${aux}          campos vazios           ${teste}
#    IF              '${aux}' == 'true'
#        Log to console  "Deu certo caralho"
#    END
#    Log to console  "${aux}"

[000] - Teste nova library
         FOR         ${contador2}     IN RANGE    0  2

             
            ${aux}                  Set Variable         ${contador2}  
                adicionar lista                 ${aux}

        END

        @{aux2}          recuperar lista    
        Log to console  "Valor":${aux2[0]}
        Log to console  "Valor":${aux2[1]}

      

