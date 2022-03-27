***Settings***
Documentation       Cadastro socieconimocos

*** Variables ***

&{Campos_DS}
...  quantidade_de_moradores_da_residência=quantidadeDeMoradores
...  quantidade_de_pessoas_que_trabalham=quantidadeTrabalhadores
...  renda_familiar_total=quantidadeSalarios
...  possui_beneficio_social=possuiBeneficioSocial
...  beneficios_sociais1=//*[@id="multistepFormDS"]/div[3]/div[1]/div[3]/div[2]/div[1]/button/div/div/div
...  beneficios_sociais2=//*[@id="multistepFormDS"]/div[3]/div[1]/div[3]/div[2]/div[1]/div/div[1]/input
...  selecionar_beneficios_sociais=bs-select-1-0
...  grau_de_escolaridade=grauEscolaridade
...  instituição_de_ensino=instituicao
...  curso=curso
...  profissoes1=//*[@id="multistepFormDS"]/div[3]/div[2]/div[4]/div[1]/div/button/div/div/div
...  profissoes2=//*[@id="multistepFormDS"]/div[3]/div[2]/div[4]/div[1]/div/div/div[1]/input
...  selecionar_profissoes=//*[@id="bs-select-2"]/ul/li
...  outra_profissao=outraProfissao
...  ocupacoes1=//*[@id="multistepFormDS"]/div[3]/div[2]/div[5]/div[1]/div/button/div/div/div
...  ocupacoes2=//*[@id="multistepFormDS"]/div[3]/div[2]/div[5]/div[1]/div/div/div[1]/input
...  selecionar_ocupacoes=//*[@id="bs-select-3-0"]/span[2]
...  outra_ocupacao=outraOcupacao
...  informacoes_adicionais=informacoesAdicionais


&{Valor_campos_DS}
...  quantidade_de_moradores_da_residência=5
...  quantidade_de_pessoas_que_trabalham=2
...  renda_familiar_total=1000
...  possui_beneficio_social=SIM
...  beneficios_sociais2=ÁGUA PARA TODOS
...  grau_de_escolaridade=SUPERIOR GRADUAÇÃO INCOMPLETO
...  serie_ano=8
...  instituição_de_ensino=MUNICIPAL
...  curso=TESTE AUTOMATIZADO
...  profissoes2=OUTRA PROFISSÃO
...  outra_profissao=TESTE AUTOMATIZADO
...  ocupacoes2=OUTRA OCUPAÇÃO
...  outra_ocupacao=TESTE AUTOMATIZADO
...  informacoes_adicionais=TESTE AUTOMATIZADO


&{Buttons_DS}
...  avançar=nextBtn
...  cadastrar=nextBtn
...  OK=/html/body/div[2]/div/div[3]/div/button
...  alfabetizado=//*[@id="multistepFormDS"]/div[3]/div[2]/div[2]/div[1]/div/label[2]/span


***Keywords***

preencher o beneficio ${VALOR}
    Click               xpath=${Campos_DS.beneficios_sociais1}
    Fill Text           xpath=${Campos_DS.beneficios_sociais2}             ${VALOR}
    Click               id=${Campos_DS.selecionar_beneficios_sociais}

informar a profissao ${VALOR}
    Click               xpath=${Campos_DS.profissoes1}
    Fill Text           xpath=${Campos_DS.profissoes2}                      ${VALOR}
    Click               xpath=${Campos_DS.selecionar_profissoes}
    Click               xpath= //*[@id="multistepFormDS"]/div[3]/div[2]/div[2]/div[3]/label
informar a ocupacao ${VALOR}
    Click               xpath=${Campos_DS.ocupacoes1}
    Fill Text           xpath=${Campos_DS.ocupacoes2}                      ${VALOR}
    Click               xpath=${Campos_DS.selecionar_ocupacoes}
    Click               xpath= //*[@id="multistepFormDS"]/div[3]/div[2]/div[2]/div[3]/label
