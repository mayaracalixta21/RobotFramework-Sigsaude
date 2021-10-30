***Settings***
Documentation      Teste download

Library         Browser

***Test Cases***

[000] - Teste download
    New Browser         chromium        False  
    New page            https://pt-br.imgbb.com/
    ${promise}=    Promise To Upload File           ${CURDIR}/Arquivos/b.png
    Click          xpath=//*[@id="home-cover-content"]/div[2]/a
    ${upload_result}=  Wait For  ${promise}
    Sleep       20s



