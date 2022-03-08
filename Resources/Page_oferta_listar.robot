***Settings***
Documentation       Agendamento

Resource        ${EXECDIR}/Resources/Page_oferta_cadastro.robot
Resource        ${EXECDIR}/Resources/Page_profissional_cadastro.robot

Library             ${EXECDIR}/Librarys/verificacoes.py

*** Variables ***

&{Campos_escala}
...  denominacao=escala
...  tipo_atendimento=tipoAtendimento
...  profissional1=//*[@id="profDiv"]/div/button/div/div/div
...  profissional2=//*[@id="profDiv"]/div/div/div[1]/input
...  selecionar_profissional=bs-select-1-0

&{Valor_campos_escala}
...  denominacao=${Valor_campos_oferta.descricao_escala}
...  tipo_atendimento=Profissional de saúde
...  profissional2=${Valor_campos_profissional.nome}

&{Buttons_escala}
...  pesquisar=pesquisarOfertaDeAtendimento
...  registrar_escala=//*[@id="dataTable"]/tbody/tr/td[4]/div/a[1]
...  consultar=buttonConsulta
...  sim=/html/body/div[2]/div/div[4]/div[2]/button


***Keywords***

informar profissional ${VALOR}
    Click                          xpath=${Campos_escala.profissional1}
    Fill Text                      xpath=${Campos_escala.profissional2}              ${VALOR}
    Click                          id=${Campos_escala.selecionar_profissional}

adicionar horario
    FOR     ${cont}    IN RANGE    3   8
        Click           xpath=//*[@id="calendar"]/div[2]/div/table/tbody/tr/td/div/div/div[3]/table/tbody/tr/td[${cont}]/div/div[2]/a[1]/div/div
        Click           xpath=${Buttons_escala.sim}
    END
