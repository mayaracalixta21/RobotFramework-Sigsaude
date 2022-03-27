***Settings***
Documentation     Minha agenda

*** Variables ***

&{Campos_agenda}
...  data_listagem=dataListagem

&{Valor_campos_agenda}
...  data_listagem=11032022

&{Buttons_agenda}
...  pesquisar=//*[@id="formApp"]/div/div[3]/button
...  DS=//*//*[@id="dataTable"]/tbody/tr/td[5]/div/a[1]
...  DBS=//*[@id="dataTable"]/tbody/tr/td[5]/div/a[2]
...  atendimento=//*[@id="atendimento9524"]
...  sim=//*[@id="html"]/body/div[2]/div/div[4]/div[2]/button

***Keywords***
iniciar atendiemto
    Click               xpath=${Buttons_agenda.sim}

