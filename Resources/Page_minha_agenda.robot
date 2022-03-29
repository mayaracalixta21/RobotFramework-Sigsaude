***Settings***
Documentation     Minha agenda

*** Variables ***

&{Campos_agenda}
...  data_listagem=dataListagem

&{Valor_campos_agenda}
...  data_listagem=01042022

&{Buttons_agenda}
...  pesquisar=//*[@id="formApp"]/div/div[3]/button
...  DS=//*//*[@id="dataTable"]/tbody/tr/td[5]/div/a[1]
...  DBS=//*[@id="dataTable"]/tbody/tr/td[5]/div/a[2]
...  atendimento=/html/body/div[1]/div[2]/div/div/section/div/div[2]/div/div/div/div[3]/div[2]/div[2]/div/table/tbody/tr/td[5]/div/a[3]
...  sim=//*[@id="html"]/body/div[2]/div/div[4]/div[2]/button

***Keywords***
iniciar atendimento
    Click               xpath=${Buttons_agenda.sim}

fora do horario
    Click               xpath=${Buttons_agenda.sim}

