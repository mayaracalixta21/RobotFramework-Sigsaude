***Settings***
Documentation       Cadastro dados da evolução

Resource        ${EXECDIR}/Resources/Page_config_iniciais.robot

*** Variables ***

&{Campos_EVO}
...  descricao_evolucao=descricaoEvolucao
...  desc_doc_evolucao=descDocEvolucao

&{Valor_campos_EVO}
...  descricao_evolucao=Teste automatizado
...  desc_doc_evolucao=Teste automatizado

&{Buttons_EVO}
...  avançar=/html/body/div/div[2]/div/div/section/div[2]/div[3]/div[2]/div/div/div[2]/div/div[5]/div/div/div[1]/form/div[3]/div/button[2]
...  cadastrar=/html/body/div/div[2]/div/div/section/div[2]/div[3]/div[2]/div/div/div[2]/div/div[5]/div/div/div[1]/form/div[3]/div/button[2]
...  add_doc_evo=docGeraisEvolucao
...  evolucao=e
...  add_up_doc=//*[@id="multistepFormE"]/div[2]/div[2]/div/div[2]/div[1]/div[1]/div[3]/button

***Keywords***

iniciar evolucao
    clicar no ${Buttons_EVO.evolucao}

informar descrição da conduta
    preencher o ${Campos_EVO.descricao_evolucao} com ${Valor_campos_EVO.descricao_evolucao}

informar os documentos da conduta
    preencher o ${Campos_EVO.desc_doc_evolucao} com ${Valor_campos_EVO.desc_doc_evolucao}
    upload de arquivo ${Buttons_EVO.add_doc_evo}
    clicar em ${Buttons_EVO.add_up_doc}

